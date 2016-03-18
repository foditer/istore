//
//  MessageViewController.m
//  小红书
//
//  Created by 李志文 on 16/2/14.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableViewCell.h"
#import "MessageImageCell.h"
#import "AFNetworking.h"
#import "MessageModel.h"
#import "CellViewController.h"

static NSString *msgeCellID = @"messageCellID";
static NSString *msgeImgeCellID = @"messageImgeCellID";

@interface MessageViewController ()
{
    UITableView *_tableView;
}

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    _data = [[NSMutableArray alloc] init];
    
    [self _requestData];
    
    [self performSelector:@selector(_createTableView) withObject:self afterDelay:1];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [_tableView reloadData];
}

- (void)_requestData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    NSString *url = kMessageAPI;
    
    [manager GET:url parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self _setJsonData:responseObject];
        
    } failure:NULL];
    
}

- (void)_setJsonData:(id)response
{
    
    
    NSArray *arr = [response objectForKey:@"data"];
    
    for (NSDictionary *dic in arr) {
        
        MessageModel *modal = [[MessageModel alloc] init];
        
        modal.desc = dic[@"desc"];
        modal.imageUrl = [dic objectForKey:@"image"];
        
        modal.title = [dic objectForKey:@"title"];
        
        [_data addObject:modal];
        
        [_tableView reloadData];
        
    }
    
}


- (void)_createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.sectionHeaderHeight = 0;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[MessageTableViewCell class] forCellReuseIdentifier:msgeCellID];
    
    [_tableView registerClass:[MessageImageCell class] forCellReuseIdentifier:msgeImgeCellID];
}

#pragma - mark UITableViewdelegate

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(7, 10, 20, 20)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(37 + 5, 11, 200, 20)];
        
        imageView.image = [UIImage imageNamed:@"message_new_activity@2x"];
        
        label.text = @"专题活动";
        
        label.font = [UIFont systemFontOfSize:14];
        
        label.backgroundColor = [UIColor clearColor];
        
        [headView addSubview:imageView];
        [headView addSubview:label];
        
        
        return headView;

    }else
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0.1)];
        view.backgroundColor = [UIColor redColor];
        
        return view;
    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 1)
    {
        UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(230, 8, 10, 10)];
        
        imageView.image = [UIImage imageNamed:@"eventsale_sort_closed_default@2x"];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(60, 0, 180, 30)];
        
        [button setTitle:@"查看更多购物专题" forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        
        button.titleEdgeInsets = UIEdgeInsetsMake(5, 35, 5, 5);
        
        button.contentHorizontalAlignment = YES;
        button.contentVerticalAlignment = YES;
        
        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        
        [footView addSubview:button];
        [footView addSubview:imageView];
        
        
        
        return footView;
        
    }else
        return nil;

}

- (void)buttonAction
{

}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0.1;
    }else
        return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0;
    }else
        return 30;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        return 150;
    }else
        return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 4;
    }else
        return _data.count;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:msgeCellID forIndexPath:indexPath];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (indexPath.row == 0)
        {
            cell.msgeImgView.image = [UIImage imageNamed:@"message_new_fans@2x"];
            cell.msgeTextLabel.text = @"新的粉丝";
            
            
        }else if (indexPath.row == 1)
        {
            cell.msgeImgView.image = [UIImage imageNamed:@"message_new_comments@2x"];
            cell.msgeTextLabel.text = @"新的评论";
            

        }else if (indexPath.row == 2)
        {
            cell.msgeImgView.image = [UIImage imageNamed:@"message_new_likes@2x"];
            cell.msgeTextLabel.text = @"新的赞";
        
 
        }else if (indexPath.row == 3)
        {
            cell.msgeImgView.image = [UIImage imageNamed:@"message_new_system@2x"];
            cell.msgeTextLabel.text = @"通知";
        }
        
        return cell;
    }else
    {
        MessageImageCell *cell = [tableView dequeueReusableCellWithIdentifier:msgeImgeCellID forIndexPath:indexPath];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.model = _data[indexPath.row];
        
        cell.imageLabel.text = @"点击查看";
        [cell.imageLabel setBackgroundColor:[UIColor darkGrayColor]];
        [cell.imageLabel setTextColor:[UIColor whiteColor]];
        
        return cell;
    
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0)
    {
        CellViewController *pushVc = [[CellViewController alloc] init];
        
        [self.navigationController pushViewController:pushVc animated:YES];
    }
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
