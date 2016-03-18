//
//  TopVIew.m
//  小红书
//
//  Created by Apple on 16/2/11.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import "TopVIew.h"

@implementation TopVIew


- (void)awakeFromNib {
    
    [super awakeFromNib];
    [self creatView];
}

- (void)creatView {
  
    UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(20, 20, kScreenWidth - 20 - 50, 42)];
//    field.placeholder = @"搜索在售商品";
    field.textAlignment = NSTextAlignmentLeft;
    //设置placeholder字体
//    [field setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    NSMutableAttributedString *attrobute = [[NSMutableAttributedString alloc]initWithString:@"搜索在售商品"];
    [attrobute addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, attrobute.length)];
    [attrobute addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, attrobute.length)];
    field.attributedPlaceholder = attrobute;

    field.backgroundColor = [UIColor colorWithRed:0.814 green:0.000 blue:0.000 alpha:0.850];
    field.delegate = self;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, field.frame.size.height - 10)];
    imageView.image = [UIImage imageNamed:@"btn_search@2x.png"];

    field.leftView = imageView;
    field.leftViewMode = UITextFieldViewModeAlways;
    
    [self addSubview:field];
    
    UIImageView *cartView = [[UIImageView alloc]initWithFrame:CGRectMake(field.frame.size.width + 20, field.frame.origin.y + 5, kScreenWidth - field.frame.size.width - 20, field.frame.size.height - 15)];
    cartView.image = [UIImage imageNamed:@"store_cart@2x.png"];
    cartView.contentMode = UIViewContentModeScaleAspectFit;
    cartView.userInteractionEnabled = YES;
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, cartView.frame.size.width, cartView.frame.size.height)];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [cartView addSubview:button];
    
    [self addSubview:cartView];

}


- (void)buttonAction:(UIButton *)sender {
    
    NSLog(@"响应了");
}

@end
