//
//  MiddleVIew.m
//  小红书
//
//  Created by Apple on 16/2/11.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import "MiddleVIew.h"
#import "MiddleCollectionView.h"



@implementation MiddleVIew


- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    _data =  @[@"全部", @"护肤", @"个人护理", @"品质生活" , @"美食", @"彩妆",  @"保健品", @"小家电", @"母婴"];

    [self creatView];
}

- (void)creatView {
 
    _collectionV = [[MiddleCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 50, 48)];
//    [_collectionV addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:NULL];
    
    _collectionV.data = (NSMutableArray *)_data;
    _collectionV.pageWidth = (kScreenWidth - 50)/4;
    _collectionV.backgroundColor = [UIColor whiteColor];
    [self addSubview:_collectionV];
    
    _arrowBtn = [[UIButton alloc]initWithFrame:CGRectMake(_collectionV.frame.size.width, 0, 50, 48)];
    _arrowBtn.backgroundColor = [UIColor whiteColor];
    _arrowBtn.selected = NO;
    [_arrowBtn setImage:[UIImage imageNamed:@"goods_category_indicator_open.png"] forState:UIControlStateNormal];
    [_arrowBtn setImage:[UIImage imageNamed:@"goods_category_indicator_close.png"] forState:UIControlStateSelected];
    [_arrowBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_arrowBtn];

    
    _secView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 50, 48)];
    _secView.backgroundColor = [UIColor whiteColor];
    _secView.hidden = YES;
    UILabel *allLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 48)];
    allLabel.textAlignment = NSTextAlignmentCenter;
    allLabel.textColor = [UIColor grayColor];
    allLabel.font = [UIFont systemFontOfSize:16];
    allLabel.text = @"全部类别";
    _secView.userInteractionEnabled = YES;
    [_secView addSubview:allLabel];
    [self addSubview:_secView];
    
    
    _shadowView = [[UIView alloc]initWithFrame:CGRectMake(0, 160, kScreenWidth, kScreenHeight - 160)];
    _shadowView.backgroundColor = [UIColor blackColor];
    _shadowView.alpha = 0.2;
    _shadowView.hidden = YES;
    [self insertSubview:_shadowView belowSubview:_secView];
    
  
    [self creatSelectView];

}


- (void)creatSelectView {
    
    _firView = [[UIView alloc]initWithFrame:CGRectMake(0, 48, kScreenWidth, 118)];
    _firView.userInteractionEnabled = YES;
    _firView.backgroundColor = [UIColor colorWithWhite:0.781 alpha:1.000];
    for (int i = 0 ; i <= _data.count; i++) {
        if (i == _data.count) {
            UIButton *buton = [[UIButton alloc]initWithFrame:CGRectMake((kScreenWidth/4)  + 1, 81, kScreenWidth - (kScreenWidth/4)  + 1, 39)];
            buton.backgroundColor = [UIColor whiteColor];
            [_firView addSubview:buton];
        }
        else{
        UIButton *but = [[UIButton alloc]initWithFrame:CGRectMake((i%4) * (kScreenWidth/4 + 0.5), (i/4) *  40 + 0.5, kScreenWidth/4 - 1, 39)];
        but.tag = i + 100;
        but.backgroundColor = [UIColor whiteColor];
        [but setTitle:_data[i] forState:UIControlStateNormal];
        [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [but setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        but.selected = NO;
        [but addTarget:self action:@selector(butAction:) forControlEvents:UIControlEventTouchUpInside];

        [_firView addSubview:but];
        }
    }
    
    [_secView addSubview:_firView];
    
}

- (void)passButon:(NSInteger)item {
   
    UIButton *but = (UIButton *)[_firView viewWithTag:item ];
    but.selected = YES;
    for (UIButton *but1 in _firView.subviews) {
        if (but1.tag != but.tag) {
            but1.selected = NO;
        }
    }
}


//点击箭头后出现的view中的button点击响应事件
- (void)butAction:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    for (UIButton *but in _secView.subviews) {
        if (but.tag != sender.tag) {
            but.selected = NO;
        }
    }
    _collectionV.currentItem = sender.tag - 100;
    _secView.hidden = YES;
    _collectionV.hidden = NO;
    
}

//箭头按钮点击响应事件
- (void)buttonAction:(UIButton *)sender {
  
    [self.superview bringSubviewToFront:_secView];
    sender.selected = !sender.selected;
    _collectionV.hidden = !_collectionV.hidden;
    _secView.hidden = !_secView.hidden;
    _shadowView.hidden = !_shadowView.hidden;
    
}


@end
