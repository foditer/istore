//
//  MessageViewController.h
//  小红书
//
//  Created by 李志文 on 16/2/14.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "BaseViewController.h"

@interface MessageViewController : BaseViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *data;

@end
