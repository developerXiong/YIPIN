//
//  CYChangeNameViewController.m
//  YIPIN
//
//  Created by jeader on 16/3/30.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYChangeNameViewController.h"
#import "HEADFILE.pch"

@interface CYChangeNameViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputName;

@end

@implementation CYChangeNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNavigationBar:NavigationBarStyleDefault title:@"更改昵称"];
    [self addRightItemWithFrame:CGRectMake(20, (44-25)/2, 40, 25) textOrImage:1 action:@selector(clickSave) name:@"保存"];
    [self.inputName becomeFirstResponder]; //textfield成为第一响应者
    
}



//点击保存按钮
-(void)clickSave
{
    NSLog(@"保存了");
}


@end
