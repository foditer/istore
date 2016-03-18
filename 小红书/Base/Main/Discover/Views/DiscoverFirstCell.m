//
//  DiscoverFirstCell.m
//  SmallBook
//
//  Created by Macx on 16/2/22.
//  Copyright © 2016年 胡哲逊. All rights reserved.
//

#import "DiscoverFirstCell.h"
#import "Discover.h"
#import "UIImageView+WebCache.h"

@implementation DiscoverFirstCell

- (void)awakeFromNib {
    // Initialization code
}


-(void)layoutSubviews
{
    [super layoutSubviews];
//    _scrollView.backgroundColor = [UIColor blueColor];
    _scrollView.contentSize = CGSizeMake(650, 65);
    _scrollView.contentOffset = CGPointMake(0, 0);
    //    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.scrollEnabled = YES;
    
    for (int i = 0; i < 5; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(5*(i+1)+65*i, 5, 60, 60)];
        
        imgView.backgroundColor = [UIColor grayColor];
        NSString *imgUrl = ((Discover *)_modalArr[i]).imgUrl;
        NSURL *url = [NSURL URLWithString:imgUrl];
//        imgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        [imgView sd_setImageWithURL:url];
        
        
        [_scrollView addSubview:imgView];
    }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
    

}

- (IBAction)findButton:(id)sender {
}
@end
