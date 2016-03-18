//
//  BaseCollectionView.h
//  小红书
//
//  Created by Apple on 16/2/11.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView <UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, assign)CGFloat pageWidth; //一页的宽度
@property (nonatomic, strong)NSMutableArray *data; //接收数据

@property (nonatomic, assign) NSInteger currentItem; //记录当前选中的单元格

@end
