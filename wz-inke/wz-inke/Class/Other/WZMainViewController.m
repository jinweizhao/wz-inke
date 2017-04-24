//
//  WZMainViewController.m
//  wz-inke
//
//  Created by KDB on 2017/4/24.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import "WZMainViewController.h"
#import "WZMainTopView.h"

@interface WZMainViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@property (nonatomic ,strong)NSArray *dataList;

@property (nonatomic ,strong)WZMainTopView *topView;

@end

@implementation WZMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
}
-(void)initUI
{
    [self setupNav];
    
    [self setupChildViewControllers];
    
}
-(void)setupNav
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search_"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.navigationItem.titleView = self.topView;
    
}
-(void) setupChildViewControllers
{
    NSArray *vcNames = @[@"WZFocuseViewController",@"WZHotViewController",@"WZNearViewController"];
    
    for (NSInteger i = 0; i < vcNames.count; i ++) {
        NSString *vcName = vcNames[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc]init];
        vc.title = self.dataList[i];
        [self addChildViewController:vc];
    }
    
    //将子控制器的view加到mainvc.scrollview
    
    self.contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.dataList.count, 0);
    
    self.contentScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    
    //进入控制器加载第一个
    [self scrollViewDidEndDecelerating:self.contentScrollView];
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self scrollViewDidEndDecelerating:scrollView];
}
//减速结束时加载子控制器view
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat width = SCREEN_WIDTH;
    CGFloat height = SCREEN_HEIGHT;
    
    CGFloat offsetX = scrollView.contentOffset.x;
    
    NSInteger index = offsetX / width;
    
    [self.topView scrolling:index];
    
    UIViewController *vc = self.childViewControllers[index];
    
    if (vc.isViewLoaded) return;
    
    vc.view.frame = CGRectMake(offsetX, 0, width, height);
    
    [scrollView addSubview:vc.view];
}
-(WZMainTopView *)topView
{
    if (!_topView) {
        _topView = [[WZMainTopView alloc]initWithFrame:CGRectMake(0, 0, 200, 50) titleNames:self.dataList];
        
        @weakify(self);
        
        _topView.block = ^(NSInteger tag) {
            
            @strongify(self);
            
            CGPoint point =CGPointMake(tag * SCREEN_WIDTH, 0);
            
            [self.contentScrollView setContentOffset:point animated:YES];
            
        };
    }
    return _topView;
}
-(NSArray *)dataList
{
    if (!_dataList) {
        _dataList = @[@"关注",@"热门",@"附近"];
    }
    return _dataList;
}

@end
