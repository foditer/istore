//
//  MiddleCollectionView.h
//  小红书
//
//  Created by Apple on 16/2/12.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import "BaseCollectionView.h"
@class MiddleCollectionViewCell;
@interface MiddleCollectionView : BaseCollectionView

@property (nonatomic, weak)MiddleCollectionViewCell *oldCell;
@property (nonatomic, weak)MiddleCollectionViewCell *nCell;
@property (nonatomic, assign)BOOL first;
@property (nonatomic, strong) UIView  *selecView;
@end
