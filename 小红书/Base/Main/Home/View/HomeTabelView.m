//
//  HomeTabelView.m
//  小红书
//
//  Created by apple on 16/2/17.
//  Copyright © 2016年 Norman. All rights reserved.
//

#import "HomeTabelView.h"
#import "TableViewCell.h"
//#import "HomeModel.h"
#import "HomeLayoutFrame.h"


#define kCell @"cell"

@implementation HomeTabelView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        //设置代理
        self.delegate = self;
        self.dataSource = self;
        
        //如果要复用，那么需要注册单元格
        [self registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:[NSBundle mainBundle]]forCellReuseIdentifier:kCell];
        
        //创建Models,用于接收HomeViewController中请求下来的models数据
        _models = [NSMutableArray array];
        
    }
    return self;
}

#pragma mark UITableViewDataSource delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _models.count;
//    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    复用单元格
    //cell的创建第一种方式
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCell forIndexPath:indexPath];
    
    //cell的创建第二种方式
//    TableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:kCell];
//    if (cell == nil) {
//        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCell];
//    }
    
//    自定义单元格
    //第一种方式：系统固定格式方式
//    cell.contentView.backgroundColor = [UIColor redColor];
//    cell.textLabel.text = @"daskhfg";
//    cell.detailTextLabel.text = @"ahsdgfuskyecbxjh";
//    cell.imageView.image = [UIImage imageNamed:@""];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.detailTextLabel.numberOfLines = 0;//设置该参数为0，会根据内容自行填充相应的行数
    
    //第二种方式：往contentView上添加各种控件(这种方式很容易出现一个问题，就是重叠。因为：1，控件创建了多次；2，将控件往cell.contentView上重复添加add了多次。如果出现了重叠，可以用if判断，当cell==nil时才add)；
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
//    [cell.contentView addSubview:imageView];
    
    //第三种方式：xib
    
    
    

    cell.homeLayoutFrameModel = [_models objectAtIndex:indexPath.row];//将相应的model数据传给相应的单元格的Model
    
    cell.selectionStyle = nil;//去除单元格的选中效果
    
    return cell;
}


/*以下这两个方法是做什么用的？？*/

//配置单元格的行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeLayoutFrame *frame = _models[indexPath.row];
    
    float height = frame.totalFrame.size.height;
    
    return height + 20;
}

- (void)setModels:(NSMutableArray *)models {
    if (_models != models) {
        _models = models;
        
        [self reloadData];
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
