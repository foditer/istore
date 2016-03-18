//
//  ListFirstCollectionViewCell.h
//  小红书
//
//  Created by Apple on 16/2/22.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListCollModel;

@interface ListFirstCollectionViewCell : UICollectionViewCell <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageVIew;
@property (weak, nonatomic) IBOutlet UICollectionView *collView;
@property (nonatomic, strong) ListCollModel *model;
@property (nonatomic, copy) NSMutableArray *littleArr;
@end
