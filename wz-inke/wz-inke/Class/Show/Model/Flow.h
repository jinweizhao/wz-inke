//
//  Flow.h
//  wz-inke
//
//  Created by KDB on 2017/4/27.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Live.h"
@interface Flow : NSObject
@property (nonatomic ,copy) NSString *flow_type;

@property (nonatomic ,strong)Live *info;

@end
