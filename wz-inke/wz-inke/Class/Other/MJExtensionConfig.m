//
//  MJExtensionConfig.m
//  wz-inke
//
//  Created by KDB on 2017/4/25.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "Creator.h"
#import "Live.h"
#import "Extra.h"
#import "Label.h"
#import "RootClass.h"

@implementation MJExtensionConfig

+ (void)load {
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID":@"id"
                 };
    }];
    
    [Creator mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"descriptionField":@"description"
                 };
    }];
    
    
    [Creator mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    
    [Live mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    
    [Extra mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    
    [Label mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    
    [RootClass mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
}

@end
