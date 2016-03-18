//
//  ButtonCell.m
//  小红书
//
//  Created by 李志文 on 16/2/16.
//  Copyright © 2016年 Javenlee. All rights reserved.
//

#import "ButtonCell.h"
#import "CollectionView.h"
#import "SecondCollectionView.h"
#import "UserModel1.h"

@interface ButtonCell ()
{
    CollectionView *_collectionView;
    
    SecondCollectionView *_secondCltView;
}
@end

@implementation ButtonCell

- (void)awakeFromNib {
    
    _ModelArr = [[NSMutableArray alloc] init];
    _specialArr = [[NSMutableArray alloc] init];
    
}

- (void)setModelArr:(NSMutableArray *)ModelArr
{
    if (_ModelArr != ModelArr) {
        _ModelArr = ModelArr;
        if (_collectionView == nil) {
            
            [self _createCollectionView];
        }
        _collectionView.collectArr = self.ModelArr;
    }
    
}

- (void)setSpecialArr:(NSMutableArray *)specialArr
{
    if (_specialArr != specialArr) {
        _specialArr = specialArr;
        
        _secondCltView.collectSpeArr = self.specialArr;
    }
}

- (void)setModel:(UserModel1 *)model
{
    _model = model;
    
    self.noteLabel.text = [model.myNotes stringValue];
    
    self.specialLabel.text = [model.mySpecials stringValue];
    
}


- (void)_createCollectionView
{
    _collectionView = [[CollectionView alloc] initWithFrame:CGRectMake(0, 40, 320, 600)];
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:_collectionView];
    
    _secondCltView = [[SecondCollectionView alloc] initWithFrame:CGRectMake(0, 40, 320, 600)];
    
    _secondCltView.backgroundColor = [UIColor whiteColor];
    
    _secondCltView.hidden = YES;
    
    [self.contentView addSubview:_secondCltView];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)noteButton:(UIButton *)sender {
    
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    CGFloat x = sender.center.x;
    
    CGFloat y = sender.center.y + 20;
    
    CGPoint point = CGPointMake(x, y);
    
    [UIView animateWithDuration:0.2 animations:^{
        
        self.footImgView.center = point;
    }];
    
    if (_collectionView.hidden)
    {
        _secondCltView.hidden = !_secondCltView.hidden;
        _collectionView.hidden = !_collectionView.hidden;
        
    }

}

- (IBAction)specialButton:(UIButton *)sender {
    
    if (_secondCltView.hidden)
    {
        _secondCltView.hidden = !_secondCltView.hidden;
        _collectionView.hidden = !_collectionView.hidden;
    }
    
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    CGFloat x = sender.center.x;
    
    CGFloat y = sender.center.y + 20;
    
    CGPoint point = CGPointMake(x, y);
    
    [UIView animateWithDuration:0.2 animations:^{
    
        self.footImgView.center = point;
        
    }]; 
    
}
@end
