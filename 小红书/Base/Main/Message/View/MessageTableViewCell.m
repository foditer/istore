//
//  MessageTableViewCell.m
//  小红书
//
//  Created by 李志文 on 16/2/14.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        [self _createSubViews];
    }
    
    return self;
}

- (void)_createSubViews
{
    _msgeImgView = [[UIImageView alloc] initWithFrame:CGRectMake(7, 10, 20, 20)];
    
    _msgeTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(37 + 5, 11, 200, 20)];
    
    _msgeTextLabel.font = [UIFont systemFontOfSize:14];
    
    _msgeTextLabel.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:_msgeImgView];
    [self.contentView addSubview:_msgeTextLabel];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
