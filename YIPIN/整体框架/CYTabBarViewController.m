//
//  CYTabBarViewController.m
//  YIPIN
//
//  Created by jeader on 16/3/21.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYTabBarViewController.h"
#import "UIImage+OringinImage.h"
#import "CYTabBar.h"
#import "HEADFILE.pch"

#import "CYMainViewController.h"
#import "CYDiscoverViewController.h"
#import "CYBuyCarViewController.h"
#import "CYProfileViewController.h"

@interface CYTabBarViewController ()

@end

@implementation CYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CYMainViewController *mainVC = [[CYMainViewController alloc] init];
    [self addChildViewController:mainVC];
    
    CYDiscoverViewController *discover = [[CYDiscoverViewController alloc] init];
    [self addChildViewController:discover];
    
    CYBuyCarViewController *buycar = [[CYBuyCarViewController alloc] init];
    [self addChildViewController:buycar];
    
    CYProfileViewController *profile = [[CYProfileViewController alloc] init];
    [self addChildViewController:profile];
    
    //隐藏tabbar
    self.tabBar.hidden = YES;
    //默认选中第一个控制器
    self.selectedIndex = 0;
    
    CYTabBar *tabBar = [[CYTabBar alloc] initWithFrame:CGRectMake(0, CYSCREENSIZE.height-50, CYSCREENSIZE.width, 50)];
    [self.view addSubview:tabBar];
    
    for (UIButton *btn in tabBar.btnArr) {
        [btn addTarget:self action:@selector(clickItems:) forControlEvents:UIControlEventTouchUpInside];
        btn.selected = YES;
    }
    
}

-(void)clickItems:(UIButton *)sender
{
    self.selectedIndex = sender.tag;
//    NSArray *selectImageArr = @[@"主页-1",@"找积分",@"花积分",@"我的-1"];
    
    UIButton *btn = (UIButton *)sender;
    CGFloat width = btn.bounds.size.width, height = btn.bounds.size.height;
    
    NSArray *imageArr = @[@"首页文字",@"找积分文字",@"花积分文字",@"我的文字"];
    UIImage *image = [UIImage imageNamed:imageArr[btn.tag]];
    CGSize imageS = [image size];
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageS.width/10, imageS.height/10)];
    imageV.image = image;
    imageV.center = CGPointMake(width/2, height/2);
    imageV.hidden = YES;
    [btn addSubview:imageV];
    
    NSTimeInterval timeInterval = 0.5;
    
    [UIView animateWithDuration:timeInterval animations:^{
       
        btn.transform = CGAffineTransformMakeScale(0.1, 0.1);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:timeInterval animations:^{
           
            imageV.hidden = NO;
            imageV.transform = CGAffineTransformMakeScale(100, 100);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:timeInterval animations:^{
                
                imageV.transform = CGAffineTransformMakeScale(0.1, 0.1);
                
            } completion:^(BOOL finished) {
                
                imageV.hidden = YES;
                [UIView animateWithDuration:timeInterval animations:^{
                   
                    btn.transform = CGAffineTransformIdentity;
                    
                }];
                
            }];
            
        }];
        
    }];
    
}


@end
