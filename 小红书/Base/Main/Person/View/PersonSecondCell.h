//
//  PersonSecondCell.h
//  小红书
//
//  Created by 李志文 on 16/2/15.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserModel1;

@interface PersonSecondCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *tagLabel;

@property (weak, nonatomic) IBOutlet UILabel *specialLabel;
@property (weak, nonatomic) IBOutlet UILabel *followsLabel;


@property (weak, nonatomic) IBOutlet UILabel *fans;

- (IBAction)tagButton:(UIButton *)sender;
- (IBAction)specialButton:(UIButton *)sender;


- (IBAction)fansButton:(UIButton *)sender;

- (IBAction)followsButton:(UIButton *)sender;
@property (nonatomic,strong) UserModel1 *model;

@end
