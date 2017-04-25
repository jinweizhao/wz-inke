//
//	RootClass.m
//
//	Create by 靳玮昭 on 24/4/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "RootClass.h"

NSString *const kRootClassDmError = @"dm_error";
NSString *const kRootClassErrorMsg = @"error_msg";
NSString *const kRootClassExpireTime = @"expire_time";
NSString *const kRootClassLives = @"lives";

@interface RootClass ()



@end
@implementation RootClass
+(NSDictionary *)mj_objectClassInArray
{
    return @{@"lives":@"Live"};
}

@end
