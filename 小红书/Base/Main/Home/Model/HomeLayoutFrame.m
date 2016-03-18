//
//  HomeLayoutFrame.m
//  小红书
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 Norman. All rights reserved.
//

#import "HomeLayoutFrame.h"
#import "WXLabel.h"


@implementation HomeLayoutFrame

- (void)setHomeModel:(HomeModel *)homeModel
{
    if (_homeModel != homeModel) {
        _homeModel = homeModel;
        
        [self layoutFrame];
    }
}


//根据图片、描述以及评论来计算内容视图的大小
- (void)layoutFrame
{
//    整个内容视图的预设值
    self.totalFrame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0);
    
//    计算内容视图的高度
    //配置商品图片的frame
    self.imageFrame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
    
    //配置描述文本的frame
    CGFloat textWidth = CGRectGetWidth(self.totalFrame) - 20;//计算文本宽度
    NSString *text = self.homeModel.describe;//拿到描述的文本以计算其高度
    CGFloat textHeight = [WXLabel getTextHeight:6 width:textWidth text:text linespace:6];//计算文本高度
    CGFloat textY = CGRectGetMaxY(self.imageFrame) + 10;//计算文本的起始纵坐标
    self.textFrame = CGRectMake(10, textY, textWidth, textHeight);
    
    //配置评论的frame
    CGFloat commentY = CGRectGetMaxY(self.textFrame);//计算评论的起始纵坐标
//    CGFloat commentHeight = ;//计算评论高度
    self.commentFrame = CGRectMake(10, commentY, textWidth, 50);
    
    //配置点赞的frame
    CGFloat likeY = CGRectGetMaxY(self.commentFrame) + 10;
    self.likeFrame = CGRectMake(120, likeY, 50, 30);
    //配置收藏的frame
    CGFloat collectionX = CGRectGetMaxX(self.likeFrame) + 15;
    self.collectionFrame = CGRectMake(collectionX, likeY, 60, 30);
    //配置分享的frame
    CGFloat shareX = CGRectGetMaxX(self.collectionFrame) + 20;
    self.shareFrame = CGRectMake(shareX, likeY, 30, 30);
    
    //计算整个内容视图的高度
    CGRect frame = self.totalFrame;//首先取到整个内容视图的frame
    frame.size.height = CGRectGetMaxY(self.commentFrame) + 40;
    self.totalFrame = frame;
    
}






@end
