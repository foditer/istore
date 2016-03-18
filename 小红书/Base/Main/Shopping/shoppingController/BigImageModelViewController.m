//
//  BigImageModelViewController.m
//  小红书
//
//  Created by Apple on 16/2/22.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import "BigImageModelViewController.h"

@interface BigImageModelViewController ()

@end

@implementation BigImageModelViewController

- (void)viewWillLayoutSubviews {
    
    [self creatView];
}

- (void)creatView {
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 70, kScreenWidth, kScreenHeight)];
    NSURL *url = [NSURL URLWithString:_urlstring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 70)];
    _topView.backgroundColor = [UIColor colorWithWhite:0.864 alpha:1.000];
    _label = [[UILabel alloc]initWithFrame:CGRectMake(60, 30, kScreenWidth - 120, 30)];
    _label.textColor = [UIColor colorWithRed:0.299 green:0.304 blue:0.306 alpha:1.000];
    //    _label.backgroundColor = [UIColor redColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:20];
    _label.text = _text;
    [_topView addSubview:_label];
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 30, 40, 30)];
    //    [backBtn setImage:[UIImage imageNamed:@"signup_arrow@2x.png"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"signup_arrow@2x.png"]  forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:backBtn];
    
    UIButton *shareBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth - 60, 30, 40, 30)];
    //    [shareBtn setImage:[UIImage imageNamed:@"xy_btn_share@2x.png"] forState:UIControlStateNormal];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"xy_btn_share@2x.png"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:shareBtn];
    
    [self.view addSubview:_topView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
    
}

- (void)setText:(NSString *)text {
    
    if (_text != text) {
        _text = text;
    }
}

- (void)backAction:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)shareAction:(UIButton *)sender{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
