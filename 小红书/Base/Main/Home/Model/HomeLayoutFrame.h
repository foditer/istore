//
//  HomeLayoutFrame.h
//  小红书
//
//  Created by apple on 16/2/20.
//  Copyright © 2016年 Norman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeModel.h"
#import <UIKit/UIKit.h>


@interface HomeLayoutFrame : NSObject

@property (nonatomic, strong)HomeModel *homeModel;

@property (nonatomic, assign)CGRect imageFrame;//图片的frame
@property (nonatomic, assign)CGRect textFrame;//文字的frame
@property (nonatomic, assign)CGRect commentFrame;//评论的frame
@property (nonatomic, assign)CGRect totalFrame;//整体内容的frame

@property (nonatomic, assign)CGRect likeFrame;//点赞的frame
@property (nonatomic, assign)CGRect collectionFrame;//收藏的frame
@property (nonatomic, assign)CGRect shareFrame;//分享的frame

@end




/**
 HomeLayoutFrame这个类主要用于：通过HomeModel中的数据来计算单元格的高度。
 */