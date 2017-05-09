//
//  WZTabBarViewController.m
//  wz-inke
//
//  Created by KDB on 2017/4/24.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import "WZTabBarViewController.h"
#import "WZTabBar.h"
#import "WZBaseNavViewController.h"
#import "WZLaunchViewController.h"
#import "RootTabBar.h"

@interface WZTabBarViewController ()<WZTabBarDelegate>

@property (nonatomic ,strong)WZTabBar *wzTabbar;

@end

@implementation WZTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载控制器
    
    [self configViewControllers];
    
    
    [self setValue:[RootTabBar new] forKeyPath:@"tabBar"];
    //加载tabbar
    [self.tabBar addSubview:self.wzTabbar];
    
    //tabbar的阴影线
//    [[UITabBar appearance]setBackgroundImage:[UIImage new]];
//    [[UITabBar appearance]setShadowImage:[UIImage new]];
}
-(void)configViewControllers
{
    NSMutableArray * array = [NSMutableArray arrayWithArray:@[@"WZMainViewController",@"WZMeViewController"]];
    
    for (NSInteger i = 0; i < array.count; i ++) {
        
        NSString *vcName = array[i];
        
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        
        WZBaseNavViewController *nav = [[WZBaseNavViewController alloc]initWithRootViewController:vc];
        
        [array replaceObjectAtIndex:i withObject:nav];
        
    }
    
    self.viewControllers = array;
    
}



-(void)tabbar:(WZTabBar *)tabbar clickButton:(WZItemType)index
{
    if (index != WZItemTypeLaunch) {
        self.selectedIndex = index - WZItemTypeLive;
        return;
    }
    
    WZLaunchViewController *vc = [[WZLaunchViewController alloc]init];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}
-(WZTabBar *)wzTabbar
{
    if (!_wzTabbar) {
        _wzTabbar = [[WZTabBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        _wzTabbar.delegate = self;
    }
    return _wzTabbar;
}


@end
