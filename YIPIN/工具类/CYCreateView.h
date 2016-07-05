//
//  CYCreateView.h
//  YIPIN
//
//  Created by jeader on 16/3/31.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CYCreateView : NSObject

/**
 *  创建label
 */
+(UILabel *)createLabelWithFrame:(CGRect)frame textColor:(UIColor *)color backGroundColor:(UIColor *)backColor textFont:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment text:(NSString *)text;

/**
 *  创建button
 */
+(UIButton *)createButtonWithFrame:(CGRect)frame textColor:(UIColor *)color backGroundColor:(UIColor *)backColor textFont:(UIFont *)font title:(NSString *)title backImage:(NSString *)backImageName;

/**
 *  快速创建alertView
 *
 *  @param VC      要显示在哪个控制器上面
 *  @param title   显示内容的主题
 *  @param message 显示的内容
 *  @param index   下面有几个按钮 （只有确定和取消按钮 0代表一个，其他数字代表有两个）
 *  @param what    点击确定按钮之后做得事情
 */
+ (void)addAlertViewInView:(UIViewController *)VC title:(NSString *)title message:(NSString *)message count:(int)index doWhat:(void (^)(void))what;

@end
