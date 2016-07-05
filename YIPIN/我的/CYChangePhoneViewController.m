//
//  CYChangePhoneViewController.m
//  YIPIN
//
//  Created by jeader on 16/3/30.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYChangePhoneViewController.h"
#import "HEADFILE.pch"

@interface CYChangePhoneViewController ()

@property (weak, nonatomic) IBOutlet UILabel *currentPhoneNo;

@property (weak, nonatomic) IBOutlet UITextField *inputNewPhone;

@property (weak, nonatomic) IBOutlet UITextField *inputCode;

@property (weak, nonatomic) IBOutlet UIButton *sure;

@end

@implementation CYChangePhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addNavigationBar:NavigationBarStyleDefault title:@"更换手机"];
    self.sure.layer.masksToBounds = YES;
    self.sure.layer.cornerRadius = 7.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//获取验证码
- (IBAction)getCode:(id)sender {
    
    
    
}

//确定
- (IBAction)clickSure:(id)sender {
    
    
    
}


@end
