//
//  FourthCell.m
//  SmallBook
//
//  Created by Macx on 16/2/24.
//  Copyright © 2016年 胡哲逊. All rights reserved.
//

#import "FourthCell.h"
#import "UIImageView+WebCache.h"

@implementation FourthCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    for (int i = 0; i < 4; i++) {
        UIImageView *imgView = [self.contentView viewWithTag:(100+i)];
        NSString *str = ((FourthCellModal *)_modalArr[i]).imageURL;
        
        NSURL *url = [NSURL URLWithString:str];
        [imgView sd_setImageWithURL:url];
        
        UILabel *nameLabel = [self.contentView viewWithTag:(200+i)];
        nameLabel.text = ((FourthCellModal *)_modalArr[i]).name;
        
        UILabel *totalLabel = [self.contentView viewWithTag:(300+i)];
        NSNumber *number = ((FourthCellModal *)_modalArr[i]).total_follows;
        NSInteger total = [number integerValue];
        totalLabel.text = [NSString stringWithFormat:@"关注 %ld", total];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
