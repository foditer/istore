//
//  NoteTagColtCell.m
//  小红书
//
//  Created by 李志文 on 16/2/24.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "NoteTagColtCell.h"
#import "UIImageView+WebCache.h"
#import "NoteModel.h"

@implementation NoteTagColtCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(NoteModel *)model
{
    if (_model != model)
    {
        _model = model;

        self.nameLabel.text = model.name;
        
        NSURL *url = [NSURL URLWithString:model.imgUrl];
        
        [self.imgView sd_setImageWithURL:url];
    }
}


@end
