//
//  MainViewController.m
//  小红书
//
//  Created by 李志文 on 16/2/13.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "MainViewController.h"
#import "BaseNavController.h"

@interface MainViewController ()

@end

@implementation MainViewController
{
    UIImageView *_tabbarView;
    UIImageView *_selectImgView;
    NSArray *h_imgNames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createViewControllers];
    
    [self _createTabBarView];
}

- (void)_createTabBarView
{
    //把原tabBar上的按钮移除
    for (UIView *view in self.tabBar.subviews ) {
        
        Class cls = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cls]) {
            [view removeFromSuperview];
        }
    }

    
    _tabbarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 49)];
    
    _tabbarView.backgroundColor = [UIColor whiteColor];
    
    _tabbarView.userInteractionEnabled = YES;
    
    [self.tabBar addSubview:_tabbarView];
    
    _selectImgView = [[UIImageView alloc] initWithFrame:CGRectMake(28, 0, 10, 10)];
    
    _selectImgView.image = [UIImage imageNamed:@"eventsale_sort_closed@2x"];
    
    [self.tabBar addSubview:_selectImgView];
    
    NSArray *imgNames = @[@"tab_home@2x",@"tab_search@2x",@"tab_store@2x",@"tab_msn@2x",@"tab_me@2x"];
    
    h_imgNames = @[@"tab_home_h@2x",@"tab_search_h@2x",@"tab_store_h@2x",@"tab_msn_h@2x",@"tab_me_h@2x"];
    
    NSArray *titles = @[@"首页",@"发现",@"购买",@"消息",@"我"];
    
    CGFloat itemWidth = kScreenWidth / 5.0;
    
    for (int i = 0; i < imgNames.count; i ++)
    {
        NSString *name = h_imgNames[i];
        
        NSString *title = titles[i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(itemWidth * i, 0, itemWidth, 49);
        
        [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        
        [button setTitle:title forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        
        button.titleEdgeInsets = UIEdgeInsetsMake(30, -20, 0, 0);
        
        button.imageEdgeInsets = UIEdgeInsetsMake(-10, 16, 0, 0);
        
        button.tag = i;
        
        [button addTarget:self action:@selector(selectTab:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBar addSubview:button];
    }
    
}

- (void)_createViewControllers
{
    NSArray *storyboardNames = @[@"Home",@"Discover",@"Shopping",@"Message",@"Person"];
    
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:5];
    
    for (int i = 0; i < storyboardNames.count; i ++)
    {
        NSString *name = storyboardNames[i];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
        
        BaseNavController *navigation = [storyboard instantiateInitialViewController];
        
        [viewControllers addObject:navigation];
    }
    
    self.viewControllers = viewControllers;
    

}


- (void)selectTab:(UIButton *)button
{
    CGFloat itemWidth = kScreenWidth / 5.0;
    
    [UIView animateWithDuration:0.2 animations:^{
        CGPoint point = CGPointMake(button.tag * itemWidth + 30, 5);
        
        _selectImgView.center = point;
    }];
    
//     NSString *h_name = h_imgNames[button.tag];
//    
//    [button setImage:[UIImage imageNamed:h_name] forState:UIControlStateNormal];
    
    self.selectedIndex = button.tag;
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
