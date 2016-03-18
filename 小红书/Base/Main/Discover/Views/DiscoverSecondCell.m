//
//  DiscoverSecondCell.m
//  SmallBook
//
//  Created by Macx on 16/2/24.
//  Copyright © 2016年 胡哲逊. All rights reserved.
//

#import "DiscoverSecondCell.h"
#import "Discover.h"
#import "UIImageView+WebCache.h"

@implementation DiscoverSecondCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    for (int i = 0; i < 3; i++) {
        UIImageView *imgView = [self.contentView viewWithTag:(100+i)];
        NSString *str = ((Discover *)_modalArr[i]).destinationImgUrl;
        NSURL *url = [NSURL URLWithString:str];
        [imgView sd_setImageWithURL:url];
        
        UILabel *nameLabel = [self.contentView viewWithTag:(200+i)];
        nameLabel.text = ((Discover *)_modalArr[i]).destinationName;
        
        UILabel *totalLabel = [self.contentView viewWithTag:(300+i)];
        NSNumber *number = ((Discover *)_modalArr[i]).destinationFollows;
        NSInteger total = [number integerValue];
        totalLabel.text = [NSString stringWithFormat:@"共%ld人关注", total];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
