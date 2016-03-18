//
//  HomeTabelView.h
//  小红书
//
//  Created by apple on 16/2/17.
//  Copyright © 2016年 Norman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTabelView : UITableView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy)NSMutableArray *models;//设置接口，用于接收数据。与前面单元格cell中的数据接口不同的是，cell中的接口只拿到了一个Model，而这里的接口是一个Model的数组。

@end
