//
//  CollectionView.m
//  小红书
//
//  Created by 李志文 on 16/2/16.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "CollectionView.h"
#import "NoteCollectionViewCell.h"
#import "FirstNoteCell.h"
#import "PerCellViewController.h"
#import "PersonViewController.h"

static NSString *noteCollectCell = @"noteCollctCell";
static NSString *firstNoteCell = @"firstNoteCell";

@implementation CollectionView

//复写init方法，
- (instancetype)initWithFrame:(CGRect)frame
{
    _collectArr = [[NSMutableArray alloc] init];
    
    // 设置flowLayput
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    
    //设置滑动
    flowlayout.scrollDirection = UICollectionViewScrollDirectionVertical;

    //设置cell的大小
    flowlayout.itemSize = CGSizeMake(95 , 95);
    
    flowlayout.minimumLineSpacing = 10;
    flowlayout.minimumLineSpacing = 10;
    
    self = [super initWithFrame:frame collectionViewLayout:flowlayout];
    
    if (self)
    {
        self.delegate = self;
        self.dataSource = self;
        self.pagingEnabled = YES;
        
        //注册单元格
        
        [self registerNib:[UINib nibWithNibName:@"NoteCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:noteCollectCell];
        
        [self registerNib:[UINib nibWithNibName:@"FirstNoteCell" bundle:nil] forCellWithReuseIdentifier:firstNoteCell];
        
    }
    return self;
}

#pragma - mark UICollectionView delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _collectArr.count + 1;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        FirstNoteCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:firstNoteCell forIndexPath:indexPath];
        
        return cell;
    }else
    {
    NoteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:noteCollectCell forIndexPath:indexPath];
    
    cell.noteImgView.image = [UIImage imageNamed:@"bind_info_weibo@2x"];
        
        cell.noteModel = self.collectArr[indexPath.row - 1];
    
    return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != 0) {
        PerCellViewController *perVc = [[PerCellViewController alloc] init];
        
        perVc.noteModel = self.collectArr[indexPath.row - 1];
        
        PersonViewController *personVc = [self findResponsder];
        
        [personVc presentViewController:perVc animated:YES completion:nil];
    }
    
}

- (PersonViewController *)findResponsder {
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[PersonViewController class]]) {
            return (PersonViewController *)responder;
        }
        responder = responder.nextResponder;
        
    }while (responder != nil) ;
    
    return nil;
}


@end
