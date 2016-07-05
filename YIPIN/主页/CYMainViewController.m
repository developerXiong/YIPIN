//
//  JDMainViewController.m
//  YIPIN
//
//  Created by jeader on 16/3/21.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYMainViewController.h"
#import "HEADFILE.pch"
#import "CYMainTableViewCell.h"
#import "SDCycleScrollView.h"
#import "CYSearchViewController.h"
#import "QRCodeController.h"
#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"

#define SECONDH 149 //tableview第二行的高度

@interface CYMainViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/**
 *  顶部左边的绿色视图
 */
@property (nonatomic, strong) UIView *topLefView;
/**
 *  顶部右边的蓝色视图
 */
@property (nonatomic, strong) UIView *topRightView;
/**
 *  navigationbar上面的放大缩小的button
 */
@property (nonatomic, strong) UIButton *NavigationButton;

@end

static int cellH = 60;

@implementation CYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

-(void)viewWillAppear:(BOOL)animated
{
    //设置导航条
    [self setUpNavigationBar];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
    [self addNavigationBarButton];
    
}

/**
 *  添加导航条上面的可放大缩小的button
 */
-(void)addNavigationBarButton
{
    UIButton *topBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _NavigationButton = topBtn;
    [topBtn setFrame:CGRectMake(60, 29.5 + 25, 0, 0)];
    topBtn.layer.cornerRadius = 5.0;
    topBtn.tag = 397635;
    [topBtn setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:topBtn];
}

#pragma mark - 导航栏设置
-(void)setUpNavigationBar
{
    //隐藏状态栏
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    NSLog(@"%@",self.navigationController);
    self.navigationController.navigationBarHidden = YES;
    
    [self addNavigationBar:2 title:@"易品"];
    [self addLeftItemWithFrame:CGRectZero textOrImage:0 action:@selector(clickLeft) name:@"搜索"];
    [self addRightItemWithFrame:CGRectZero textOrImage:0 action:@selector(clickRight) name:@"扫码"];

}

/**
 *  点击搜索框调用
 */
-(void)clickLeft
{
    NSLog(@"点击搜索");
    CYSearchViewController *searchVC = [[CYSearchViewController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
}


/**
 *  是否可以打开设置页面
 *
 *  @return
 */
- (BOOL)canOpenSystemSettingView {
    if (IS_VAILABLE_IOS8) {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}
/**
 *  跳到系统设置页面
 */
- (void)systemSettingView {
    if (IS_VAILABLE_IOS8) {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
}

/**
 *  点击扫码调用
 */
-(void)clickRight
{
    NSLog(@"点击扫码");
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusDenied){
        if (IS_VAILABLE_IOS8) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"相机权限受限" message:@"请在iPhone的\"设置->隐私->相机\"选项中,允许\"自游邦\"访问您的相机." preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if ([self canOpenSystemSettingView]) {
                    [self systemSettingView];
                }
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        } else {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"相机权限受限" message:@"请在iPhone的\"设置->隐私->相机\"选项中,允许\"自游邦\"访问您的相机." delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil];
//            [alert show];
        }
        
        return;
    }
    
    QRCodeController *qrcodeVC = [[QRCodeController alloc] init];
    [qrcodeVC setDidReceiveBlock:^(NSString *result) {
        NSLog(@"%@", result);
    }];
    [self.navigationController pushViewController:qrcodeVC animated:YES];

}

#pragma mark - tableview滚动的时候
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f",scrollView.contentOffset.y);
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY<-20) {
        self.topLefView.y = offsetY;
        self.topLefView.height = -offsetY+60;
        self.topLefView.width = CYSCREENSIZE.width/3 - offsetY - 20;
        
        self.topRightView.y = offsetY;
        self.topRightView.height = -offsetY+60;
        self.topRightView.x = self.topLefView.width;
        self.topRightView.width = CYSCREENSIZE.width-self.topLefView.width;
    }
    
    UIButton *btn = self.NavigationButton;
    if (-20<=offsetY&&offsetY<40) {
        
        CGFloat btnX = 60;
        CGFloat btnY = 54.5-25*(offsetY+20)/60;
        CGFloat btnW = (CYSCREENSIZE.width-120)*(offsetY+20)/60;
        CGFloat btnH = 25*(offsetY+20)/60;
        
        [btn setFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        
        if (-20<=offsetY&&offsetY<-13) {
            [btn setFrame:CGRectMake(btnX, 29.5, 0, 0)];
        }
    }
    
    if (offsetY>=40) {
        [btn setFrame:CGRectMake(60, 29.5, CYSCREENSIZE.width-120, 25)];
    }
    if (offsetY<=-20) {
        [btn setFrame:CGRectMake(60, 29.5, 0, 0)];
    }

}

#pragma mark - tableView delegate&datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"mainCell";
    CYMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell = [[NSBundle mainBundle] loadNibNamed:@"CYMainTableViewCell" owner:nil options:nil][0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row==0) {
        
        CGFloat leftX = 0;
        CGFloat leftY = 0;
        CGFloat leftW = CYSCREENSIZE.width/3;
        CGFloat leftH = cell.bounds.size.height;
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(leftX, leftY, leftW, leftH)];
        _topLefView = leftView;
        leftView.backgroundColor = GREENCOLOR;
        [cell.contentView addSubview:leftView];
        
        CGFloat rightX = leftW;
        CGFloat rightY = 0;
        CGFloat rightW = CYSCREENSIZE.width-leftW;
        CGFloat rightH = cell.bounds.size.height;
        UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(rightX, rightY, rightW, rightH)];
        _topRightView = rightView;
        rightView.backgroundColor = BLUECOLOR;
        [cell.contentView addSubview:rightView];
        
    }else if(indexPath.row==1){
        
        NSArray *imageArr = @[@"shadow111",@"starstar111",@"red111",@"green111"];
        NSArray *titles = @[@"死",@"亡",@"如",@"风"];
        
        SDCycleScrollView *cycle = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, CYSCREENSIZE.width, SECONDH) shouldInfiniteLoop:YES imageNamesGroup:imageArr];
        cycle.titlesGroup = titles;
        [cell.contentView addSubview:cycle];
        
    }
    
    return cell;
}

//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return cellH;
    }else if(indexPath.row==1){
        return SECONDH;
    }
    return 50;
}

@end
