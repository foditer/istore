//
//  SecondCollectionView.h
//  小红书
//
//  Created by 李志文 on 16/2/16.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondCollectionView : UICollectionView <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) NSMutableArray *collectSpeArr;
@end
