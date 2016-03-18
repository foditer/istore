//
//  SpecialCollectionViewCell.h
//  小红书
//
//  Created by 李志文 on 16/2/16.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NoteModel;

@interface SpecialCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mainImgView;
@property (weak, nonatomic) IBOutlet UIImageView *smallImgView_1;
@property (weak, nonatomic) IBOutlet UIImageView *smallImgView_2;
@property (weak, nonatomic) IBOutlet UIImageView *smallImgView_3;
- (IBAction)editingButton:(UIButton *)sender;

@property (nonatomic,strong) NoteModel *specialModel;

@end
