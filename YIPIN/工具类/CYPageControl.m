//
//  CYPageControl.m
//  CustomePageControlTest2
//
//  Created by jeader on 16/1/27.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYPageControl.h"

//不是当前的pagecontrol图片
#define NoCurrentImage [UIImage imageNamed:@"shape26"]

//是当前的pageControl图片
#define CurrentImage [UIImage imageNamed:@"shape27"]

#define Width self.bounds.size.width

#define Height self.bounds.size.height

@interface CYPageControl ()

@property (nonatomic, strong) UIImageView *imageV;

@end

@implementation CYPageControl

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
//        [self setUpSubviews];
        
        
    }
    return self;
}

-(void)setCurrentCount:(int)currentCount
{
//    NSLog(@"%d",currentCount);
    currentCount = currentCount;
    
    
    for (int i = 0; i < 10; i ++) {
        UIImageView *imageV = [self viewWithTag:i + 1000];
        if (i == currentCount) {
            imageV.image = CurrentImage;
            
        }else{
            imageV.image = NoCurrentImage;
        }
        
        
    }
}

-(void)setNumberOfPages:(int)numberOfPages
{
    numberOfPages = numberOfPages;
    
    CGFloat imageWH = 6.5;//图片的宽高
    
    for (int i = 0; i < numberOfPages; i ++) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake( i * (Width/4), 0, Width/4, Height)];
        [self addSubview:view];

        
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageWH, imageWH)];
        imageV.tag = i + 1000;
        imageV.contentMode = UIViewContentModeCenter;
        imageV.center = CGPointMake(Width/8 - 5, Height/2 - 4);
        _imageV = imageV;
        
        
        [view addSubview:imageV];
        
        
    }
}

@end
