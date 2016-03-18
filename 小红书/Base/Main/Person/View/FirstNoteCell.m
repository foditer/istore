//
//  FirstNoteCell.m
//  小红书
//
//  Created by 李志文 on 16/2/16.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "FirstNoteCell.h"
#import "SendViewController.h"
#import "BaseNavController.h"
#import "PersonViewController.h"

@implementation FirstNoteCell

- (void)awakeFromNib {
    
    UIButton *addButton = [self.contentView viewWithTag:100];
    
    [addButton setImage:[UIImage imageNamed:@"xyvg_placeholder_note@2x"] forState:UIControlStateNormal];
    
    [addButton setTitle:@"添加笔记" forState:UIControlStateNormal];
    
    [addButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    addButton.titleLabel.font = [UIFont systemFontOfSize:12];
    
    addButton.titleEdgeInsets = UIEdgeInsetsMake(80, -100, 0, 0);
    
    addButton.imageEdgeInsets = UIEdgeInsetsMake(-5, 0, 0, 0);
}

- (IBAction)addNoteButton:(UIButton *)sender {
    
    SendViewController *senderVc = [[SendViewController alloc] init];
    senderVc.title = @"嗮一嗮";
    
    // 创建导航控制器
    BaseNavController *baseNav = [[BaseNavController alloc] initWithRootViewController:senderVc];
    
    PersonViewController *personVc = [self findResponsder];
    
    [personVc presentViewController:baseNav animated:YES completion:nil];
    
}

- (PersonViewController *)findResponsder {
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[PersonViewController class]]) {
            return (PersonViewController *)responder;
        }
        responder = responder.nextResponder;
        
    }while (responder != nil) ;
    
    return nil;
}

@end
