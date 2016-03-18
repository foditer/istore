//
//  MiddleCollectionView.m
//  小红书
//
//  Created by Apple on 16/2/12.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import "MiddleCollectionView.h"
#import "MiddleCollectionViewCell.h"

@implementation MiddleCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self registerClass:[MiddleCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        _first = NO;
        if (_selecView == nil) {
            _selecView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 5, (kScreenWidth - 50)/4, 5)];
            _selecView.backgroundColor = [UIColor colorWithRed:220/225.0 green:1/225.0 blue:31/225.0 alpha:1];
            [self addSubview:_selecView];
//            [self bringSubviewToFront:_selecView];
            
        }

       
    }
    return self;
}

#pragma mark -UICollectionView delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    

   _nCell = (MiddleCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    _selecView.center = CGPointMake(_nCell.center.x, _nCell.center.y + _nCell.frame.size.height/2);
    _nCell.label.textColor = [UIColor redColor];
    _oldCell.label.textColor = [UIColor blackColor];
    _oldCell = _nCell;
    _nCell = nil;
        //让选中的单元格居中显示
        [UIView animateWithDuration:0.4 delay:0.0 options:0 animations:^{
            [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
        } completion:NULL];
        //记录当前页
        self.currentItem = indexPath.item;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   
    MiddleCollectionViewCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.label.frame = cell.bounds;
    if (indexPath.row == 0) {

        if (_first == NO) {
            _oldCell = cell;
            _oldCell.label.textColor = [UIColor redColor];
            _first = YES;

        }
    }
    else{
    cell.label.textColor = [UIColor blackColor];
    }
    cell.title = [self.data objectAtIndex:indexPath.item];
    return cell;
}


@end
