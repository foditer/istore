//
//  PersonTableViewCell.h
//  小红书
//
//  Created by 李志文 on 16/2/14.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserModel1;

@interface PersonTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *RImgVIew;
- (IBAction)REDclubButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImgView;

@property (nonatomic,strong) UserModel1 *model;

@end
