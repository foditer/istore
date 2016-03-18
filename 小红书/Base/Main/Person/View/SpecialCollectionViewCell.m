//
//  SpecialCollectionViewCell.m
//  小红书
//
//  Created by 李志文 on 16/2/16.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "SpecialCollectionViewCell.h"
#import "NoteModel.h"
#import "UIImageView+WebCache.h"

@implementation SpecialCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSpecialModel:(NoteModel *)specialModel
{
    _specialModel = specialModel;
    
    for (int i = 0; i < specialModel.imgs.count; i ++)
    {
        NSString *urlStr = specialModel.imgs[i];
        
        UIImageView *imgView = [self.contentView viewWithTag:101 + i];
        
        [imgView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
    }


}

- (IBAction)editingButton:(UIButton *)sender {
}
@end
