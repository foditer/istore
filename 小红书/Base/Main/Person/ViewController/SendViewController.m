//
//  SendViewController.m
//  小红书
//
//  Created by 李志文 on 16/2/23.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "SendViewController.h"


@interface SendViewController ()
{
    UIImage *_sendImage;
}
@end

@implementation SendViewController

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
        
    }
    return  self;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.85 alpha:1.0];
    
    [self _selectPhoto];
    
//    [self _location];
    
    [self _createNavItems];
    
    [self _createTextView];
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear: animated ];
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //导航栏不透明
    self.navigationController.navigationBar.translucent = NO;
    _textView.frame = CGRectMake(0, 0, kScreenWidth, 120);
    
    _textView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);

}

#pragma mark - 地理位置
- (void)_location{
    
    /*
     修改 info.plist 增加以下两项
     NSLocationWhenInUseUsageDescription  BOOL YES
     NSLocationAlwaysUsageDescription         string “提示描述”
     */
    
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc] init];
        //判断版本
        if (kVersion > 8.0) {
            //获取授权使用地理位置服务
            [_locationManager requestWhenInUseAuthorization];
            
            
//            requestAlwaysAuthorization
//            requestWhenInUseAuthorization
        }
        
    }
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];//设置定位精确度
    _locationManager.delegate = self;
    [_locationManager startUpdatingLocation];
    
}
//代理 获取定位数据
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations{
    //停止定位
    [_locationManager stopUpdatingLocation];
    //取得位置信息
    CLLocation *location = [locations lastObject];
    
    CLLocationCoordinate2D coordinate = location.coordinate;
    
    NSLog(@"经度%lf,纬度%lf",coordinate.longitude,coordinate.latitude);
    
    
    //地理位置反编码，通过坐标信息获取 位置详情
    
    //一 新浪位置反编码 接口说明  http://open.weibo.com/wiki/2/location/geo/geo_to_address
    //二 iOS自己内置反编码
    
   __weak  SendViewController* weakSelf = self;
    
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    
    [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        
        __strong SendViewController *strongSelf = weakSelf;
        
        CLPlacemark *place = [placemarks lastObject];
        NSLog(@"%@",place.name);
        
        strongSelf->_locationLabel.text = place.name;
        
    }];
    
}


#pragma  mark - 创建子视图
- (void)_createNavItems{
    //1.关闭按钮
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    
    [closeButton setTitle:@"取消" forState:UIControlStateNormal];
    
    [closeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [closeButton addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithCustomView:closeButton];
    
    [self.navigationItem setLeftBarButtonItem:closeItem];
    
    //2.发送按钮
    UIButton *sendButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    
    [sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [sendButton addTarget:self action:@selector(sendAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *sendItem = [[UIBarButtonItem alloc] initWithCustomView:sendButton];
    
    [self.navigationItem setRightBarButtonItem:sendItem];
    
}

- (void)_createTextView{
    
    //1 文本输入视图
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 120)];
    _textView.font = [UIFont systemFontOfSize:16.0f];
    _textView.backgroundColor = [UIColor clearColor];
    _textView.editable = YES;
    
    _textView.backgroundColor = [UIColor lightGrayColor];
    _textView.layer.cornerRadius = 10;
    _textView.layer.borderWidth = 2;
    _textView.layer.borderColor = [UIColor blackColor].CGColor;
    
    [self.view addSubview:_textView];
    
    //显示位置信息
    _locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 220, kScreenWidth, 30)];
    
    UIButton *locationButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 223, 25, 25)];
    
    [locationButton setImage:[UIImage imageNamed:@"post_notes_location@2x"] forState:UIControlStateNormal];
    
    [locationButton addTarget:self action:@selector(_location) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, 220, 50, 30)];
    
    label.text = @"发送于：";
    
    label.font = [UIFont systemFontOfSize:12];
    
    [label setTextAlignment:NSTextAlignmentLeft];
    
    _locationLabel.backgroundColor = [UIColor lightGrayColor];
    _locationLabel.textColor = [UIColor blackColor];
    _locationLabel.font = [UIFont systemFontOfSize:13];
    [_locationLabel setTextAlignment:NSTextAlignmentRight];
    
    _locationLabel.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_locationLabel];
    [self.view addSubview:label];
    [self.view addSubview:locationButton];

}

- (void)sendAction
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)closeAction
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - 键盘弹出通知

- (void)keyBoardWillShow:(NSNotification *)notification{
    
    //1 取出键盘frame
    NSValue *bounsValue = [notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
}


#pragma mark - 选择照片
- (void)_selectPhoto{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"相册", nil];
    
    [actionSheet showInView:self.view];
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    UIImagePickerControllerSourceType sourceType;
    //选择相机 或者 相册
    if (buttonIndex == 0) {//拍照
        
        sourceType = UIImagePickerControllerSourceTypeCamera;
        
        BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
        
        if (!isCamera) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"摄像头无法使用" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            
            [alert show];
            
            return;
        }
    }else if(buttonIndex == 1){ //选择相册
        
        sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
    }else{
        
        return;
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = sourceType;
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
    
    
}

//照片选择代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //弹出相册控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    //弹出键盘
    [_textView becomeFirstResponder];
    
    //定位
    [self _location];

    
    //2 取出照片
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    //3 显示缩略图
    
    if (_zoomImageView == nil) {
        
        _zoomImageView = [[UIImageView alloc] initWithImage:image];
        _zoomImageView.frame = CGRectMake(10, 130, 80, 80);
        [self.view addSubview:_zoomImageView];
        
    }
    _zoomImageView.image = image;
    _sendImage = image;
    
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
