//
//  WZLiveCell.m
//  wz-inke
//
//  Created by KDB on 2017/4/25.
//  Copyright © 2017年 jwz. All rights reserved.
//

#import "WZLiveCell.h"


@interface WZLiveCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;

@end

@implementation WZLiveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setLive:(Live *)live
{
    _live = live;
    
    self.nameLabel.text = live.creator.nick;
    
    [self.headView downloadImage:live.creator.portrait placeholder:@"default_room"];
    [self.bigImageView downloadImage:live.creator.portrait placeholder:@"default_room"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
