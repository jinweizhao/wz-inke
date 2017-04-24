//
//  WZLiveHandler.m
//  wz-inke
//
//  Created by 靳玮昭 on 2017/4/24.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import "WZLiveHandler.h"
#import "HttpTool.h"

@implementation WZLiveHandler

+(void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed
{
    [HttpTool getWithPath:API_HotLive params:nil success:^(id json) {
        
        if ([json[@"dm_error"] integerValue] != 0) {
            failed(json[@"error_msg"]);
        }else{
            success(json);
        }
        
    } failure:^(NSError *error) {
        failed(error);
    }];
    
    
}

@end
