//
//  WZTabBar.h
//  wz-inke
//
//  Created by KDB on 2017/4/24.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WZItemType) {
    WZItemTypeLaunch = 10,//启动直播
    WZItemTypeLive = 100,//展示直播
    WZItemTypeMe = 0,
};


@class WZTabBar;

typedef void(^TabBlock)(WZTabBar *tabbar, WZItemType index);

@protocol WZTabBarDelegate <NSObject>

- (void) tabbar:(WZTabBar *)tabbar clickButton:(WZItemType)index;

@end


@interface WZTabBar : UIView

@property (nonatomic ,weak) id<WZTabBarDelegate> delegate;

@property (nonatomic ,copy) TabBlock block;

@end
