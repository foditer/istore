//
//  MiddleVIew.h
//  小红书
//
//  Created by Apple on 16/2/11.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MiddleCollectionView;

@interface MiddleVIew : UIView

@property (nonatomic, strong) MiddleCollectionView *collectionV;
@property (nonatomic, strong) UIButton *arrowBtn;
@property (nonatomic, copy) NSArray *data;
@property (nonatomic, strong) UIView *secView;
@property (nonatomic, strong) UIView *firView;
@property (nonatomic, strong) UIView *shadowView;

- (void)passButon:(NSInteger)item;

@end
