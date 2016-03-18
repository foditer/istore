//
//  Discover.h
//  SmallBook
//
//  Created by Macx on 16/2/23.
//  Copyright © 2016年 胡哲逊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Discover : NSObject

@property (nonatomic,copy) NSString *name;//长得帅的男生都这么穿
@property (nonatomic,copy) NSString *imgUrl;//图片链接

@property (nonatomic, copy) NSString *destinationImgUrl;
@property (nonatomic, copy) NSString *destinationName;
@property (nonatomic, copy) NSNumber *destinationFollows;

@end
