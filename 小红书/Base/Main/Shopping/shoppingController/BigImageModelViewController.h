//
//  BigImageModelViewController.h
//  小红书
//
//  Created by Apple on 16/2/22.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BigImageModelViewController : UIViewController

@property (nonatomic, copy) NSString *urlstring;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *topView;

@end
