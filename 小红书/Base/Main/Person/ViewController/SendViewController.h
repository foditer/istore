//
//  SendViewController.h
//  小红书
//
//  Created by 李志文 on 16/2/23.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "BaseViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CoreLocation.h>


@interface SendViewController : BaseViewController <UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,CLLocationManagerDelegate>

{
    //1 文本编辑栏
    UITextView *_textView;
    
    //2 位置管理器
    CLLocationManager *_locationManager;
    UILabel *_locationLabel;
    
    //缩略图
    UIImageView *_zoomImageView;
}

@end
