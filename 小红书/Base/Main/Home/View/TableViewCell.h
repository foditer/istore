//
//  TableViewCell.h
//  小红书
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 Norman. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeLayoutFrame;
@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *headImage;//头像
@property (strong, nonatomic) IBOutlet UILabel *nickNameLabel;//昵称
@property (strong, nonatomic) IBOutlet UILabel *resourseLabel;//地理信息
@property (strong, nonatomic) IBOutlet UIButton *littleButton;//是否感兴趣
@property (strong, nonatomic) IBOutlet UIImageView *goodsImage;//商品图片
@property (strong, nonatomic) IBOutlet UILabel *describeLabel;//详细描述
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;//评论
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *collectionButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

//@property (nonatomic, strong) UIButton *likeButton;//点赞
//@property (nonatomic, strong) UIButton *collectionButton;//收藏
//@property (nonatomic, strong) UIButton *shareButton;//分享

@property (strong, nonatomic) HomeLayoutFrame *homeLayoutFrameModel;//设置接口，用于接收传递数据。




@end
