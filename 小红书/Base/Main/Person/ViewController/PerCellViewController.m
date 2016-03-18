//
//  PerCellViewController.m
//  小红书
//
//  Created by 李志文 on 16/2/23.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "PerCellViewController.h"
#import "NoteModel.h"
#import "UIImageView+WebCache.h"

@interface PerCellViewController ()
{

    UIImageView *_imageView;
}
@end

@implementation PerCellViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
        [self _createImgView];
        
        self.view.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.6];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (void)_createImgView
{
    _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:_imageView];
}

- (void)setNoteModel:(NoteModel *)noteModel
{
    if (_noteModel != noteModel)
    {
        _noteModel = noteModel;
        
        NSURL *url = [NSURL URLWithString:noteModel.imgUrl];
        
        [_imageView sd_setImageWithURL:url];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:NULL];
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
