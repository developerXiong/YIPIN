//
//  CYProfileViewController.m
//  YIPIN
//
//  Created by jeader on 16/3/22.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYProfileViewController.h"
#import "CYPersonalCenterViewController.h"
#import "CYMyWalletViewController.h"
#import "LHClickImageView.h"
@interface CYProfileViewController ()<UITableViewDelegate,UITableViewDataSource>
/**
 *  会员中心按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *vipCenterBtn;
/**
 *  会员等级
 */
@property (weak, nonatomic) IBOutlet UILabel *memberLevel;
/**
 *  名称
 */
@property (weak, nonatomic) IBOutlet UILabel *name;
/**
 *  信用积分
 */
@property (weak, nonatomic) IBOutlet UILabel *crediteScore;
/**
 *  已推荐人数
 */
@property (weak, nonatomic) IBOutlet UILabel *recommendNumber;
/**
 *  进度条的width约束
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *progressBarWidth;
/**
 *  人数定位图的x约束
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *peopleX;
/**
 *  头像按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *icon;


@end

@implementation CYProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTopView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 上半部分视图
-(void)setUpTopView
{
    self.vipCenterBtn.layer.cornerRadius = 5.0; //会员中心按钮的圆角效果
    self.progressBarWidth.constant = 150; //设置会员等级的进度条
    self.peopleX.constant = self.progressBarWidth.constant+10;
    self.icon.layer.masksToBounds = YES;
    self.icon.layer.cornerRadius = self.icon.bounds.size.width/2; //设置头像按钮的圆角
    [self.icon setBackgroundImage:[UIImage imageNamed:@"green111"] forState:UIControlStateNormal];
}

//点击设置按钮
- (IBAction)clickSetting:(id)sender {
}
//点击消息按钮
- (IBAction)clickMessage:(id)sender {
}
//点击会员中心
- (IBAction)clickVipCenter:(id)sender {
}
//点击头像
- (IBAction)clickIcon:(id)sender {
    CYPersonalCenterViewController *personal = [[CYPersonalCenterViewController alloc] init];
    [self.navigationController pushViewController:personal animated:YES];
}

#pragma mark - tableView delegate&datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 4;
    }
    if (section==2) {
        return 2;
    }
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = 0;
    }
    
    NSArray *imageArr = @[@[@"我的钱包",@"我的订单",@"我的预约",@"我的收藏"],@[@"推荐好友"],@[@"关于我们",@"我要合作"]];
    UIImage *image = [UIImage imageNamed:imageArr[indexPath.section][indexPath.row]];
    
    CGSize imageS = [image size];
    
    LHClickImageView *imageV = [[LHClickImageView alloc] initWithFrame:CGRectMake(0, 0, imageS.width, imageS.height)];
    imageV.image = image;
    [cell.contentView addSubview:imageV];
    cell.textLabel.text = imageArr[indexPath.section][indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==0) { //我的钱包
            CYMyWalletViewController *mywallet = [[CYMyWalletViewController alloc] init];
            [self.navigationController pushViewController:mywallet animated:YES];
        }
    }
    if (indexPath.section==1) {
        
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 94/2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.000001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15/2;
}


@end
