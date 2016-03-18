
//
//  PersonViewController.m
//  小红书
//
//  Created by 李志文 on 16/2/9.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "PersonViewController.h"
#import "PersonTableViewCell.h"
#import "PersonSecondCell.h"
#import "PersonThirdCell.h"
#import "ButtonCell.h"
#import "SettingTableViewController.h"
#import "AddTableViewController.h"
#import "CollectionView.h"
#import "AFNetworking.h"
#import "UserModel1.h"
#import "NoteModel.h"


static NSString *personCell = @"personCell";
static NSString *personSecondCell = @"personSecondCell";
static NSString *personThirdCell = @"personThirdCell";
static NSString *buttonCellID = @"buttonCell";
//static NSString *collectionCellID = @"collectionCellID";

@interface PersonViewController ()
{
    UITableView *_tableView;
}
@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Javenlee";
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
    _data = [[NSMutableArray alloc] init];
    _secData = [[NSMutableArray alloc] init];
    _specialArr = [[NSMutableArray alloc] init];
    
    [self _requestData];
    [self _requestSecondData];
    [self _requestSpecialData];
    
    [self performSelector:@selector(_createTableVIew) withObject:self afterDelay:1];

    
    [self _createTabBar];
}

- (void)_requestData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];

    NSString *url = kPersonAPI;

    [manager GET:url parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {


        [self _setJsonData:responseObject];

//        NSLog(@"%@",responseObject);



    } failure:NULL];
}

- (void)_requestSecondData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    NSString *url = kMyNotesAPI;
    
    [manager GET:url parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self _setNoteJson:responseObject];
        
    } failure:NULL];
    
}

- (void)_requestSpecialData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    NSString *url = kMySpecialAPI;
    
    [manager GET:url parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSLog(@"%@",responseObject);
        [self _setSpecialJason:responseObject];
        
    } failure:NULL];

    
}

- (void)_setSpecialJason:(id)response
{
    NSArray *arr = [response objectForKey:@"data"];
    
    for (NSDictionary *dic in arr)
    {
        NoteModel *model = [[NoteModel alloc] init];
        
        NSMutableArray *images = [dic objectForKey:@"images"];
        
        model.imgs = images;
        
        [_specialArr addObject:model];
        
        [_tableView reloadData];
    }
}

- (void)_setJsonData:(id)response
{

    NSDictionary *dic = [response objectForKey:@"data"];


        UserModel1 *modal = [[UserModel1 alloc] init];

        modal.fans = [dic objectForKey:@"fans"];
        modal.headImgUrl = [dic objectForKey:@"imageb"];

    modal.name = [dic objectForKey:@"nickname"];

        modal.following_boards = [dic objectForKey:@"following_boards"];

        modal.following_tags = [dic objectForKey:@"following_tags"];

        modal.follows = [dic objectForKey:@"follows"];

    modal.myNotes = [dic objectForKey:@"ndiscovery"];

    modal.mySpecials = [dic objectForKey:@"nboards"];


        [_data addObject:modal];

    [_tableView reloadData];

}

- (void)_setNoteJson:(id)response
{
    NSArray *arr = [response objectForKey:@"data"];
    
    for (NSDictionary *dic in arr)
    {
        NoteModel *model = [[NoteModel alloc] init];
        
        NSArray *images_list = [dic objectForKey:@"images_list"];
        
        NSDictionary *img = images_list[0];
        
        model.imgUrl = [img objectForKey:@"url"];
        
        [_secData addObject:model];
        
        [_tableView reloadData];
    }
}

- (void)_createTableVIew
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    [ _tableView registerNib:[UINib nibWithNibName:@"PersonTableViewCell" bundle:nil] forCellReuseIdentifier:personCell];
    
    [_tableView registerNib:[UINib nibWithNibName:@"PersonSecondCell" bundle:nil] forCellReuseIdentifier:personSecondCell];
    
    [_tableView registerNib:[UINib nibWithNibName:@"PersonThirdCell" bundle:nil] forCellReuseIdentifier:personThirdCell];
    
    [_tableView registerNib:[UINib nibWithNibName:@"ButtonCell" bundle:nil] forCellReuseIdentifier:buttonCellID];
    
}

- (void)_createTabBar
{
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    
    [rightButton setImage:[UIImage imageNamed:@"xy_btn_setting@2x"] forState:UIControlStateNormal];
    
    [leftButton setImage:[UIImage imageNamed:@"xy_btn_invite@2x"] forState:UIControlStateNormal];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [leftButton addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    
    [rightButton addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)leftAction
{
    AddTableViewController *tabVC = [[AddTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    [self.navigationController pushViewController:tabVC animated:YES];
}

- (void)rightAction
{
    SettingTableViewController *tableVC = [[SettingTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    [self.navigationController pushViewController:tableVC animated:YES];
    
}

#pragma - mark UITableView delegate
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0.1)];
        
        headView.backgroundColor = [UIColor redColor];
        
        return headView;
        
    }else
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0.1)];
        view.backgroundColor = [UIColor redColor];
        
        return view;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            return 130;
        }else
            return 60;
        
    }else
    {
        if (indexPath.row == 0)
        {
            return 70;
        }else
        {
            return 500;
        }
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:personCell forIndexPath:indexPath];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.model = _data[0];
            
            return cell;
        }else
            {
                PersonSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:personSecondCell forIndexPath:indexPath];
            
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.model = _data[0];
                return cell;
            }
    }else
    {
        if (indexPath.row == 0)
        {
            PersonThirdCell *cell = [tableView dequeueReusableCellWithIdentifier:personThirdCell forIndexPath:indexPath];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell;

        }else
        {
    
        ButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:buttonCellID forIndexPath:indexPath];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.model = _data[0];
            
            cell.ModelArr = _secData;
            cell.specialArr = _specialArr;
            return cell;
        }
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
