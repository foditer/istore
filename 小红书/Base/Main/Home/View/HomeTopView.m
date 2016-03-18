//
//  HomeTopView.m
//  小红书
//
//  Created by apple on 16/2/22.
//  Copyright © 2016年 Norman. All rights reserved.
//

#import "HomeTopView.h"

@implementation HomeTopView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    [self creatView];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
}

- (void)creatView {
    
    UIImageView *titleView = [[UIImageView alloc]initWithFrame:CGRectMake(129, 20, 60, 30)];
    titleView.image = [UIImage imageNamed:@"xyph_home_xiaohongshu@2x.png"];
//    titleView.backgroundColor = [UIColor blackColor];
    titleView.contentMode = UIViewContentModeScaleAspectFit;
//    titleView.userInteractionEnabled = YES;
    [self addSubview:titleView];
    
    //设置照相机的button按钮
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(273, 22, 26, 26)];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"btn_cam@2x"] forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor whiteColor];
    [self addSubview:button];
    
    //设置左边switch按钮
    UIButton *switchButton = [[UIButton alloc] initWithFrame:CGRectMake(22, 22, 26, 26)];
    [switchButton addTarget:self action:@selector(switchButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [switchButton setImage:[UIImage imageNamed:@"btn_switch_all@2x.png"] forState:UIControlStateNormal];
    [self addSubview:switchButton];
    
    
    
    
}

//TopView照相机的实现
- (void)buttonAction:(UIButton *)sender {
    
    //判断是否有摄像头
    BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:    UIImagePickerControllerCameraDeviceRear];
    if (!isCamera) {
        UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"没有可用的摄像头" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [alter dismissViewControllerAnimated:YES completion:NULL];
        }];
        [alter addAction:action];
        
        
        [[self findController:self] presentViewController:alter animated:YES completion:NULL];
        
        return;
        
    }
    
    
    
    UIImagePickerController *pickVC = [[UIImagePickerController alloc] init];
    
    pickVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    pickVC.delegate = self;
    
    [[self findController:self] presentViewController:pickVC animated:YES completion:NULL];

}

//找到当前视图的控制器
- (UIViewController *)findController:(UIView *)view
{
    UIResponder *responder = view.nextResponder;
    for (int i = 0; i < 10; i++) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            responder = responder;
        }else {
            responder = responder.nextResponder;
        }
    }
    return responder;
}

- (void)switchButtonAction:(UIButton *)sender {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
