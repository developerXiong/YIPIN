//
//  CYMyWalletViewController.m
//  YIPIN
//
//  Created by jeader on 16/3/30.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYMyWalletViewController.h"
#import "HEADFILE.pch"
#import "CYMyWalletView.h"

@interface CYMyWalletViewController ()

@property (weak, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet UILabel *totalMoney;

@end

@implementation CYMyWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addNavigationBar:NavigationBarStyleDefault title:@"我的钱包"];
    
    CYMyWalletView *walletView = [[CYMyWalletView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topView.frame), CYSCREENSIZE.width, CYSCREENSIZE.height-CGRectGetMaxY(self.topView.frame))];
    [self.view addSubview:walletView];
    
}



@end
