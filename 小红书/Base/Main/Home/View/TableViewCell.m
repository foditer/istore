//
//  TableViewCell.m
//  小红书
//
//  Created by apple on 16/2/14.
//  Copyright © 2016年 Norman. All rights reserved.
//

#import "TableViewCell.h"
#import "HomeLayoutFrame.h"
#import "UIImageView+WebCache.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>

@implementation TableViewCell

- (void)awakeFromNib {
    //设置头像视图的圆角、边框
    self.headImage.layer.cornerRadius = 5;
    self.headImage.layer.borderWidth = 0.5;
    self.headImage.layer.borderColor = [UIColor grayColor].CGColor;
    self.headImage.layer.masksToBounds = YES;
    
    [self.littleButton setImage:[UIImage imageNamed:@"arrow_border@2x.png"] forState:UIControlStateNormal];//判断是否感兴趣的图标
    
//    [_likeButton setImage:[UIImage imageNamed:@"xyvg_home_like@2x.png"] forState:UIControlStateNormal];
//    
//    [_collectionButton setImage:[UIImage imageNamed:@"xyvg_home_collect@2x.png"] forState:UIControlStateNormal];
//    
//    [_shareButton setImage:[UIImage imageNamed:@"xy_btn_share@2x.png"] forState:UIControlStateNormal];
    
    
}

- (void)setHomeLayoutFrameModel:(HomeLayoutFrame *)homeLayoutFrameModel
{
    if (_homeLayoutFrameModel != homeLayoutFrameModel) {
        _homeLayoutFrameModel = homeLayoutFrameModel;
    
    [self layoutSubviews];
        
        //配置各个控件的frame
        self.goodsImage.frame = self.homeLayoutFrameModel.imageFrame;//商品图片
        
        self.describeLabel.frame = self.homeLayoutFrameModel.textFrame;//描述文本
        
        self.commentLabel.frame = self.homeLayoutFrameModel.commentFrame;//评论Label
        
        self.likeButton.frame = _homeLayoutFrameModel.likeFrame;
        self.collectionButton.frame = self.homeLayoutFrameModel.collectionFrame;
        self.shareButton.frame = self.homeLayoutFrameModel.shareFrame;
    }

}

//注意，单元格中的所有数据的加载配置都是在该方法中进行的
- (void)layoutSubviews
{
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:self.homeLayoutFrameModel.homeModel.userModel.images_url]];//头像
    
    self.nickNameLabel.text = _homeLayoutFrameModel.homeModel.userModel.nickName;//用户昵称
    self.resourseLabel.text = _homeLayoutFrameModel.homeModel.geo;//地理信息
    
    NSArray *imageArr = self.homeLayoutFrameModel.homeModel.imagesList;
    NSDictionary *imageDic = imageArr[0];
    NSString *imageStr = [imageDic objectForKey:@"url"];
    NSURL *imageUrl = [NSURL URLWithString:imageStr];
    [self.goodsImage sd_setImageWithURL:imageUrl];//商品图片
    
    self.describeLabel.text = _homeLayoutFrameModel.homeModel.describe;//商品描述
    
    NSNumber *commentCount = self.homeLayoutFrameModel.homeModel.commentsCount;
    int commentCountInt = [commentCount intValue];
    NSString *str = [NSString stringWithFormat:@"展开所有%@条评论", commentCount];
    if (commentCountInt == 0) {
        self.commentLabel.text = @"添加评论";
    }else if (commentCountInt >= 1) {
        self.commentLabel.text = str;
//        [self createCommentLabel];
    }//评论
    
    [self.littleButton addTarget:self action:@selector(littleButtonAction:) forControlEvents:UIControlEventTouchUpInside];//判断是否感兴趣
    
    NSNumber *likesCount = self.homeLayoutFrameModel.homeModel.likesCount;
    self.likeButton.titleLabel.text = [NSString stringWithFormat:@"%@", likesCount];
    [self.likeButton addTarget:self action:@selector(likeButtonAction) forControlEvents:UIControlEventTouchUpInside];//点赞
    
    [self.shareButton addTarget:self action:@selector(shareButtonAction) forControlEvents:UIControlEventTouchUpInside];//分享
//    self.collectionButton =
}

//分享按钮的实现
- (void)shareButtonAction
{
    //1、创建分享参数
    NSArray* imageArray = @[[UIImage imageNamed:@"bind_info_weibo.png"]];//分享所带的图片
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"http://mob.com"]
                                          title:@"分享标题"
                                           type:SSDKContentTypeAuto];
        //2、分享（可以弹出我们的分享菜单和编辑界面）
        [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                 items:nil
                           shareParams:shareParams
                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                       
                       switch (state) {
                           case SSDKResponseStateSuccess:
                           {
                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                                   message:nil
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"确定"
                                                                         otherButtonTitles:nil];
                               [alertView show];
                               break;
                           }
                           case SSDKResponseStateFail:
                           {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                               message:[NSString stringWithFormat:@"%@",error]
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           default:
                               break;
                       }
                   }
         ];}
}


//点赞按钮的实现
- (void)likeButtonAction
{
    [self.likeButton setImage:[UIImage imageNamed:@"xyvg_home_like_hover@2x.png"] forState:UIControlStateNormal];
    
    NSNumber *likesCount = self.homeLayoutFrameModel.homeModel.likesCount;
    int likeInt = [likesCount intValue] + 1;
    self.likeButton.titleLabel.text = [NSString stringWithFormat:@"%d", likeInt];
}

//判断是否感兴趣
- (void)littleButtonAction:(UIButton *)sender
{
    UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"不感兴趣" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alter dismissViewControllerAnimated:YES completion:NULL];
    }];
    [alter addAction:action];
    
    
    [[self findController:self] presentViewController:alter animated:YES completion:NULL];
}



//找到当前视图的控制器
- (UIViewController *)findController:(UITableViewCell *)cell
{
    UIResponder *responder = cell.nextResponder;
    for (int i = 0; i < 10; i++) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            responder = responder;
        }else {
            responder = responder.nextResponder;
        }
    }
    return responder;
}
//- (void)createCommentLabel
//{
//    NSArray *arr = self.homeLayoutFrameModel.homeModel.newestComments;
//    
//    
//    for (int i = 0; i < arr.count; i++) {
//        UILabel *commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.commentLabel.frame) + 14 * i, [UIScreen mainScreen].bounds.size.width, 20)];
//        NSDictionary *dic = arr[i];
//        NSString *commentText = [dic objectForKey:@"content"];
//        NSString *userName = [[dic objectForKey:@"user"] objectForKey:@"nickname"];
//        commentLabel.text = [NSString stringWithFormat:@"%@: %@", userName, commentText];
//        commentLabel.font = [UIFont fontWithName:nil size:11];
//        [self.contentView addSubview:commentLabel];
//        
//    }
//}

//- (void)setHomeModel:(HomeModel *)homeModel
//{
//    if (_homeModel != homeModel) {
//        _homeModel = homeModel;
//        
//        [self layoutSubviews];
//    }
//    
//}

//- (void)setHomeLayoutFrame:(HomeLayoutFrame *)homeLayoutFrame
//{
//    if (_homeLayoutFrame != homeLayoutFrame) {
//        _homeLayoutFrame = homeLayoutFrame;
//        
//        [self layoutSubviews];
//    }
//}

//- (void)setHomeLayoutFrameModel:(HomeLayoutFrame *)homeLayoutFrameModel
//{
//    if (_homeLayoutFrameModel != homeLayoutFrameModel) {
//        _homeLayoutFrameModel = homeLayoutFrameModel;
//        
//        [self layoutSubviews];
//    }
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
