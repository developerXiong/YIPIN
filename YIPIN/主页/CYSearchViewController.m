//
//  CYSearchViewController.m
//  YIPIN
//
//  Created by jeader on 16/3/24.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYSearchViewController.h"
#import "HEADFILE.pch"
#import "CYSearchCell.h"
#import "CYHotSearchBtn.h"

@interface CYSearchViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CYSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addGesture];
    
    [self addNavigationBar:NavigationBarStyleDefault];
    [self addRightItemWithFrame:CGRectZero textOrImage:0 action:@selector(clickRightDelete) name:@"清除历史信息"];
    [self addTopSearchBar]; //添加搜索框
}

/**
 *  点击右边的垃圾箱
 */
-(void)clickRightDelete
{
    NSLog(@"点击垃圾箱");
}

#pragma mark - 添加搜索框
-(void)addTopSearchBar
{
    UIImage *image = [UIImage imageNamed:@"搜索输入框"];
    CGSize imageS = [image size];
    /**
     *  搜索底图
     */
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake((CYSCREENSIZE.width-imageS.width)/2, 20+(44-imageS.height)/2, imageS.width, imageS.height)];
    backgroundView.image = image;
    backgroundView.userInteractionEnabled = YES;
    [self.view addSubview:backgroundView];
    
    UIImage *bigImage = [UIImage imageNamed:@"搜索框内放大镜"];
    CGSize bigS = [bigImage size];
    /**
     *  放大镜
     */
    UIImageView *bigger = [[UIImageView alloc] initWithFrame:CGRectMake(10, (imageS.height-bigS.height)/2, bigS.width, bigS.height)];
    bigger.image = bigImage;
    bigger.userInteractionEnabled = YES;
    [backgroundView addSubview:bigger];
    
    /**
     *  输入框
     */
    UITextField *input = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(bigger.frame)+10, 0, backgroundView.bounds.size.width-CGRectGetMaxX(bigger.frame)-10, backgroundView.bounds.size.height)];
    input.placeholder = @"输入商家名称";
    input.font = [UIFont systemFontOfSize:10];
    [backgroundView addSubview:input];
    
}


#pragma mark - tableView delegate & datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==1) {
        return 2;
    }
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CYSearchCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell = [[NSBundle mainBundle]loadNibNamed:@"CYSearchCell" owner:nil options:nil][0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *textArr = @[@"KFC",@"麦当劳",@"必胜客",@"座上客",@"红天下",@"欢乐牧场",@"香天下",@"呵呵呵"];
    if (indexPath.section == 0) {
        for (int i = 0; i < 8; i ++) {
            
            CGSize imageS = [CYHotSearchBtn getButtonImageSize];
            CGFloat margin = (CYSCREENSIZE.width-imageS.width*4-40)/3; //横向间距
            int row = i/4; //第几行
            int colow = i%4; //第几列
            CGFloat X = colow*(margin+imageS.width)+20;
            CGFloat Y = row*((72-imageS.height*2)/3+imageS.height)+(72-imageS.height*2)/3;
            
            UIButton *btn = [CYHotSearchBtn createBtnWithX:X Y:Y title:textArr[i]];
            btn.tag = 1000+i;
            [btn addTarget:self action:@selector(clickHotSearch:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:btn];
        }
    }
    
    if (indexPath.section==1) {
        
        NSArray *arr = @[@"大脸鸡排",@"丽华快餐"];
        cell.imageView.image = [UIImage imageNamed:@"放大镜"];
        cell.textLabel.text = arr[indexPath.row];
        
    }
    
    return cell;
    
}

//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 72;
    }
    return 40;
}

//头视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

//脚视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00001;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return @"热门搜索";
    }
    return @"搜索历史";
}

#pragma mark - 点击下面的搜索框
-(void)clickHotSearch:(UIButton *)sender
{
    NSLog(@"%ld",(long)sender.tag);
}



@end
