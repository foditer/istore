//
//  NoteButtonController.m
//  小红书
//
//  Created by 李志文 on 16/2/24.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "NoteButtonController.h"
#import "NoteTagColtCell.h"
#import "AFNetworking.h"
#import "NoteModel.h"

static NSString *noteTagCollectCell = @"noteTagCollctCell";

@interface NoteButtonController () <UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *_collectionView;
}
@end

@implementation NoteButtonController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"关注的标签";
        
        _dataArr = [[NSMutableArray alloc] init];
        
        [self _requestData];
        

    }
    return  self;
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self performSelector:@selector(_createCollectionView) withObject:self afterDelay:1];
}

- (void)_createCollectionView
{
    
    // 设置flowLayput
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    
    //设置滑动
    flowlayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //设置cell的大小
    flowlayout.itemSize = CGSizeMake(70 , 100);
    
    flowlayout.minimumLineSpacing = 10;
    flowlayout.minimumLineSpacing = 10;
    
    _collectionView.delegate = self;

    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowlayout];
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled = YES;
    
    //注册单元格
    
    [_collectionView registerNib:[UINib nibWithNibName:@"NoteTagColtCell" bundle:nil] forCellWithReuseIdentifier:noteTagCollectCell];
    
    [self.view addSubview:_collectionView];
}

- (void)_requestData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    NSString *url = kNoteTagAPI;
    
    [manager GET:url parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        [self _setJsonData:responseObject];

        
    } failure:NULL];
}


- (void)_setJsonData:(id)response
{
    NSArray *arr = [response objectForKey:@"data"];
    
    for (NSDictionary *dic in arr)
    {
        NoteModel *model = [[NoteModel alloc] init];
        
        model.imgUrl = [dic objectForKey:@"image"];
        
        model.name = [dic objectForKey:@"name"];
        
        [_dataArr addObject:model];
        
    }
}



#pragma - mark UICollectionView delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArr.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    NoteTagColtCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:noteTagCollectCell forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    cell.model = _dataArr[indexPath.row];
        
    return cell;
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
