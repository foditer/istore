//
//  UserModel1.h
//  小红书
//
//  Created by 李志文 on 16/2/23.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel1 : NSObject

@property (nonatomic,copy) NSString *name;

@property (nonatomic,strong) NSNumber *fans;

@property (nonatomic,strong) NSNumber *following_boards;

@property (nonatomic,strong) NSNumber *following_tags;

@property (nonatomic,strong) NSNumber *follows;

@property (nonatomic,strong) NSNumber *mySpecials;

@property (nonatomic,strong) NSNumber *myNotes;

@property (nonatomic,copy) NSString *headImgUrl;

@end
