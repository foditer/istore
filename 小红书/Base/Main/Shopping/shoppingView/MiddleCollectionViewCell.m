//
//  MiddleCollectionViewCell.m
//  小红书
//
//  Created by Apple on 16/2/12.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import "MiddleCollectionViewCell.h"

@implementation MiddleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
}

- (void)creatView {
  
    _label = [[UILabel alloc]init];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_label];
        self.backgroundColor = [UIColor whiteColor];
    
}

- (void)setTitle:(NSString *)title {
    
    if (_title != title) {
        _title = title;
        _label.text = _title;
    }
    
}

@end
