//
//  PersonViewController.h
//  小红书
//
//  Created by 李志文 on 16/2/9.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "BaseViewController.h"

@interface PersonViewController : BaseViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *data;
@property (nonatomic,strong) NSMutableArray *secData;
@property (nonatomic,strong) NSMutableArray *specialArr;
@end
