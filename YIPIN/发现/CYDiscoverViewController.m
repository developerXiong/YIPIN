//
//  CYDiscoverViewController.m
//  YIPIN
//
//  Created by jeader on 16/3/22.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYDiscoverViewController.h"

#import "HEADFILE.pch"

@interface CYDiscoverViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CYDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.view.backgroundColor = [UIColor whiteColor];
    [self addNavigationBar:2 title:@"找积分"];
    
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.cornerRadius = self.imageView.bounds.size.width/2;
    
    [self startAnimation];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(startAnimation) userInfo:nil repeats:NO];
    [timer fire];
}

- (void)startAnimation
{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        
    } completion:^(BOOL finished) {

    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
