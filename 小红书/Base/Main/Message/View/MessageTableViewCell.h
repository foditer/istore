//
//  MessageTableViewCell.h
//  小红书
//
//  Created by 李志文 on 16/2/14.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageModel;

@interface MessageTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *msgeImgView;

@property (nonatomic,strong) UILabel *msgeTextLabel;

@property (nonatomic,strong) MessageModel *model;

@end
