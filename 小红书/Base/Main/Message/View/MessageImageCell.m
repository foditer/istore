//
//  MessageImageCell.m
//  小红书
//
//  Created by 李志文 on 16/2/14.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "MessageImageCell.h"
#import "MessageModel.h"
#import "UIKit+AFNetworking.h"
#import "UIImageView+WebCache.h"


@implementation MessageImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        [self _createSubViews];
    }
    
    return self;
}

- (void)setModel:(MessageModel *)model
{
    if (_model != model)
    {
        _model = model;
        
//        [self _createSubViews];
        
        NSURL *url = [NSURL URLWithString:model.imageUrl];
        
        [_cellImageView sd_setImageWithURL:url];

    }
    
}


- (void)_createSubViews
{
    _cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(7, 7, 306, 135)];
    
    _imageLabel = [[UILabel alloc] initWithFrame:CGRectMake(260, 120, 50, 20)];
    
    _imageLabel.font = [UIFont systemFontOfSize:12];
    
    _imageLabel.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:_cellImageView];
    [self.contentView addSubview:_imageLabel];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
