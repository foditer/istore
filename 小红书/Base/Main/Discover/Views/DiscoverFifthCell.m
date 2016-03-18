//
//  DiscoverFifthCell.m
//  SmallBook
//
//  Created by Apple on 16/2/23.
//  Copyright © 2016年 胡哲逊. All rights reserved.
//

#import "DiscoverFifthCell.h"
#import "FifthView.h"
#import "FifthCellModel.h"
@implementation DiscoverFifthCell

- (void)awakeFromNib {
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        _data = [[NSArray alloc]init];
        _viewArr = [[NSMutableArray alloc]init];
    
    }
    return self;
}

- (void)creatView {
  
    for (int i = 0; i < _data.count/2; i++) {
        for (int j = 0; j <= 1; j++) {
            FifthView *_fifthView = [[FifthView alloc]initWithFrame:CGRectMake(j*(kScreenWidth/2) + 10, (i) * 260 + 20 * (i), kScreenWidth/2 - 18, 260)];
            _fifthView.backgroundColor = [UIColor whiteColor];
            [self.contentView addSubview:_fifthView];
            [_viewArr addObject:_fifthView];
           
        }
        continue;
    }
    
}

- (void)setData:(NSArray *)data {
    if (_data != data) {
        _data = data;
        if (_viewArr.count == 0) {
             [self creatView];
        }
        for (int i = 0; i < _data.count ; i++) {
            FifthCellModel *model = _data[i];
            FifthView *view = _viewArr[i];
            view.model = model;
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
