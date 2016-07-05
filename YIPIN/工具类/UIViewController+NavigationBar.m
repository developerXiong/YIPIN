//
//  UIViewController+NavigationBar.m
//  YIPIN
//
//  Created by jeader on 16/3/22.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "UIViewController+NavigationBar.h"
#import "HEADFILE.pch"

#define BTNW 80 //按钮的宽度
#define BARBACKGROUNDCOLOR [UIColor colorWithRed:27/255.0 green:29/255.0 blue:35/255.0 alpha:1.0] //导航栏的底色

static UIImageView *_imageV;

@implementation UIViewController (NavigationBar)

//添加导航条
-(void)addNavigationBar:(NavigationBarStyle)barStyle
{
    //背景图
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CYSCREENSIZE.width, 64)];
    _imageV = imageV;
    [self.view addSubview:imageV];
    imageV.userInteractionEnabled = YES;
    if (barStyle==NavigationBarStyleMainView) { //主页的效果
        imageV.image = [UIImage imageNamed:@"导航栏"];
    }
    
    if (barStyle==NavigationBarStyleDefault) {
        imageV.backgroundColor = BARBACKGROUNDCOLOR;
        [self addLeftItemWithFrame:CGRectZero textOrImage:0 action:@selector(popToViewController) name:@"返回"];
    }
    
    if (barStyle==NavigationBarStyleJustBlack) {
        imageV.backgroundColor = BARBACKGROUNDCOLOR;
    }
    
    
}

-(void)addNavigationBar:(NavigationBarStyle)barStyle title:(NSString *)title
{
    [self addNavigationBar:barStyle];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.center = CGPointMake(CYSCREENSIZE.width/2, 42);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [_imageV addSubview:titleLabel];
    titleLabel.textColor = BULINBULIN;
    titleLabel.text = title;
//    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.font = [UIFont fontWithName:@"ShiShangZhongHeiJianTi" size:18];
    
}

-(void)addLeftItemWithFrame:(CGRect)frame textOrImage:(int)index action:(SEL)action name:(NSString *)name
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 20, BTNW, 44)];
    [self.view addSubview:button];
    if (action!=nil) {
        [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (index==0) { // 图片
        CGSize imageS = [[UIImage imageNamed:name] size];
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, (44-imageS.height)/2, imageS.width, imageS.height)];
//        imageV.userInteractionEnabled = YES;
        imageV.image = [UIImage imageNamed:name];
        [button addSubview:imageV];
        
    }else{ // 文字
        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        label.text = name;
        label.font = [UIFont systemFontOfSize:18];
        label.textColor = BULINBULIN;
        [button addSubview:label];
    }
   
}

-(void)addRightItemWithFrame:(CGRect)frame textOrImage:(int)index action:(SEL)action name:(NSString *)name
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(CYSCREENSIZE.width-BTNW, 20, BTNW, 44)];
    [self.view addSubview:button];
    if (action!=nil) {
        [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (index==0) { // 图片
        CGSize imageS = [[UIImage imageNamed:name] size];
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(BTNW-20-imageS.width, (44-imageS.height)/2, imageS.width, imageS.height)];
//        imageV.userInteractionEnabled = YES;
        imageV.image = [UIImage imageNamed:name];
        [button addSubview:imageV];
        
    }else{ // 文字
        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        label.text = name;
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = BLACKCOLOR;
        label.backgroundColor = BULINBULIN;
        label.layer.masksToBounds = YES;
        label.layer.cornerRadius = 5.0;
        label.textAlignment = NSTextAlignmentCenter;
        [button addSubview:label];
    }
}

-(void)addRightBtnWithFrame:(CGRect)frame action:(SEL)action name:(NSString *)name
{
    
}

-(void)popToViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)addGesture
{
    UISwipeGestureRecognizer *leftGestrue = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    leftGestrue.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:leftGestrue];
    
//    UIPanGestureRecognizer *leftGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
//    [self.view addGestureRecognizer:leftGesture];
    
}


- (void)handleSwipeFrom:(UISwipeGestureRecognizer*)recognizer {
    // 触发手勢事件后，在这里作些事情
    [self popToViewController];
    // 刪除手势
    [self.view removeGestureRecognizer:recognizer];
}

@end
