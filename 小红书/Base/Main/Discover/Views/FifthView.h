//
//  FifthView.h
//  SmallBook
//
//  Created by Apple on 16/2/23.
//  Copyright © 2016年 胡哲逊. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FifthCellModel;

@interface FifthView : UIView

@property (nonatomic, strong) FifthCellModel *model;
@property (nonatomic, strong) UIButton *big;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UIImageView *userImageView;
@property (nonatomic, strong) UIButton *userName;
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UILabel *likeNumLabel;

@end
