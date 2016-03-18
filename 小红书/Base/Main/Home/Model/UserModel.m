//
//  UserModel.m
//  小红书
//
//  Created by apple on 16/2/19.
//  Copyright © 2016年 Norman. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic
{
    //请求下来的值 ： 属性名
    NSDictionary *mapAtt = @{
                             @"images" :@"images_url",//用户头像
                             @"nickname":@"nickName"//用户昵称
                             };
    
    return mapAtt;
}

@end
