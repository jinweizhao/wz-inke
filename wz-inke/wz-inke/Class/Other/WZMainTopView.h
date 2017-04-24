//
//  WZMainTopView.h
//  wz-inke
//
//  Created by KDB on 2017/4/24.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MainTopBlock)(NSInteger tag);

@interface WZMainTopView : UIView

@property (nonatomic ,copy) MainTopBlock block;

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles;

- (void)scrolling:(NSInteger)tag;

@end
