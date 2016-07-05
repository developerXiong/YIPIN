//
//  CYHotSearchBtn.m
//  YIPIN
//
//  Created by jeader on 16/3/24.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYHotSearchBtn.h"

@implementation CYHotSearchBtn


+(instancetype)createBtnWithX:(CGFloat)x Y:(CGFloat)y title:(NSString *)title
{
    UIImage *image = [UIImage imageNamed:@"热门搜索框"];
    CGSize imageS = [image size];
    
    CYHotSearchBtn *btn = [self buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(x, y, imageS.width, imageS.height)];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    
    return btn;
}

+(CGSize)getButtonImageSize
{
    UIImage *image = [UIImage imageNamed:@"热门搜索框"];
    
    return [image size];
}

@end
