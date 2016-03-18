//
//  FirstSpecialCell.m
//  小红书
//
//  Created by 李志文 on 16/2/16.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "FirstSpecialCell.h"

@implementation FirstSpecialCell

- (void)awakeFromNib {
        
        UIButton *addButton = [self.contentView viewWithTag:100];
        
        [addButton setImage:[UIImage imageNamed:@"xyvg_placeholder_board@2x"] forState:UIControlStateNormal];
        
        [addButton setTitle:@"添加专辑" forState:UIControlStateNormal];
        
        [addButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        addButton.titleLabel.font = [UIFont systemFontOfSize:12];
        
        addButton.titleEdgeInsets = UIEdgeInsetsMake(80, -93, 0, 0);
        
        addButton.imageEdgeInsets = UIEdgeInsetsMake(-5, 0, 0, 0);

}

- (IBAction)addSpecial:(UIButton *)sender {
}
@end
