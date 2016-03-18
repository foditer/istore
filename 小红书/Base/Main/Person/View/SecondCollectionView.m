//
//  SecondCollectionView.m
//  小红书
//
//  Created by 李志文 on 16/2/16.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "SecondCollectionView.h"
#import "SpecialCollectionViewCell.h"
#import "FirstSpecialCell.h"

static NSString *specialCellID = @"specialCell";
static NSString *firstSpecialCellID = @"firstSpecialCellID";

@implementation SecondCollectionView

//复写init方法，
- (instancetype)initWithFrame:(CGRect)frame
{
    _collectSpeArr = [[NSMutableArray alloc] init];
    
    // 设置flowLayput
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    
    //设置滑动
    flowlayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //设置cell的大小
    flowlayout.itemSize = CGSizeMake(145 , 205);
    
    flowlayout.minimumLineSpacing = 10;
    flowlayout.minimumLineSpacing = 10;
    
    self = [super initWithFrame:frame collectionViewLayout:flowlayout];
    
    if (self)
    {
        self.delegate = self;
        self.dataSource = self;
        self.pagingEnabled = YES;
        
        //注册单元格
        
        [self registerNib:[UINib nibWithNibName:@"SpecialCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:specialCellID];
        
        [self registerNib:[UINib nibWithNibName:@"FirstSpecialCell" bundle:nil] forCellWithReuseIdentifier:firstSpecialCellID];
        
    }
    return self;
}

#pragma - mark UICollectionView delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _collectSpeArr.count + 1 ;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        FirstSpecialCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:firstSpecialCellID forIndexPath:indexPath];
        
        return cell;
    }else
    {
        SpecialCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:specialCellID forIndexPath:indexPath];
        
        cell.specialModel = self.collectSpeArr[indexPath.row - 1];
        
        return cell;
    }
}


@end
