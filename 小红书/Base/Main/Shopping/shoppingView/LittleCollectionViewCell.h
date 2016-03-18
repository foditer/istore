//
//  LittleCollectionViewCell.h
//  小红书
//
//  Created by Apple on 16/2/22.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LittleModel;

@interface LittleCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) LittleModel *model;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *discountLabel;
@end
