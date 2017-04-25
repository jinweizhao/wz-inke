//
//  WZHotViewController.m
//  wz-inke
//
//  Created by KDB on 2017/4/24.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import "WZHotViewController.h"
#import "WZLiveHandler.h"
#import "WZLiveCell.h"

@interface WZHotViewController ()
@property (nonatomic ,strong)NSMutableArray *dataList;
@end

@implementation WZHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    [self loadData];
    
}
-(void)initUI
{
    self.tableView.rowHeight = SCREEN_WIDTH + 70;
    [self.tableView registerNib:[UINib nibWithNibName:@"WZLiveCell" bundle:nil] forCellReuseIdentifier:@"WZLiveCell"];
}

- (void)loadData
{
    [WZLiveHandler executeGetHotLiveTaskWithSuccess:^(id obj) {
        
        [self.dataList addObjectsFromArray:obj];
        [self.tableView reloadData];
        
    } failed:^(id obj) {
        NSLog(@"error = %@",obj);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WZLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WZLiveCell"];
    
    cell.live = self.dataList[indexPath.row];
    
    return cell;
}
-(NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}
@end
