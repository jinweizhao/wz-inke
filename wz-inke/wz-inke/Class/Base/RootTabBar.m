//
//  RootTabBar.m
//  wz-inke
//
//  Created by KDB on 2017/4/27.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import "RootTabBar.h"
@class WZTabBar;

@implementation RootTabBar

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    if (!view) {
        for (UIView *tempView in self.subviews) {
            NSString *classString = NSStringFromClass([tempView class]);
            if ([classString isEqualToString:@"WZTabBar"]) {
                return [tempView hitTest:point withEvent:event];
            }
        }
    }
    return view;
}

@end
