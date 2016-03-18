//
//  NoteCollectionViewCell.m
//  小红书
//
//  Created by 李志文 on 16/2/16.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "NoteCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "NoteModel.h"

@implementation NoteCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setNoteModel:(NoteModel *)noteModel
{
    _noteModel = noteModel;
    
    NSURL *url = [NSURL URLWithString:noteModel.imgUrl];
    
    [self.noteImgView sd_setImageWithURL:url];
}

@end
