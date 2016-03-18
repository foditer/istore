//
//  DetailCollectionViewCell.m
//  小红书
//
//  Created by Apple on 16/2/11.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import "DetailCollectionViewCell.h"
#import "ListCollectionView.h"
@implementation DetailCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _listCollView = [[ListCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 110)];
        [self.contentView addSubview:_listCollView];
    }
    return self;
}


@end
