//
//  LittleModel.h
//  小红书
//
//  Created by Apple on 16/2/22.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LittleModel : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *trait;
@property (copy, nonatomic) NSString *price;
@property (copy, nonatomic) NSString *discountPrice;
@property (copy, nonatomic) NSString *imageUrl;
@property (copy, nonatomic) NSString *link;

@end
