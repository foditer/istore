//
//  HomeModel.h
//  小红书
//
//  Created by apple on 16/2/17.
//  Copyright © 2016年 Norman. All rights reserved.
//

#import "BaseModel.h"
#import "UserModel.h"

@interface HomeModel : BaseModel

//@property(nonatomic,copy)NSString       *createDate;       //微博创建时间
//@property(nonatomic, retain)NSNumber     *weiboId;           //微博ID
//@property(nonatomic,copy)NSString       *text;              //微博的内容
//@property(nonatomic,copy)NSString       *source;              //微博来源
//@property(nonatomic,retain)NSNumber     *favorited;         //是否已收藏
//@property(nonatomic,copy)NSString       *thumbnailImage;     //缩略图片地址
//@property(nonatomic,copy)NSString       *bmiddlelImage;     //中等尺寸图片地址
//@property(nonatomic,copy)NSString       *originalImage;     //原始图片地址
//@property(nonatomic,retain)NSDictionary *geo;               //地理信息字段


@property (nonatomic, retain)NSNumber   *commentsCount;   //评论的条数
@property (nonatomic, retain)NSNumber   *favoriteCount;  //收藏数
@property (nonatomic, retain)NSNumber   *likesCount;      //点赞数
@property (nonatomic, copy)NSString     *share_link;      //分享的链接地址
@property (nonatomic, copy)NSString     *geo;             //地理信息
@property (nonatomic, copy)NSString     *describe;      //商品的详细描述
@property (nonatomic, copy)NSArray      *imagesList;     //商品图片列表
@property (nonatomic, copy)NSArray      *newestComments; //显示出来的评论信息
@property(nonatomic, assign)long        id;              //用户ID

@property (nonatomic, strong)UserModel  *userModel;       //用户信息


@end
