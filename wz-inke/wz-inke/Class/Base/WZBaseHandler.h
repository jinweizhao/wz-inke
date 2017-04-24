//
//  WZBaseHandler.h
//  wz-inke
//
//  Created by 靳玮昭 on 2017/4/24.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CompleteBlock)();

typedef void(^SuccessBlock)(id obj);

typedef void(^FailedBlock)(id obj);

@interface WZBaseHandler : NSObject

@end
