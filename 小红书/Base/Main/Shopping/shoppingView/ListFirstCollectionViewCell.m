//
//  ListFirstCollectionViewCell.m
//  小红书
//
//  Created by Apple on 16/2/22.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import "ListFirstCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "ListCollModel.h"
#import "LittleCollectionViewCell.h"
#import "ShoppingViewController.h"
#import "BigImageModelViewController.h"
#import "LittleModel.h"

@implementation ListFirstCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _littleArr = [[NSMutableArray alloc]init];
        _collView.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
//        [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

//- (void)buttonAction:(UIButton *)sender {
//    
//    NSLog(@"点击了");
//    
//    ShoppingViewController *shopVc = [self findResponsder];
//    
//    BigImageModelViewController *bigVc = [[BigImageModelViewController alloc]init];
//    [shopVc presentViewController:bigVc animated:YES completion:NULL];
//}




- (void)awakeFromNib {
    [super awakeFromNib];
    _littleArr = [[NSMutableArray alloc]init];
    _collView.backgroundColor = [UIColor colorWithWhite:0.978 alpha:1.000];
    self.collView.delegate = self;
    self.collView.dataSource = self;
    
     [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)setModel:(ListCollModel *)model {
  
    if (_model != model) {
        _model = model;
       [_bigImageVIew sd_setImageWithURL:[NSURL URLWithString:_model.imageurl]];
        _littleArr = _model.littleData;
        [_collView reloadData];
        [_collView registerClass:[LittleCollectionViewCell class] forCellWithReuseIdentifier:@"little"];
    }
   
}

#pragma mark UICollectionView delegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LittleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"little" forIndexPath:indexPath];
    cell.model = _littleArr[indexPath.item];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(kScreenWidth/3, self.collView.frame.size.height);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return  _littleArr.count;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
  
        LittleModel *mod = _littleArr[indexPath.item];
        NSString *urlString = mod.link;
    
        ShoppingViewController *shopVc = [self findResponsder];
        BigImageModelViewController *bigVc = [[BigImageModelViewController alloc]init];
        bigVc.urlstring = urlString;
        bigVc.text = mod.title;
        [shopVc presentViewController:bigVc animated:YES completion:NULL];

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
