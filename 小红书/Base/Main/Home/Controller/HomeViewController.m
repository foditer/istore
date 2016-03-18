//
//  HomeViewController.m
//  小红书
//
//  Created by apple on 16/2/18.
//  Copyright © 2016年 Norman. All rights reserved.
//

#import "HomeViewController.h"
#import "AFNetworking.h"
#import "HomeModel.h"
#import "HomeTabelView.h"
#import "HomeLayoutFrame.h"
#import "HomeTopView.h"
#import "WXRefresh.h"

@interface HomeViewController ()
{
    HomeTabelView *homeTabelView;
    HomeTopView *homeTopView;
}
@end

@implementation HomeViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    //    创建homeTopView
    homeTopView = [[HomeTopView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    
    homeTopView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:homeTopView];
    
    //    创建homeTabelView
    homeTabelView = [[HomeTabelView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        homeTabelView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:homeTabelView];

    
    //    网络请求数据（Get）
    NSString *url = @"http://www.xiaohongshu.com/api/sns/v1/homefeed?deviceId=EAA2D7A2-3660-47BA-B5A8-071C3BFA2CE2&lang=zh-Hans-CN&num=20&platform=iOS&sid=session.1139236448801802231&sign=b9a24a90346880d7d20067a9da16c53d&t=1455931733";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dataArr = [responseObject objectForKey:@"data"];
        
        NSMutableArray *homeLayoutFrameModels = [NSMutableArray arrayWithCapacity:dataArr.count];
        
        for (NSDictionary *data in dataArr) {
            HomeModel *homeModel = [[HomeModel alloc] initContentWithDic:data];
            HomeLayoutFrame *frame = [[HomeLayoutFrame alloc] init];
            frame.homeModel = homeModel;
            [homeLayoutFrameModels addObject:frame];
        }
        
        //将请求到的Model数据给tabelView去显示
        homeTabelView.models = homeLayoutFrameModels;
//                NSLog(@"responseObject:%@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误原因：%@", error);
    }];
    
    //设置下拉刷新
    __weak __typeof(self) weakSelf = self;
    [homeTabelView addPullDownRefreshBlock:^{
            [weakSelf loadData];
    }];
    
    //设置上拉加载
    [homeTabelView addInfiniteScrollingWithActionHandler:^{
//        [weakSelf loadOldData];
    }];
}

-(void)loadData
{
    //获取当前第一条微博since_id
    long since_id = 0;
    if (homeTabelView.models.count > 0) {
        HomeLayoutFrame *layout = homeTabelView.models[0];
        since_id = layout.homeModel.id;
    }
    
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:
                                 @{
                                   @"since_id" : [NSString stringWithFormat:@"%ld", since_id]
                                   }];
    
    NSString *url = @"http://www.xiaohongshu.com/api/sns/v1/homefeed?deviceId=EAA2D7A2-3660-47BA-B5A8-071C3BFA2CE2&lang=zh-Hans-CN&num=20&platform=iOS&sid=session.1139236448801802231&sign=b9a24a90346880d7d20067a9da16c53d&t=1455931733";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:mDic progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self loadDataFinish:responseObject isSinceID:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误原因：%@", error);
    }];

    
//    [self.appDelegate.sinaWeibo
//     requestWithURL:@"statuses/home_timeline.json"
//     params:mDic
//     httpMethod:@"GET"
//     finishBlock:^(SinaWeiboRequest *request, id result) {
//         [self loadDataFinish:result isSinceID:YES];
//     } failBlock:^(SinaWeiboRequest *request, NSError *error) {
//         
//     }];
}



-(void)loadDataFinish:(id)result isSinceID:(BOOL)isSinceID
{
    NSArray *dataArr = [result objectForKey:@"data"];
    
    NSMutableArray *homeLayoutFrameModels = [NSMutableArray arrayWithCapacity:dataArr.count];
    
    for (NSDictionary *data in dataArr) {
        HomeModel *homeModel = [[HomeModel alloc] initContentWithDic:data];
        HomeLayoutFrame *frame = [[HomeLayoutFrame alloc] init];
        frame.homeModel = homeModel;
        [homeLayoutFrameModels addObject:frame];
    }
    
#warning 这里修改了
    if (homeLayoutFrameModels.count > 0) {
        //下拉刷新
        if (isSinceID) {
            
            [homeLayoutFrameModels addObjectsFromArray:homeTabelView.models];
            homeTabelView.models = homeLayoutFrameModels;
        }else{  //上拉
            
        }
        
        [homeTabelView reloadData];
    }
    
    [self stopRefresh];
    
}

-(void)stopRefresh
{
    [homeTabelView.pullToRefreshView stopAnimating];
    [homeTabelView.infiniteScrollingView stopAnimating];
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
