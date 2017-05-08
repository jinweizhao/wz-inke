//
//  WZTabBar.m
//  wz-inke
//
//  Created by KDB on 2017/4/24.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import "WZTabBar.h"

@interface WZTabBar ()

@property (nonatomic ,strong)NSArray *dataList;
@property (nonatomic ,strong)UIButton *lastItem;

@property (nonatomic ,strong)UIButton *cameraButton;

@end

@implementation WZTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        for (NSInteger i = 0; i < self.dataList.count; i ++) {
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            //去处高亮状态
            item.adjustsImageWhenHighlighted = NO;
            [item setImage:[UIImage imageNamed:self.dataList[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.dataList[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            item.tag = WZItemTypeLive + i;
            if (i == 0) {
                item.selected = YES;
                self.lastItem = item;
            }
            [self addSubview:item];
        }
        [self addSubview:self.cameraButton];
    }
    return self;
}

-(void) clickItem:(UIButton *)item
{
    if ([self.delegate respondsToSelector:@selector(tabbar:clickButton:)]) {
        [self.delegate tabbar:self clickButton:item.tag];
    }
    
    if (self.block) {
        self.block(self, item.tag);
    }
    
    if (item.tag == WZItemTypeLaunch) {
        return;
    }
    
    self.lastItem.selected = NO;
    item.selected = YES;
    self.lastItem = item;
    
    //动画
    [UIView animateWithDuration:0.2 animations:^{
        item.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            item.transform = CGAffineTransformIdentity;
        }];
    }];
    
}
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    if (!view
        && self.hidden == NO) {
        if (CGRectContainsPoint(self.cameraButton.frame, point)) {
            return self.cameraButton;
        }
    }
    return view;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width / self.dataList.count;
    
    for (NSInteger i = 0; i < self.subviews.count; i ++) {
        UIView *btn = self.subviews[i];
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.frame = CGRectMake((btn.tag - WZItemTypeLive) * width, 0, width, self.frame.size.height);
        }
    }
    [self.cameraButton sizeToFit];
    self.cameraButton.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height - 35);
    
}
-(UIButton *)cameraButton
{
    if (!_cameraButton) {
        _cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraButton setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_cameraButton sizeToFit];
        _cameraButton.tag = WZItemTypeLaunch;
        [_cameraButton addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraButton;
}
-(NSArray *)dataList
{
    if (!_dataList) {
        _dataList = @[@"tab_live",@"tab_me"];
    }
    return _dataList;
}


@end
