//
//  ButtonCell.h
//  小红书
//
//  Created by 李志文 on 16/2/16.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserModel1;


@interface ButtonCell : UITableViewCell
- (IBAction)noteButton:(UIButton *)sender;
- (IBAction)specialButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;
@property (weak, nonatomic) IBOutlet UILabel *specialLabel;
@property (weak, nonatomic) IBOutlet UIImageView *footImgView;

@property (nonatomic,strong) UserModel1 *model;
@property (nonatomic,strong) NSMutableArray *ModelArr;
@property (nonatomic,strong) NSMutableArray *specialArr;

@end
