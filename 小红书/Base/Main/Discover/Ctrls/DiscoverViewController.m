//
//  DiscoverViewController.m
//  SmallBook
//
//  Created by Macx on 16/2/21.
//  Copyright © 2016年 胡哲逊. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DiscoverFirstCell.h"
#import "DiscoverSecondCell.h"
#import "DiscoverThirdCell.h"
#import "FourthCell.h"
#import "Discover.h"
#import "AFNetworking.h"
#import "ThirdCellModal.h"
#import "FourthCellModal.h"
#import "DiscoverFifthCell.h"
#import "FifthCellModel.h"


@interface DiscoverViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    NSMutableArray *modalArr;
    NSMutableArray *desModalArr;
    NSMutableArray *scenarioArr;
    NSMutableArray *brandsArr;
    
}
@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _fifthData = [NSMutableArray array];
    
    self.title = @"发现";
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    
    [self _loadData];
    
    [self _createTableView];
    
    [_tableView registerNib:[UINib nibWithNibName:@"DiscoverFirstCell" bundle:nil]forCellReuseIdentifier:@"DiscoverFirstCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"DiscoverSecondCell" bundle:nil]forCellReuseIdentifier:@"DiscoverSecondCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"DiscoverThirdCell" bundle:nil]forCellReuseIdentifier:@"cell"];
    [_tableView registerNib:[UINib nibWithNibName:@"FourthCell" bundle:nil] forCellReuseIdentifier:@"FourthCell"];
    [_tableView registerClass:[DiscoverFifthCell class] forCellReuseIdentifier:@"fifth"];
    self.automaticallyAdjustsScrollViewInsets = NO;

}


- (void)_createTableView
{
    _tableView.delegate = self;
    _tableView.dataSource = self;
//    _tableView.backgroundColor = [UIColor grayColor];

    [self.tableView.tableHeaderView removeFromSuperview];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

- (void)_loadData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = @"http://www.xiaohongshu.com/api/sns/v1/explore/banner?platform=Android&source=discovery&deviceId=c2cd3a17-1bbf-3894-9d72-b61526ca7cc7&versionName=4.2.201&channel=Store360&sid=session.1138361912838360608&lang=zh-Hans&t=1456159322&sign=be1291add63ecc72306d1f296fe21a6c";
    
    
//    NSURLSessionDataTask *task = [manager dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//        NSDictionary *dic = responseObject;
//        
//        NSDictionary *boardsData = dic[@"data"];
//        NSArray *dataArr = boardsData[@"boards"];
//        modalArr = [NSMutableArray array];
//        for (NSDictionary *dic in dataArr) {
//            Discover *discoverModal = [[Discover alloc] init];
//            discoverModal.imgUrl = dic[@"image"];
//            discoverModal.name = dic[@"name"];
//            
//            [modalArr addObject:discoverModal];
//        }
//        
//        desModalArr = [NSMutableArray array];
//        NSDictionary *destinationData = boardsData[@"destination"];
//        NSLog(@"%@", destinationData);
//        for (NSDictionary *dic in destinationData[@"banners"]) {
//            Discover *modal = [[Discover alloc] init];
//            modal.destinationImgUrl = dic[@"image"];
//            modal.destinationName = dic[@"name"];
//            modal.destinationFollows = dic[@"total_follows"];
//            
//            [desModalArr addObject:modal];
//        }
//
//    }];
//    [task resume];
    
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSDictionary *dic = responseObject;
        
        NSDictionary *boardsData = dic[@"data"];
        NSArray *dataArr = boardsData[@"boards"];
        modalArr = [NSMutableArray array];
        for (NSDictionary *dic in dataArr) {
            Discover *discoverModal = [[Discover alloc] init];
            discoverModal.imgUrl = dic[@"image"];
            discoverModal.name = dic[@"name"];
            
            [modalArr addObject:discoverModal];
        }
        
        desModalArr = [NSMutableArray array];
        NSDictionary *destinationData = boardsData[@"destination"];
        NSLog(@"%@", destinationData);
        for (NSDictionary *dic in destinationData[@"banners"]) {
            Discover *modal = [[Discover alloc] init];
            modal.destinationImgUrl = dic[@"image"];
            modal.destinationName = dic[@"name"];
            modal.destinationFollows = dic[@"total_follows"];
            
            [desModalArr addObject:modal];
        }
        
        scenarioArr = [NSMutableArray array];
        NSArray *scenArr = boardsData[@"scenario"];
        for (NSDictionary *dic in scenArr) {
            ThirdCellModal *modal = [[ThirdCellModal alloc] init];
            modal.name = dic[@"name"];
            modal.imageURL = dic[@"image"];
            modal.total_follows = dic[@"total_follows"];
            
            [scenarioArr addObject:modal];
        }
        
        brandsArr = [NSMutableArray array];
        NSArray *bArr = boardsData[@"brands"];
        for (NSDictionary *dic in bArr) {
            FourthCellModal *modal = [[FourthCellModal alloc] init];
            modal.imageURL = dic[@"image"];
            modal.total_follows = dic[@"total_follows"];
            modal.name = dic[@"name"];
            
            [brandsArr addObject:modal];
        }
        
        [self loadFifthData];
        
        
        
//        NSLog(@"%@",((Discover *)modalArr[0]).imgUrl);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"wrong");
    }];
    
    [_tableView reloadData];
}

- (void)loadFifthData {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *urlString = @"http://www.xiaohongshu.com/api/sns/v1/explore/notes?page=1&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456276408&sign=fd83ff3320e0fff5f0e0f43ac2fd8ebd";
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    [manager GET:urlString parameters:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSArray *arr = responseObject[@"data"];
        
        for (NSDictionary *dic in arr) {
            NSDictionary *user = dic[@"user"];
            FifthCellModel *model = [[FifthCellModel alloc]init];
            model.userId = user[@"userid"];
            model.userName = user[@"nickname"];
            model.littleUrl = user[@"images"];
            model.imageUrl = dic[@"images"];
            model.comment = dic[@"desc"];
            model.like = [[dic objectForKey:@"likes"] integerValue];
            model.userNameLink = [NSString stringWithFormat:@"http://www.xiaohongshu.com/api/v2/usr/discovery?uid=%@&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456277972&sign=115288aa330519ff853041f26811aa13",model.userId];
            [_fifthData addObject:model];
            
        }
        _ifthCellHeight = _fifthData.count * 300 / 2 - 80;
        [_tableView reloadData];
        
    } failure:NULL];
    
}


#pragma mark - tableView Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 3) {
        return 2;
    }else if(section == 1)
    {
        return 2;
    }else{
        return 1;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        DiscoverFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DiscoverFirstCell"];
//        if (!cell) {
//            cell = [[[NSBundle mainBundle] loadNibNamed:@"DiscoverFirstCell" owner:self options:nil] lastObject];
//        }
        
        cell.modalArr = modalArr;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            DiscoverSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DiscoverSecondCell"];
            //    if (!cell) {
            //        cell = [[[NSBundle mainBundle] loadNibNamed:@"DiscoverSecondCell" owner:self options:nil] lastObject];
            //    }
            
            cell.modalArr = desModalArr;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            UITableViewCell *cell = [[UITableViewCell alloc] init];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
            label.textColor = [UIColor grayColor];
            label.text = @"查看更多目的地";
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:15];
            [cell.contentView addSubview:label];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell;
        }
        
        
    }else if (indexPath.section == 2 && indexPath.row == 0)
    {
        DiscoverThirdCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.modalArr = scenarioArr;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    
    }else if (indexPath.section == 3 )
    {
        if (indexPath.row == 0) {
            FourthCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FourthCell"];
            cell.modalArr = brandsArr;
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            UITableViewCell *cell = [[UITableViewCell alloc] init];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
            label.textColor = [UIColor grayColor];
            label.text = @"查看更多品牌";
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:15];
            [cell.contentView addSubview:label];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell;
        }
        
    }
    else if(indexPath.section == 4){
        DiscoverFifthCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fifth"];
        
        cell.data = _fifthData;
        cell.backgroundColor = [UIColor colorWithWhite:0.926 alpha:1.000];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 122;
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            return 237;
        }else{
            return 30;
        }
        
    }else if (indexPath.section == 2)
    {
        return 600;
    }else if(indexPath.section == 3){
        if (indexPath.row == 0) {
            return 178;
        }else{
            return 30;
        }
    }else{
        return _ifthCellHeight;
    }
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.1)];
    
    return view;
}

//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
//{
//    return 1;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    NSString *str = @"热门笔记";
//    return str;
//}

@end
