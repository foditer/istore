//
//  DiscoverFirstCell.h
//  SmallBook
//
//  Created by Macx on 16/2/22.
//  Copyright © 2016年 胡哲逊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoverFirstCell : UITableViewCell
- (IBAction)findButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic, copy)NSMutableArray *modalArr;
@end
