//
//  NoteModel.h
//  小红书
//
//  Created by 李志文 on 16/2/22.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoteModel : NSObject

@property (nonatomic,copy) NSString *imgUrl;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,strong) NSMutableArray *imgs;

@end
