//
//  FifthView.m
//  SmallBook
//
//  Created by Apple on 16/2/23.
//  Copyright © 2016年 胡哲逊. All rights reserved.
//

#import "FifthView.h"
#import "FifthCellModel.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
@implementation FifthView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor whiteColor];
        [self creatView];
    }
    return self;
}

- (void)setModel:(FifthCellModel *)model {
    if (_model != model) {
        _model = model;
        [_big sd_setImageWithURL:[NSURL URLWithString:_model.imageUrl] forState:UIControlStateNormal];
        _commentLabel.text = _model.comment;
        [_userImageView sd_setImageWithURL:[NSURL URLWithString:_model.littleUrl]];
        [_userName setTitle:_model.userName forState:UIControlStateNormal];
        _likeNumLabel.text = [NSString stringWithFormat:@"%li",(long)_model.like];
    }
}

- (void)creatView {
    _big = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width , 150)];
    _big.backgroundColor = [UIColor whiteColor];
    [_big addTarget:self action:@selector(bigButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_big];
    
    _commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _big.frame.size.height + 10, _big.frame.size.width, 60)];
    _commentLabel.backgroundColor = [UIColor whiteColor];
    _commentLabel.textColor = [UIColor blackColor];
    _commentLabel.textAlignment = NSTextAlignmentLeft;
    _commentLabel.numberOfLines = 2;
    _commentLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_commentLabel];
    
    
    _userImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, _commentLabel.frame.origin.y + 60, 30, 30)];
    _userImageView.layer.cornerRadius = 15;
    _userImageView.clipsToBounds = YES;
    _userImageView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_userImageView];
    
    _userName = [[UIButton alloc]initWithFrame:CGRectMake(_userImageView.frame.size.width , _userImageView.frame.origin.y, kScreenWidth/2 - 20 - 80, _userImageView.frame.size.height)];
    [_userName setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _userName.titleLabel.font = [UIFont systemFontOfSize:11];
    [_userName addTarget:self action:@selector(userNameAction:) forControlEvents:UIControlEventTouchUpInside];
    _userName.backgroundColor = [UIColor whiteColor];
    [self addSubview:_userName];
    
    _likeBtn = [[UIButton alloc]initWithFrame:CGRectMake(_userName.frame.origin.x + _userName.frame.size.width, _userName.frame.origin.y, 30, 30)];
    _likeBtn.selected = NO;
    _likeBtn.backgroundColor = [UIColor whiteColor];
    [_likeBtn setImage:[UIImage imageNamed:@"xyvg_home_like@2x.png"] forState:UIControlStateNormal];
    [_likeBtn setImage:[UIImage imageNamed:@"xyvg_home_like_hover@2x.png"] forState:UIControlStateSelected];
    [_likeBtn addTarget:self action:@selector(likeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_likeBtn];
    
    _likeNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(_likeBtn.frame.origin.x + 30, _likeBtn.frame.origin.y, 30, 30)];
    _likeNumLabel.textColor = [UIColor blackColor];
    _likeNumLabel.font = [UIFont systemFontOfSize:10];
    _likeNumLabel.textAlignment = NSTextAlignmentLeft;
//    _likeNumLabel.backgroundColor = [UIColor whiteColor];
    [self addSubview:_likeNumLabel];
}

- (void)likeBtnAction:(UIButton *)sender {
    
    sender.selected = !sender.selected;

    
}

//点击用户名响应事件
- (void)userNameAction:(UIControl *)control{
    
    NSLog(@"用户名点击了");
    
}

//点击大图响应事件
- (void)bigButtonAction:(UIButton *)sender {
    
    NSLog(@"点击大图");
}

@end
