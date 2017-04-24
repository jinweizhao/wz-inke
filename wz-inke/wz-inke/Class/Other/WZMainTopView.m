//
//  WZMainTopView.m
//  wz-inke
//
//  Created by KDB on 2017/4/24.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import "WZMainTopView.h"

@interface WZMainTopView ()
@property (nonatomic ,strong)UIView *lineView;
@property (nonatomic ,strong)NSMutableArray *buttons;
@end

@implementation WZMainTopView

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat btnW = self.width / titles.count;
        CGFloat btnH = self.height;
        
        for (NSInteger i = 0; i < titles.count; i ++) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            btn.titleLabel.font = [UIFont systemFontOfSize:18];
            
            btn.tag = i;
            
            [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            
            btn.frame = CGRectMake(i * btnW, 0, btnW, btnH);
            
            [self.buttons addObject:btn];
            
            [self addSubview:btn];
            
            if (i == 1) {
                CGFloat h = 2;
                CGFloat y = 40;
                [btn.titleLabel sizeToFit];
                
                self.lineView.height = h;
                self.lineView.width = btn.titleLabel.width;
                self.lineView.top = y;
                self.lineView.centerX = btn.centerX;
                
                [self addSubview:self.lineView];
            }
            
        }
        
    }
    return self;
}
-(void)scrolling:(NSInteger)tag
{
    UIButton *btn = self.buttons[tag];
    [UIView animateWithDuration:0.5 animations:^{
        self.lineView.centerX = btn.centerX;
    }];
}
-(void)titleClick:(UIButton *)titleBtn
{
    if (self.block) {
        self.block(titleBtn.tag);
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        self.lineView.centerX = titleBtn.centerX;
    }];
}
-(NSMutableArray *)buttons
{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}
-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor whiteColor];
    }
    return _lineView;
}

@end
