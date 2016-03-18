//
//  DiscoverThirdCell.m
//  SmallBook
//
//  Created by Macx on 16/2/23.
//  Copyright © 2016年 胡哲逊. All rights reserved.
//

#import "DiscoverThirdCell.h"
#import "ThirdCellModal.h"
#import "UIImageView+WebCache.h"

@implementation DiscoverThirdCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    if (_modalArr[0] != nil) {
        for (int i = 0 ; i < 10; i++) {
            
            NSString *imgStr = ((ThirdCellModal *)_modalArr[i]).imageURL;
            NSURL *url = [NSURL URLWithString:imgStr];
            UIImageView *imgView = [self.contentView viewWithTag:(500+i)];
            [imgView sd_setImageWithURL:url];
            
            UILabel *nameLabel = [self.contentView viewWithTag:(600 +i)];
            nameLabel.text = ((ThirdCellModal *)_modalArr[i]).name;
            
            UILabel *totalLabel = [self.contentView viewWithTag:(700+i)];
            NSNumber *number = ((ThirdCellModal *)_modalArr[i]).total_follows;
            NSInteger total = [number integerValue];
            totalLabel.text = [NSString stringWithFormat:@"共%ld人关注",total];
            
            
        }
    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
