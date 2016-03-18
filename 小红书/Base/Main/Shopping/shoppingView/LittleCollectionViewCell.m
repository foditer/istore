//
//  LittleCollectionViewCell.m
//  小红书
//
//  Created by Apple on 16/2/22.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import "LittleCollectionViewCell.h"
#import "LittleModel.h"
#import "UIImageView+WebCache.h"

@implementation LittleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setModel:(LittleModel *)model {
    if (_model != model) {
        _imageView.image = nil;
        _titleLabel.text = nil;
        _priceLabel.text = nil;
        _discountLabel.text = nil;
        _model = model;
        [_imageView sd_setImageWithURL:[NSURL URLWithString:_model.imageUrl]];
        _titleLabel.text = _model.title;
        
        _discountLabel.text = [NSString stringWithFormat:@"¥%@",_model.price];
        _priceLabel.text = [NSString stringWithFormat:@"¥%@",_model.discountPrice];
        NSUInteger length = [_discountLabel.text length];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:_discountLabel.text];
        [attributedString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
        [attributedString addAttribute:NSStrikethroughColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, length)];
        [_discountLabel setAttributedText:attributedString];
        

    }
}

- (void)creatView {
  
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, self.frame.size.width - 20, self.frame.size.height - 70)];
    _imageView.backgroundColor = [UIColor clearColor];
    _imageView.userInteractionEnabled = YES;
    [self.contentView addSubview:_imageView];
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, _imageView.frame.size.height + 10, _imageView.frame.size.width, 25)];
//    _titleLabel.backgroundColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:11];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_titleLabel];
    _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, _titleLabel.frame.origin.y + 25, _imageView.frame.size.width/2, 25)];
//    _priceLabel.backgroundColor = [UIColor redColor];
    _priceLabel.font = [UIFont systemFontOfSize:11];
    _priceLabel.textColor = [UIColor redColor];
    _priceLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_priceLabel];
    _discountLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 + _imageView.frame.size.width/2, _titleLabel.frame.origin.y + 25, _imageView.frame.size.width/2, 25)];
    _discountLabel.font = [UIFont systemFontOfSize:11];
    _discountLabel.textColor = [UIColor grayColor];
    _discountLabel.textAlignment = NSTextAlignmentLeft;
//    _discountLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_discountLabel];
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

@end
