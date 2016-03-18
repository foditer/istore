//
//  DiscoverViewController.h
//  SmallBook
//
//  Created by Macx on 16/2/21.
//  Copyright © 2016年 胡哲逊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoverViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *fifthData;
@property (nonatomic, assign) long int ifthCellHeight;

@end
