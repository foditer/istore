//
//  ListCollectionView.h
//  小红书
//
//  Created by Apple on 16/2/11.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCollectionView : UICollectionView <UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *firstData;
@property (nonatomic, strong) NSMutableArray *secData;
@property (nonatomic, assign) NSInteger curItem;
@property (nonatomic, assign) NSInteger oldItem;
@property (nonatomic, strong) UIButton *topBtn;

@end
