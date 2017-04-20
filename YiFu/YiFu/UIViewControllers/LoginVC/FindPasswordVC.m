//
//  FindPasswordVC.m
//  YiFu
//
//  Created by Michael on 16/3/17.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "FindPasswordVC.h"
#import "ResetPasswordVC.h"
static NSString *identifier = @"RegistCustomCell";
@interface FindPasswordVC()
@property (nonatomic, strong) UIView                *numberView;
@property (nonatomic, strong) UIView                *numberLine;
@property (nonatomic, strong) UIView                *numberVerticalLine;
@property (nonatomic, strong) TTTAttributedLabel    *jia86Label;
@property (nonatomic, strong) UITextField           *numberTF;
@property (nonatomic, strong) UIImageView           *arrowImage;

@property (nonatomic, strong) UIView                *numberView2; //第二个view
@property (nonatomic, strong) UIView                *numberLine2;
@property (nonatomic, strong) UIView                *numberVerticalLine2;
@property (nonatomic, strong) UIButton              *sendCodeButton;
@property (nonatomic, strong) UITextField           *codeTF;
@property (nonatomic, strong) UIButton              *nextButton;

@end
@implementation FindPasswordVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"找回密码";
    self.view.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:tap];
    [self makeUI];
   
    
}

- (void)nextButtonClick:(UIButton *)button
{
    ResetPasswordVC *impro = [ResetPasswordVC new];
    [self.navigationController pushViewController:impro animated:YES];
}
- (void)sendCodeButtonClick:(UIButton *)button
{
    
}

- (void)tapClick
{
    [self.view endEditing:YES];
}
- (void)makeUI
{
    self.numberView = [UIView new];
    self.numberView.frame = CGRectMake(CoreWidth/6 , 120, CoreWidth*2/3, 50);
    self.numberView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_numberView];
    
    self.numberLine = [UIView new];
    self.numberLine.backgroundColor = KHexColor(@"#b3b3b3");
    self.numberLine.frame = CGRectMake(0, 50, CoreWidth*2/3, 0.5);
    [self.numberView addSubview:_numberLine];
    
    self.jia86Label = [TTTAttributedLabel new];
    self.jia86Label.textColor = DeepColor;
    self.jia86Label.font = KFontSize(14);
    self.jia86Label.text = @"+ 86";
    [self.numberView addSubview:_jia86Label];
    
    
    
    self.arrowImage = [UIImageView new];
    self.arrowImage.image = [UIImage imageNamed:@"login_arrow_down"];
    [self.numberView addSubview:_arrowImage];
    
    
    self.numberVerticalLine = [UIView new];
    self.numberVerticalLine.backgroundColor = KHexColor(@"#b3b3b3");
    [self.numberView addSubview:_numberVerticalLine];
    
    
    self.numberTF = [[UITextField alloc] init];
    self.numberTF.placeholder = @"请输入您的手机号码";
    self.numberTF.font = KFontSize(14);
    self.numberTF.textColor = DeepColor;
    self.numberTF.keyboardType = UIKeyboardTypePhonePad;
    [self.numberView addSubview:_numberTF];
    
    
    
    
    self.numberView2 = [UIView new];    ///第二条线
    self.numberView2.frame = CGRectMake(CoreWidth/6 , 170, CoreWidth*2/3, 50);
    self.numberView2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_numberView2];
    
    self.numberLine2 = [UIView new];
    self.numberLine2.backgroundColor = KHexColor(@"#b3b3b3");
    self.numberLine2.frame = CGRectMake(0, 50, CoreWidth*2/3, 0.5);
    [self.numberView2 addSubview:_numberLine2];
    
    
    
    self.sendCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sendCodeButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.sendCodeButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.sendCodeButton.layer.cornerRadius = 5;
    self.sendCodeButton.layer.masksToBounds = YES;
    [self.sendCodeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    [self.sendCodeButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.sendCodeButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#2e408a")] forState:UIControlStateNormal];
    [self.sendCodeButton addTarget:self action:@selector(sendCodeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sendCodeButton];
    
    
    
    self.numberVerticalLine2 = [UIView new];
    self.numberVerticalLine2.backgroundColor = KHexColor(@"#b3b3b3");
    [self.numberView2 addSubview:_numberVerticalLine2];
    
    self.codeTF = [[UITextField alloc] init];
    self.codeTF.placeholder = @"请输验证码";
    self.codeTF.font = KFontSize(14);
    self.codeTF.textColor = DeepColor;
    self.codeTF.keyboardType = UIKeyboardTypePhonePad;
    [self.numberView2 addSubview:_codeTF];
    
    
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextButton.layer.cornerRadius = 5;
    self.nextButton.layer.masksToBounds = YES;
    self.nextButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.nextButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [self.nextButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.nextButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#2e408a")] forState:UIControlStateNormal];
    [self.nextButton addTarget:self action:@selector(nextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextButton];
    
    
    
    
    [_jia86Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.numberView.mas_bottom).offset(-10);
        make.left.equalTo(self.numberView.mas_left).offset(10);
        make.width.equalTo(self.jia86Label.mas_width);
        make.height.equalTo(14);
    }];
    
    
    [_arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.jia86Label.mas_centerY).offset(3);
        make.left.equalTo(self.jia86Label.mas_right).offset(10);
        make.width.equalTo(7);
        make.height.equalTo(4);
    }];
    [_numberVerticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.arrowImage.mas_centerY).offset(0);
        make.left.equalTo(self.arrowImage.mas_right).offset(10);
        make.width.equalTo(1);
        make.height.equalTo(15);
    }];
    
    [_sendCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.numberView2.mas_bottom).offset(-3);
        make.right.equalTo(self.numberView2.mas_right).offset(0);
        make.width.equalTo(100);
        make.height.equalTo(35);
    }];
    
    
    [_numberVerticalLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.sendCodeButton.mas_centerY).offset(0);
        make.right.equalTo(self.sendCodeButton.mas_left).offset(-10);
        make.width.equalTo(1);
        make.height.equalTo(20);
    }];
    [_numberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.arrowImage.mas_centerY).offset(0);
        make.left.equalTo(self.numberVerticalLine.mas_right).offset(7);
        make.width.equalTo(250);
        make.height.equalTo(15);
    }];
    
    [_codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.sendCodeButton.mas_centerY).offset(0);
        make.left.equalTo(self.jia86Label.mas_left).offset(0);
        make.width.equalTo(100);
        make.height.equalTo(30);
    }];
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.numberView2.mas_bottom).offset(30);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth*2/3);
        make.height.equalTo(40);
    }];
    
   
}
@end
