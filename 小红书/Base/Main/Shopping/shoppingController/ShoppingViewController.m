//
//  ShoppingViewController.m
//  小红书
//
//  Created by Apple on 16/2/11.
//  Copyright © 2016年 zjj. All rights reserved.
//

#import "ShoppingViewController.h"
#import "DetailCollectionViewCell.h"
#import "MainCollectionView.h"
#import "MiddleVIew.h"
#import "MiddleCollectionView.h"
#import "AFNetworking.h"
#import "ListCollectionView.h"
#import "ListCollModel.h"
#import "LittleModel.h"
#import "ListFirstCollectionViewCell.h"
#import "ListSecCollectionViewCell.h"

@interface ShoppingViewController ()

@end

@implementation ShoppingViewController

- (void)dealloc {
    
    [_mainCollectionView removeObserver:self forKeyPath:@"currentItem"];
    [_middleView removeObserver:self forKeyPath:@"currentItem"];
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    _mainCollectionView = [[MainCollectionView alloc]initWithFrame:CGRectMake(0, 110, kScreenWidth, kScreenHeight - 110)];
    self.mainCollectionView.pageWidth = kScreenWidth;
    self.mainCollectionView.data = [[NSMutableArray alloc]initWithCapacity:10];
    self.mainCollectionView.currentItem = 0;
    _mainCollectionView.backgroundColor = [UIColor whiteColor];
    
    [_mainCollectionView addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:NULL];
    [self.view insertSubview:_mainCollectionView belowSubview:_middleView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _firstcellUrl = @[
@"http://www.xiaohongshu.com/api/store/v1/banners?oid=categoryforall&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456052202&sign=9940ac076b56ff39098f982da3810475",
@"http://www.xiaohongshu.com/api/store/v1/banners?oid=5559cdaab4c4d66186e64dae&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456052553&sign=32ae71d64202604f9df447ce6220d869",
@"http://www.xiaohongshu.com/api/store/v1/banners?oid=5559cdaab4c4d66186e64daa&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456052903&sign=ce86536cd838924164a50eb46f453176",
@"http://www.xiaohongshu.com/api/store/v1/banners?oid=55bae93ed48bac4d13c02196&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456053475&sign=f22b88da69cde9461b003e94facd3d76",
@"http://www.xiaohongshu.com/api/store/v1/banners?oid=5559cdaab4c4d66186e64dad&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456053823&sign=28f8f1584124ea08b2c335c604d2fd2",
@"http://www.xiaohongshu.com/api/store/v1/banners?oid=5559cdaab4c4d66186e64daf&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456053906&sign=3847d8376a2bfc3e1d45ee1d77100255",
//@"http://www.xiaohongshu.com/api/store/v1/banners?oid=55a31ee6d48bac6e69f86cea&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456053979&sign=06cf0d25107dfdd4ccf2da3250cedc00",
@"http://www.xiaohongshu.com/api/store/v1/banners?oid=5559cdaab4c4d66186e64dac&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456054023&sign=c1df3ff2674903dd6161ac980276b45d",
@"http://www.xiaohongshu.com/api/store/v1/banners?oid=55bae93ed48bac4d13c02197&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456054023&sign=1fe82423d8fb1d0e39d8805ed2f215ee",

@"http://www.xiaohongshu.com/api/store/v1/banners?oid=55af792fd48bac515cedc19c&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456056619&sign=eee7d47cf86eaef0d1a1c14569d2129b"];
    
    _secCellUrl = @[
    @"http://www.xiaohongshu.com/api/v4/store/goods?oid=categoryforall&page=1&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456057563&sign=9a69dcbe8e2cd172f3e99dd262332ff0",
    @"http://www.xiaohongshu.com/api/v4/store/goods?oid=5559cdaab4c4d66186e64dae&page=1&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456057490&sign=ab79afa23653ddd24b3ee238660c7e63",
    @"http://www.xiaohongshu.com/api/v4/store/goods?oid=5559cdaab4c4d66186e64daa&page=1&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456057433&sign=8c88bc3b7d9de86f65ec3d01719a80ff",
    @"http://www.xiaohongshu.com/api/v4/store/goods?oid=55bae93ed48bac4d13c02196&page=1&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456057361&sign=545740a90cc64f2edb0ea164d81972ee",
    @"http://www.xiaohongshu.com/api/v4/store/goods?oid=5559cdaab4c4d66186e64dad&page=1&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456057312&sign=72538c6b3c8e5078953a0eb4d6387c8a",
    @"http://www.xiaohongshu.com/api/v4/store/goods?oid=5559cdaab4c4d66186e64daf&page=1&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456057180&sign=da700b2a97c891802c0fd4c980b1b06f",
//    @"http://www.xiaohongshu.com/api/v4/store/goods?oid=55a31ee6d48bac6e69f86cea&page=1&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456057086&sign=40202e7f9ea57498b09165ed538f9854",
    @"http://www.xiaohongshu.com/api/v4/store/goods?oid=5559cdaab4c4d66186e64dac&page=1&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456057017&sign=3c9295d6356557c172e40a3cc0a5564e",
    @"http://www.xiaohongshu.com/api/v4/store/goods?oid=55bae93ed48bac4d13c02197&page=1&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456056966&sign=77b91571f6e05e64a4fce6562e8abd78",
   
    @"http://www.xiaohongshu.com/api/v4/store/goods?oid=55af792fd48bac515cedc19c&page=1&platform=Android&source=discovery&deviceId=ce587ecb-825f-346b-a198-1ece429a4a2a&versionName=4.2.201&channel=Xiaomi&sid=session.1138378728365010573&lang=zh-Hans&t=1456056644&sign=741be1e198a9849c5a1a8bf9ad63983d"];
   
    self.view.backgroundColor = [UIColor whiteColor];
    _data = [[NSMutableArray alloc]init];
    _secData  = [[NSMutableArray alloc]init];
    [self requestData];
    _middleView.userInteractionEnabled = YES;
    [_middleView.collectionV addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:NULL];
}


- (void)requestData {
    NSInteger item =  self.mainCollectionView.currentItem;
    [_data removeAllObjects];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    [manager GET:_firstcellUrl[item] parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSInteger item =  self.mainCollectionView.currentItem;
        
        DetailCollectionViewCell *cell = (DetailCollectionViewCell *)[_mainCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:item inSection:0]];
        ListCollectionView *coll = cell.listCollView;
        NSInteger num = coll.firstData.count;
        for(int i = 0; i < num; i++) {
            ListFirstCollectionViewCell *cell = (ListFirstCollectionViewCell *)[coll cellForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
            [cell.contentView removeFromSuperview];
        }
        NSArray *arr = responseObject[@"data"];
        for (NSDictionary *dic in arr) {
            ListCollModel *model = [[ListCollModel alloc]init];
            NSDictionary *dataDic = dic[@"event"];
            model.imageurl = dataDic[@"image"];
            NSArray *dataArr = dataDic[@"goods_list"];
            for (NSDictionary *lttleDic in dataArr) {
                LittleModel *model1 = [[LittleModel alloc]init];
                model1.title = lttleDic[@"title"];
                model1.imageUrl = lttleDic[@"image"];
                model1.price = lttleDic[@"price"];
                model1.discountPrice = lttleDic[@"discount_price"];
                model1.link = lttleDic[@"link"];
                [model.littleData addObject:model1];
                
            }
            [_data addObject:model];
        }
        if (item == 0) {
            [_data removeObjectAtIndex:0];
            [_data removeObjectAtIndex:0];
        }
        coll.firstData = _data;
        [coll reloadData];
        [self requestSecData:coll];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求出错");
    }];
    
    
}

- (void)requestSecData:(UICollectionView *)coll {
    
    [_secData removeAllObjects];
    
    NSInteger item =  self.mainCollectionView.currentItem;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    [manager GET:_secCellUrl[item] parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSInteger item =  self.mainCollectionView.currentItem;
        
        DetailCollectionViewCell *cell = (DetailCollectionViewCell *)[_mainCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:item inSection:0]];
        ListCollectionView *coll = cell.listCollView;
        
        NSInteger num = coll.secData.count;
        for(int i = 0; i < num; i++) {
            ListSecCollectionViewCell *cell = (ListSecCollectionViewCell *)[coll cellForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
            [cell.contentView removeFromSuperview];
        }

        NSArray *arr = responseObject[@"data"];
        for (NSDictionary *dic in arr) {
    
        LittleModel *model = [[LittleModel alloc]init];
        model.title = dic[@"title"];
       NSString *trait = dic[@"desc"];
      NSUInteger length = [model.title length];
        NSString *trait1 = [trait substringFromIndex:length];
        model.trait = trait1;
        model.imageUrl = dic[@"image"];
        model.price = dic[@"price"];
        model.discountPrice = dic[@"discount_price"];
        model.link = dic[@"link"];
        [_secData addObject:model];
        }
        coll.secData = _secData;
        [coll reloadData];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求出错");
    }];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"currentItem"]) {
        
        NSNumber *newV = [change valueForKey:@"new"];
        
        NSInteger item = [newV integerValue];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
        
        if (object == _middleView.collectionV && _mainCollectionView.currentItem != item) {
            _mainCollectionView.currentItem = item;
            [_mainCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            [_middleView passButon:item + 100];
            
            [self requestData];
            NSLog(@"当前item为%li",item);
        }
        else if (object == _mainCollectionView && _middleView.collectionV.currentItem != item) {
            [self requestData];
            _middleView.collectionV.currentItem = item;
            [_middleView.collectionV scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            [_middleView passButon:item + 100];
            [_middleView.collectionV collectionView:_middleView.collectionV didSelectItemAtIndexPath:[NSIndexPath indexPathForItem:item inSection:0]];
            
        }
    }
    
}


@end
