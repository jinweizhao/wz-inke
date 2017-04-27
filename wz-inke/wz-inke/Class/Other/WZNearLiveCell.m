//
//  WZNearLiveCell.m
//  wz-inke
//
//  Created by KDB on 2017/4/26.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import "WZNearLiveCell.h"

@interface WZNearLiveCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@end

@implementation WZNearLiveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setLive:(Flow *)live
{
    _live = live;
    
    [self.imgView downloadImage:live.info.creator.portrait placeholder:@"default_room"];
    
    self.distanceLabel.text = live.info.distance;
    
}
-(void)showAnimation
{
    
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    
    [UIView animateWithDuration:0.5 animations:^{
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
    
}

@end
