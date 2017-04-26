//
//  WZNearViewController.m
//  wz-inke
//
//  Created by KDB on 2017/4/24.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import "WZNearViewController.h"
#import "WZLiveHandler.h"
#import "WZNearLiveCell.h"


#define kMargin 5
#define KItemWidth 100

@interface WZNearViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic ,strong)NSArray *dataList;

@end

@implementation WZNearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    [self loadData];
    
    
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WZNearLiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WZNearLiveCell" forIndexPath:indexPath];
    
    cell.live = self.dataList[indexPath.item];
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger count = self.collectionView.width / KItemWidth ;
    CGFloat etraWidth = (self.collectionView.width - kMargin * (count + 1)) / count;
    return CGSizeMake(etraWidth, etraWidth + 20);
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    WZNearLiveCell *c = (WZNearLiveCell *)cell;
    
    [c showAnimation];
    
}

- (void)initUI{
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"WZNearLiveCell" bundle:nil] forCellWithReuseIdentifier:@"WZNearLiveCell"];
    
}
- (void)loadData{
    [WZLiveHandler executeGetNearLiveTaskWithSuccess:^(id obj) {
        self.dataList = obj;
        [self.collectionView reloadData];
    } failed:^(id obj) {
        NSLog(@"error = %@",obj);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
