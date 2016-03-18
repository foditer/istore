//
//  PersonThirdCell.m
//  小红书
//
//  Created by 李志文 on 16/2/15.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "PersonThirdCell.h"

@implementation PersonThirdCell

- (void)awakeFromNib {
    
    NSArray *titles = @[@"购物车",@"订单",@"署券",@"心愿单"];
    
    for (int i = 100; i < 104;  i ++)
    {
        
        NSString *title = titles[i - 100];
        
        UIButton *button = [self.contentView viewWithTag:i];
        
        [button setTitle:title forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        
        button.titleEdgeInsets = UIEdgeInsetsMake(45, -40, 0, 0);
        
        button.imageEdgeInsets = UIEdgeInsetsMake(-15, 16, 0, 0);

    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)shoppingCar:(id)sender {
}

- (IBAction)ident:(id)sender {
}

- (IBAction)ticket:(id)sender {
}

- (IBAction)wish:(id)sender {
}

@end
