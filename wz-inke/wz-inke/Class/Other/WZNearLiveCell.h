//
//  WZNearLiveCell.h
//  wz-inke
//
//  Created by KDB on 2017/4/26.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Flow.h"
@interface WZNearLiveCell : UICollectionViewCell

@property (nonatomic ,strong)Flow *live;
- (void)showAnimation;
@end
