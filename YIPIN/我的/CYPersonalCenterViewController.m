//
//  CYPersonalCenterViewController.m
//  YIPIN
//
//  Created by jeader on 16/3/30.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYPersonalCenterViewController.h"
#import "HEADFILE.pch"
#import "CYChangeNameViewController.h"
#import "CYChangePhoneViewController.h"
#import "CYChangePassWordViewController.h"
#import "CYCustomAlertView.h"

@interface CYPersonalCenterViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) CYCustomAlertView *alertView;

@end

@implementation CYPersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addGesture];
    [self addNavigationBar:NavigationBarStyleDefault title:@"个人中心"];
    self.tableView.scrollEnabled = NO;
    [self addAlertview];
    
    NSLog(@"%@",self.navigationController);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - alertView
-(void)addAlertview
{
    _alertView = [[CYCustomAlertView alloc] init];
    [self.view addSubview:_alertView];
    [_alertView.takePhoto addTarget:self action:@selector(clickTakePicture) forControlEvents:UIControlEventTouchUpInside];
    [_alertView.xiangce addTarget:self action:@selector(clickXiangce) forControlEvents:UIControlEventTouchUpInside];
}

-(void)clickTakePicture
{
    [_alertView hidden];
    NSLog(@"点击拍照");
    if (TARGET_IPHONE_SIMULATOR) { //模拟器
        [CYCreateView addAlertViewInView:self title:@"呵呵" message:@"模拟器没有相机啊逗比" count:0 doWhat:^{
            
        }];
    }else if(TARGET_OS_IPHONE){ //真机
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            [self presentViewController:picker animated:YES completion:nil];
            
        }else{
            [CYCreateView addAlertViewInView:self title:@"温馨提示" message:@"你没有摄像头" count:0 doWhat:^{
            }];
        }
    }
}

-(void)clickXiangce
{
    [_alertView hidden];
    
    NSLog(@"点击相册");
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}


#pragma mark - tableView delegate&datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 3;
    }
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = 0;
    }
    
    NSArray *textArr = @[@[@"头像",@"昵称",@"手机号"],@[@"修改密码"]];
    cell.textLabel.text = textArr[indexPath.section][indexPath.row];
    cell.textLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            CGFloat imageWH = 59;
            UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(CYSCREENSIZE.width-imageWH-30, (75-imageWH)/2, imageWH, imageWH)];
            imageV.layer.masksToBounds = YES;
            imageV.layer.cornerRadius = imageWH/2;
            [cell.contentView addSubview:imageV];
            imageV.image = [UIImage imageNamed:@"green111"];
        }
        
        if (indexPath.row==1) {
            CGFloat nameW = 200;
            UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(CYSCREENSIZE.width-30-nameW, 0, nameW, 50)];
            [cell.contentView addSubview:name];
            name.font = [UIFont systemFontOfSize:15];
            name.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
            name.textAlignment = NSTextAlignmentRight;
            name.text = @"死亡如风";
        }
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%lu----%lu",indexPath.section,indexPath.row);
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            [_alertView show];
        }
        if (indexPath.row==1) { //修改昵称
            CYChangeNameViewController *changeName = [[CYChangeNameViewController alloc] init];
            [self.navigationController pushViewController:changeName animated:YES];
        }
        if (indexPath.row==2) { //更换手机
            CYChangePhoneViewController *phone = [[CYChangePhoneViewController alloc] init];
            [self.navigationController pushViewController:phone animated:YES];
        }
    }
    
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            CYChangePassWordViewController *password = [[CYChangePassWordViewController alloc] init];
            [self.navigationController pushViewController:password animated:YES];
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0&&indexPath.row==0) {
        return 75;
    }
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.000001;
}

@end
