//
//  MainTabBarController.m
//  小红书
//
//  Created by 李志文 on 16/2/12.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createSubVc];
}

- (void)_createSubVc
{
    NSArray *names = @[@"Home",@"Discover",@"Shopping",@"Message",@"Person"];
    
    NSMutableArray *navArray = [[NSMutableArray alloc] init];
    
    for (NSString *name in names)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
        
        UINavigationController *nav = [storyboard instantiateInitialViewController];
        
        [navArray addObject:nav];
        
    }
    
    self.viewControllers = navArray;
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
