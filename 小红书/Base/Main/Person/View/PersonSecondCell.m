//
//  PersonSecondCell.m
//  小红书
//
//  Created by 李志文 on 16/2/15.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "PersonSecondCell.h"
#import "UserModel1.h"
#import "NoteButtonController.h"
#import "PersonViewController.h"
#import "BaseNavController.h"

@implementation PersonSecondCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(UserModel1 *)model
{
    _model = model;
    
    self.tagLabel.text = [model.fans stringValue];
    
    self.specialLabel.text = [NSString stringWithFormat:@"%@",model.following_boards];
    
    self.tagLabel.text = [model.following_tags stringValue];
    
    self.fans.text = [NSString stringWithFormat:@"%@",model.fans];
    
    self.followsLabel.text = [NSString stringWithFormat:@"%@",model.follows];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (IBAction)tagButton:(UIButton *)sender {
    
    NoteButtonController *noteVc = [[NoteButtonController alloc] init];
    
    BaseNavController *baseNav = [self findResponsder];
    
    [baseNav pushViewController:noteVc animated:YES];

}

- (BaseNavController *)findResponsder {
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[BaseNavController class]]) {
            return (BaseNavController *)responder;
        }
        responder = responder.nextResponder;
        
    }while (responder != nil) ;
    
    return nil;
}


- (IBAction)specialButton:(UIButton *)sender {
}

- (IBAction)fansButton:(UIButton *)sender {
}

- (IBAction)followsButton:(UIButton *)sender {
}
@end
