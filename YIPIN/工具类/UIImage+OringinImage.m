//
//  UIImage+OringinImage.m
//  YIPIN
//
//  Created by jeader on 16/3/22.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "UIImage+OringinImage.h"

@implementation UIImage (OringinImage)

+(instancetype)oringinImageWithImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
   
}

@end
