//
//  ShoppingViewController.h
//  小红书
//
//  Created by Apple on 16/2/11.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TopVIew;
@class MiddleVIew;
@class MainCollectionView;
@interface ShoppingViewController : UIViewController

@property (nonatomic, strong)MainCollectionView *mainCollectionView;

@property (weak, nonatomic) IBOutlet TopVIew *topView;
@property (weak, nonatomic) IBOutlet MiddleVIew *middleView;

@property (strong, nonatomic) NSArray *firstcellUrl;
@property (strong, nonatomic) NSArray *secCellUrl;

@property (strong, nonatomic) NSMutableArray *data;
@property (strong, nonatomic) NSMutableArray *secData;
//返回顶部按钮
@property (nonatomic, strong) UIButton *topBtn;
@end
