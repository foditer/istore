//
//  HomeModel.m
//  小红书
//
//  Created by apple on 16/2/17.
//  Copyright © 2016年 Norman. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

/*
 1、解析数据进行匹配
 2、对请求下来的数据进行处理 适用于本程序
 3、创建时间的时间处理
 4、来源的正则表达式处理
 */

- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic
{
    //请求下来的值 ： 属性名
    NSDictionary *mapAtt = @{
                             @"comments" :@"commentsCount",
                             @"fav_count":@"favoriteCount",
                             @"likes":@"likesCount",
                             @"share_link":@"share_link",
                             @"geo":@"geo",
                             @"desc":@"describe",
                             @"images_list":@"imagesList",
                             @"id":@"id",
                             @"newest_comments":@"newestComments"
                             };
    
    return mapAtt;
}

- (void)setAttributes:(NSDictionary *)jsonDic {
    [super setAttributes:jsonDic];
    
    NSDictionary *userDic = jsonDic[@"user"];
    if (userDic != nil) {
        UserModel *user = [[UserModel alloc] initContentWithDic:userDic];
        self.userModel = user;
    }
    
//    NSDictionary *retweetDic = jsonDic[@"retweeted_status"];
//    if (retweetDic != nil) {
//        
//        WeiboModel *reWeibo = [[WeiboModel alloc] initContentWithDic:retweetDic];
//        self.reWeibo = reWeibo;
//    }
}

@end
