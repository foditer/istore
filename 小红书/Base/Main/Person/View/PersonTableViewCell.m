//
//  PersonTableViewCell.m
//  小红书
//
//  Created by 李志文 on 16/2/14.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "PersonTableViewCell.h"
#import "UserModel1.h"
#import "UIImageView+WebCache.h"

@implementation PersonTableViewCell

- (void)awakeFromNib {
    
    self.headImgView.layer.cornerRadius = 35/1.4;
    
    self.headImgView.layer.masksToBounds = YES;
    
    self.headImgView.image = [UIImage imageNamed:@"placeholder_portrait"];
    
    self.nameLabel.text = @"Javenlee";
    
    self.RImgVIew.image = [UIImage imageNamed:@"user_redclub_h@2x"];
    
    self.arrowImgView.image = [UIImage imageNamed:@"post_editimage_tag_orders_indicator@2x"];
}

- (void)setModel:(UserModel1 *)model
{
    _model = model;
    
    self.nameLabel.text = model.name;
    
    NSURL *url = [NSURL URLWithString:model.headImgUrl];
    
    
    [_headImgView sd_setImageWithURL:url];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)REDclubButton:(id)sender {
    
    
}
@end
