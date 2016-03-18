//
//  FifthCellModel.h
//  SmallBook
//
//  Created by Apple on 16/2/23.
//  Copyright © 2016年 胡哲逊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FifthCellModel : NSObject

@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSString *littleUrl;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, assign) NSInteger like;
@property (nonatomic, copy) NSString *userNameLink;
@property (nonatomic, copy) NSString *userId;

@end
