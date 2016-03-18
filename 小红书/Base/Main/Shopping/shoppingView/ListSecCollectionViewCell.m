//
//  ListSecCollectionViewCell.m
//  小红书
//
//  Created by Apple on 16/2/22.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import "ListSecCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "LittleModel.h"

@implementation ListSecCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
}

- (void)creatView {
   
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, self.frame.size.width - 15, self.frame.size.height - 100)];
    _imageView.userInteractionEnabled = YES;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, _imageView.frame.size.height + 10, _imageView.frame.size.width, 25)];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:_titleLabel];
    
    _traitLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, _titleLabel.frame.origin.y + 25, _titleLabel.frame.size.width, 50)];
    _traitLabel.numberOfLines = 0;
    _traitLabel.textAlignment = NSTextAlignmentLeft;
    _traitLabel.textColor = [UIColor grayColor];
    _traitLabel.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:_traitLabel];
    
    _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, _traitLabel.frame.origin.y + 40, 80, 25)];
    _priceLabel.textColor = [UIColor redColor];
    _priceLabel.font = [UIFont systemFontOfSize:10];
    _priceLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_priceLabel];
    
    _discountLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, _traitLabel.frame.origin.y + 40, 80, 25)];
    _discountLabel.textColor = [UIColor grayColor];
    _discountLabel.textAlignment = NSTextAlignmentLeft;
    _discountLabel.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:_discountLabel];
    
}

- (void)setModel:(LittleModel *)model {
    if (_model != model) {
        _model = model;
        [_imageView sd_setImageWithURL:[NSURL URLWithString:_model.imageUrl]];
        _titleLabel.text = _model.title;
        _traitLabel.text = _model.trait;
        _priceLabel.text = [NSString stringWithFormat:@"¥%@",_model.price];
        _discountLabel.text =[NSString stringWithFormat:@"%@",_model.discountPrice];
        
        NSUInteger length = [_discountLabel.text length];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:_discountLabel.text];
        [attributedString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
        [attributedString addAttribute:NSStrikethroughColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, length)];
        [_discountLabel setAttributedText:attributedString];
        
    }
}

- (void)awakeFromNib {
    // Initialization code
}

@end
