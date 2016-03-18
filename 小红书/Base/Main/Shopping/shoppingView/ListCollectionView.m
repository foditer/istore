//
//  ListCollectionView.m
//  小红书
//
//  Created by Apple on 16/2/11.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import "ListCollectionView.h"
#import "ListFirstCollectionViewCell.h"
#import "ListSecCollectionViewCell.h"
#import "LittleModel.h"
#import "ShoppingViewController.h"
#import "BigImageModelViewController.h"

@implementation ListCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = 20;
//    flowLayout.minimumInteritemSpacing = 10;
    _topBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth - 70, kScreenHeight - 70, 40, 40)];
    _topBtn.hidden = YES;
    _topBtn.backgroundColor = [UIColor greenColor];
    [_topBtn setImage:[UIImage imageNamed:@"store_back_to_top@2x.png"] forState:UIControlStateNormal];
    [_topBtn addTarget:self action:@selector(topAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_topBtn];
    
    _curItem = 0;
    _oldItem = 0;
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        _firstData = [[NSMutableArray alloc]init];
        _secData = [[NSMutableArray alloc]init];
        self.backgroundColor = [UIColor colorWithWhite:0.979 alpha:1.000];
//        [self registerClass:[ListFirstCollectionViewCell class] forCellWithReuseIdentifier:@"first"];
        [self registerNib:[UINib nibWithNibName:@"ListFirstCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"first"];
        [self registerClass:[ListSecCollectionViewCell class] forCellWithReuseIdentifier:@"sec"];
    }
    return self;
}


//返回顶部按钮响应方法
- (void)topAction:(UIButton *)sender {
    
   
    [self scrollToItemAtIndexPath:[NSIndexPath indexPathWithIndex:0] atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
    
}

#pragma mark UICollectionView delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _firstData.count + _secData.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item < _firstData.count ) {
        return CGSizeMake(kScreenWidth, 456);
    }
    else
        return CGSizeMake(kScreenWidth/2.1, 310);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < _firstData.count) {
        ListFirstCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"first" forIndexPath:indexPath];
        cell.model = _firstData[indexPath.item];
        cell.backgroundColor = [UIColor clearColor];
        return cell;
        
    }
    else{
        ListSecCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"sec" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.model = _secData[indexPath.item - _firstData.count];
        
        return cell;
    }
}

//- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//        if (indexPath.item >= ([collectionView numberOfItemsInSection:0] - 2)) {
////            _oldItem = _curItem;
//            _topBtn.hidden = NO;
//            
//        }
//}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item >= _firstData.count) {
        ListSecCollectionViewCell *cell = (ListSecCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        NSString *urlString = cell.model.link;
        
        ShoppingViewController *shopVc = [self findResponsder];
        BigImageModelViewController *bigVc = [[BigImageModelViewController alloc]init];
        bigVc.urlstring = urlString;
        bigVc.text = cell.model.title;
        [shopVc presentViewController:bigVc animated:YES completion:NULL];
    }
}

- (ShoppingViewController *)findResponsder {
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[ShoppingViewController class]]) {
            return (ShoppingViewController *)responder;
        }
        responder = responder.nextResponder;
        
    }while (responder != nil) ;
    
    return nil;
}


@end
