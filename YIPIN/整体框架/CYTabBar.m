//
//  CYTabBar.m
//  YIPIN
//
//  Created by jeader on 16/3/22.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYTabBar.h"
#import "HEADFILE.pch"

@implementation CYTabBar

-(NSMutableArray *)btnArr
{
    if (!_btnArr) {
        _btnArr = [NSMutableArray array];
    }
    return _btnArr;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addsubviews];
    }
    return self;
}

-(void)addsubviews
{

    NSArray *imageArr = @[@"主页",@"发现",@"购物车",@"我的"];
    
    
    for (int i = 0; i < imageArr.count; i ++) {
        UIButton *btn = [self createBtnWith:imageArr.count index:i imageName:imageArr[i]];
        
        btn.tag=i;
        [self.btnArr addObject:btn];
    }
}

-(UIButton *)createBtnWith:(NSInteger)count index:(int)index imageName:(NSString *)image
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(index*CYSCREENSIZE.width/count, 0, CYSCREENSIZE.width/count, self.bounds.size.height)];
    btn.tag = index;
    [self addSubview:btn];
    
    CGFloat btnW = btn.bounds.size.width;
    CGFloat btnH = btn.bounds.size.height;
    CGSize imageS = [[UIImage imageNamed:image] size];
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake((btnW-imageS.width)/2, (btnH-imageS.height)/2, imageS.width, imageS.height)];
    imageV.image = [UIImage imageNamed:image];
    [btn addSubview:imageV];
    
    return btn;
    
}


@end
