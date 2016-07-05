//
//  CYChangePassWordViewController.m
//  YIPIN
//
//  Created by jeader on 16/3/30.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYChangePassWordViewController.h"
#import "HEADFILE.pch"

@interface CYChangePassWordViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstPassword;

@property (weak, nonatomic) IBOutlet UITextField *secondPassword;

@property (weak, nonatomic) IBOutlet UIButton *sure;

@end

@implementation CYChangePassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addNavigationBar:NavigationBarStyleDefault title:@"修改密码"];
    
    self.sure.layer.masksToBounds = YES;
    self.sure.layer.cornerRadius = 7.0;
    
}

- (IBAction)clickSure:(id)sender {
}


@end
