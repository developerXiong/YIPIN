//
//  CYCreateView.m
//  YIPIN
//
//  Created by jeader on 16/3/31.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYCreateView.h"

@implementation CYCreateView

+(UILabel *)createLabelWithFrame:(CGRect)frame textColor:(UIColor *)color backGroundColor:(UIColor *)backColor textFont:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment text:(NSString *)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = textAlignment;
    label.backgroundColor = backColor;
    label.font = font;
    label.textColor = color;
    label.text = text;
    return label;
}

+(UIButton *)createButtonWithFrame:(CGRect)frame textColor:(UIColor *)color backGroundColor:(UIColor *)backColor textFont:(UIFont *)font title:(NSString *)title backImage:(NSString *)backImageName
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    if (backImageName) {
        [btn setBackgroundImage:[UIImage imageNamed:backImageName] forState:UIControlStateNormal];
    }
    if (color) {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
    if (backColor) {
        [btn setBackgroundColor:backColor];
    }
    
    return btn;
}

+ (void)addAlertViewInView:(UIViewController *)VC title:(NSString *)title message:(NSString *)message count:(int)index doWhat:(void (^)(void))what
{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *action = [[UIAlertAction alloc] init];
    
    UIAlertAction *action1 = [[UIAlertAction alloc] init];
    
    if(index == 0){
        
        action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (what)
            {
                what();
            }
            
        }];
        
        action1 = nil;
        
    }else{
        
        action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            what();
            
        }];
        
        action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
        
    }
    
    
    if (action1) {
        
        [alert addAction:action1];
        
    }
    [alert addAction:action];
    [VC presentViewController:alert animated:YES completion:^{
        
    }];
    
}

@end
