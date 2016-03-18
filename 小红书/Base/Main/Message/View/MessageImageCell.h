//
//  MessageImageCell.h
//  小红书
//
//  Created by 李志文 on 16/2/14.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageModel;

@interface MessageImageCell : UITableViewCell

@property (nonatomic,strong) UIImageView *cellImageView;
@property (nonatomic,strong) UILabel *imageLabel;

@property (nonatomic,strong) MessageModel *model;

@end
