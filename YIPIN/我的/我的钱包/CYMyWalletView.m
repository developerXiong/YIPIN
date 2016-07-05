//
//  CYMyWalletView.m
//  YIPIN
//
//  Created by jeader on 16/3/30.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYMyWalletView.h"
#import "HEADFILE.pch"

@interface CYMyWalletView ()

@property (nonatomic, strong) UIView *firstView;

@property (nonatomic, strong) UIView *secondView;

@property (nonatomic, strong) UIView *thirdView;

@property (nonatomic, strong) UILabel *line;

@end

@implementation CYMyWalletView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        [self addSubviews];
        [self addFirstView];
        [self addSecondView];
        [self addThirdView];
        _secondView.hidden = YES;
        _thirdView.hidden = YES;
        
    }
    return self;
}

-(void)addSubviews
{
    //三个按钮
    for (int i = 0; i < 3; i ++) {
        NSArray *nameArr = @[@"银行卡",@"充值",@"交易明细"];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(i * CYSCREENSIZE.width/3, 0, CYSCREENSIZE.width/3, 40)];
        [btn setTitle:nameArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[[UIColor blackColor] colorWithAlphaComponent:0.7] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor whiteColor]];
        btn.tag = i;
        [btn addTarget:self action:@selector(clickTypeBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        if (i != 2) {
            UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(CYSCREENSIZE.width/3-0.5, 3, 0.5, 34)];
            line.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
            [btn addSubview:line];
        }
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 39.5, CYSCREENSIZE.width/3, 0.5)];
        line.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        [btn addSubview:line];
        
    }
    
    UILabel *line1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 37, CYSCREENSIZE.width/3, 3)];
    _line = line1;
    line1.backgroundColor = BLACKCOLOR;
    [self addSubview:line1];
    
}

-(void)clickTypeBtn:(UIButton *)btn
{
    [UIView animateWithDuration:0.3 animations:^{
       
        self.line.x = CYSCREENSIZE.width/3*btn.tag;
        
    }];
    
    switch (btn.tag) {
        case 0:
            
            _secondView.hidden = YES;
            _thirdView.hidden = YES;
            _firstView.hidden = NO;
            
            break;
            
        case 1:
            
            _firstView.hidden = YES;
            _thirdView.hidden = YES;
            _secondView.hidden = NO;
            
            break;
            
        case 2:
            
            _firstView.hidden = YES;
            _secondView.hidden = YES;
            _thirdView.hidden = NO;
            
            break;
            
        default:
            break;
    }
}

-(void)addFirstView
{
    //银行卡
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, CYSCREENSIZE.width, self.bounds.size.height-40)];
    _firstView = firstView;
    [self addSubview:firstView];
    
    [self addNoRecordInview:firstView action:@selector(clickGoBangding) Image:@"没有绑定银行卡" title:@"你还没有绑定银行卡" btnImage:@"立即绑定"];
}

//点击立即绑定按钮
-(void)clickGoBangding
{
    NSLog(@"立即绑定");
}

-(void)addSecondView
{
    //充值
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, CYSCREENSIZE.width, self.bounds.size.height-40)];
    _secondView = secondView;
    [self addSubview:secondView];
    secondView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.8];
    
    
}

-(void)addThirdView
{
    //交易明细
    UIView *thirdView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, CYSCREENSIZE.width, self.bounds.size.height-40)];
    _thirdView = thirdView;
    [self addSubview:thirdView];
    
    [self addNoRecordInview:thirdView action:@selector(clickGoLook) Image:@"没有交易记录" title:@"你还没有交易记录" btnImage:@"去逛逛"];
    
}

//点击去逛逛按钮
-(void)clickGoLook
{
    NSLog(@"去逛逛");
}

-(void)addNoRecordInview:(UIView *)view action:(SEL)action Image:(NSString *)imageName title:(NSString *)title btnImage:(NSString *)btnImageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    CGSize imageS = [image size];
    //图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((CYSCREENSIZE.width-imageS.width)/2, 120, imageS.width, imageS.height)];
    imageView.image = image;
    [view addSubview:imageView];
    //字
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+10, CYSCREENSIZE.width, 20)];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    label.font = [UIFont systemFontOfSize:13];
    [view addSubview:label];
    
    UIImage *btnImage = [UIImage imageNamed:btnImageName];
    CGSize btnImageS = [btnImage size];
    //按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake((CYSCREENSIZE.width-btnImageS.width)/2, CGRectGetMaxY(label.frame)+15, btnImageS.width, btnImageS.height)];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:btnImage forState:UIControlStateNormal];
    [view addSubview:btn];
    
}

@end
