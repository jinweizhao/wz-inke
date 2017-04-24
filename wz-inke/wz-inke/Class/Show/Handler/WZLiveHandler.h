//
//  WZLiveHandler.h
//  wz-inke
//
//  Created by 靳玮昭 on 2017/4/24.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import "WZBaseHandler.h"

@interface WZLiveHandler : WZBaseHandler
//获取热门直播信息
+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;

@end
