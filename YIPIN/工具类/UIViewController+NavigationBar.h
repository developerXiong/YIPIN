//
//  UIViewController+NavigationBar.h
//  YIPIN
//
//  Created by jeader on 16/3/22.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    
    NavigationBarStyleDefault, //默认没有图片
    NavigationBarStyleMainView, //主页的效果
    NavigationBarStyleJustBlack //只有黑色背景
    
}NavigationBarStyle;

@interface UIViewController (NavigationBar)

/**
 *  首页的导航条
 */
-(void)addNavigationBar:(NavigationBarStyle)barStyle;

-(void)addNavigationBar:(NavigationBarStyle)barStyle title:(NSString *)title;

-(void)addLeftItemWithFrame:(CGRect)frame textOrImage:(int)index action:(SEL)action name:(NSString *)name;

-(void)addRightItemWithFrame:(CGRect)frame textOrImage:(int)index action:(SEL)action name:(NSString *)name;
/**
 *  设置右边带有圆角效果的按钮
 */
-(void)addRightBtnWithFrame:(CGRect)frame action:(SEL)action name:(NSString *)name;

/**
 *  添加手势
 */
-(void)addGesture;

@end
