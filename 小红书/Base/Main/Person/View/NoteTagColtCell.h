//
//  NoteTagColtCell.h
//  小红书
//
//  Created by 李志文 on 16/2/24.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NoteModel;

@interface NoteTagColtCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (nonatomic,strong) NoteModel *model;

@end
