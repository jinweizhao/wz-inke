//
//  WZLocationManager.m
//  wz-inke
//
//  Created by KDB on 2017/4/26.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import "WZLocationManager.h"

@implementation WZLocationManager

+ (instancetype)shareManager
{
    static WZLocationManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[WZLocationManager alloc]init];
    });
    return manager;
}

@end
