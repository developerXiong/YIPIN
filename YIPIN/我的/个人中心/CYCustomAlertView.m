//
//  CYCustomAlertView.m
//  YIPIN
//
//  Created by jeader on 16/3/31.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYCustomAlertView.h"
#import "HEADFILE.pch"

@implementation CYCustomAlertView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {

        [self addSubviews];
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        self.hidden = YES;
        
    }
    return self;
}

-(void)clickMengC
{
    NSLog(@"点击蒙层");
    [self hidden];
}

-(void)addSubviews
{
    
    UIControl *mengc = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, CYSCREENSIZE.width, (CYSCREENSIZE.height-120)/2)];
    [mengc addTarget:self action:@selector(clickMengC) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:mengc];
    
    
    CGFloat totalX = 30, totalY = (CYSCREENSIZE.height-120)/2, totalW = CYSCREENSIZE.width-60, totalH = 150;
    /**
     *  整体的alertview
     */
    UIView *totalView = [[UIView alloc] initWithFrame:CGRectMake(totalX, totalY, totalW, totalH)];
    totalView.backgroundColor = [UIColor whiteColor];
    totalView.layer.masksToBounds = YES;
    totalView.layer.cornerRadius = 7.0;
    [self addSubview:totalView];
    
    UIControl *mengc1 = [[UIControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(totalView.frame), CYSCREENSIZE.width, (CYSCREENSIZE.height-120)/2)];
    [mengc1 addTarget:self action:@selector(clickMengC) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:mengc1];
    
    /**
     *  更换头像文字
     */
    UILabel *changeIcon = [CYCreateView createLabelWithFrame:CGRectMake(0, 0, totalW, 50) textColor:[[UIColor blackColor]colorWithAlphaComponent:0.7] backGroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.3] textFont:[UIFont systemFontOfSize:16] textAlignment:1 text:@"更换头像"];
    [totalView addSubview:changeIcon];
    
    /**
     *  拍照按钮
     */
    UIButton *takePicture = [CYCreateView createButtonWithFrame:CGRectMake(0, 50, totalW, 50) textColor:[[UIColor blueColor] colorWithAlphaComponent:0.7] backGroundColor:nil textFont:[UIFont systemFontOfSize:16] title:@"拍照" backImage:nil];
    _takePhoto = takePicture;
    [totalView addSubview:takePicture];
    
    /**
     *  从相册选择
     */
    UIButton *xiangce = [CYCreateView createButtonWithFrame:CGRectMake(20, 100, totalW-40, 50) textColor:[[UIColor blueColor] colorWithAlphaComponent:0.7] backGroundColor:nil textFont:[UIFont systemFontOfSize:16] title:@"从相册选择" backImage:nil];
    _xiangce = xiangce;
    [totalView addSubview:xiangce];
}

-(void)show
{
    self.transform = CGAffineTransformMakeScale(1.1, 1.1);
    self.hidden = NO;
    [UIView animateWithDuration:0.2 animations:^{
       
        self.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
    }];
}

-(void)hidden
{
    self.hidden = YES;
}


@end
