//
//  ImproveInfomationVC.m
//  YiFu
//
//  Created by Michael on 16/3/16.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "ImproveInfomationVC.h"
@interface ImproveInfomationVC()
@property (nonatomic, strong) UIView        *line;
@property (nonatomic, strong) UIView        *line2;
@property (nonatomic, strong) UIView        *line3;
@property (nonatomic, strong) UITextField   *setUpNameTF;
@property (nonatomic, strong) UITextField   *setUpPasswordTF;
@property (nonatomic, strong) UITextField   *resetUpPasswordTF;
@property (nonatomic, strong) UIButton      *nextButton;
@end


@implementation ImproveInfomationVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"完善个人资料";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.line = [UIView new];
    self.line.backgroundColor = KHexColor(@"#b3b3b3");
    self.line.frame = CGRectMake(CoreWidth/6, 160, CoreWidth*2/3, 0.5);
    [self.view addSubview:_line];
    
    self.line2 = [UIView new];
    self.line2.backgroundColor = KHexColor(@"#b3b3b3");
    self.line2.frame = CGRectMake(CoreWidth/6, 210, CoreWidth*2/3, 0.5);
    [self.view addSubview:_line2];
    
    self.line3 = [UIView new];
    self.line3.backgroundColor = KHexColor(@"#b3b3b3");
    self.line3.frame = CGRectMake(CoreWidth/6, 260, CoreWidth*2/3, 0.5);
    [self.view addSubview:_line3];
    
    self.setUpNameTF = [[UITextField alloc] init];
    self.setUpNameTF.placeholder = @"创建用户名";
    self.setUpNameTF.font = KFontSize(14);
    self.setUpNameTF.textColor = DeepColor;
    [self.view addSubview:_setUpNameTF];
      
    self.setUpPasswordTF = [[UITextField alloc] init];
    self.setUpPasswordTF.placeholder = @"设置密码";
    self.setUpPasswordTF.font = KFontSize(14);
    self.setUpPasswordTF.textColor = DeepColor;
    [self.view addSubview:_setUpPasswordTF];

    self.resetUpPasswordTF = [[UITextField alloc] init];
    self.resetUpPasswordTF.placeholder = @"设置密码";
    self.resetUpPasswordTF.font = KFontSize(14);
    self.resetUpPasswordTF.textColor = DeepColor;
    [self.view addSubview:_resetUpPasswordTF];
    
 

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
    
    
    [_setUpNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.line.mas_bottom).offset(-5);
        make.left.equalTo(self.line.mas_left).offset(0);
        make.right.equalTo(self.line.mas_right).offset(0);
        make.height.equalTo(30);
    }];
    
    [_setUpPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.line2.mas_bottom).offset(-5);
        make.left.equalTo(self.line2.mas_left).offset(0);
        make.right.equalTo(self.line2.mas_right).offset(0);
        make.height.equalTo(30);
    }];
    [_resetUpPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.line3.mas_bottom).offset(-5);
        make.left.equalTo(self.line3.mas_left).offset(0);
        make.right.equalTo(self.line3.mas_right).offset(0);
        make.height.equalTo(30);
    }];
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line3.mas_bottom).offset(20);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth*2/3);
        make.height.equalTo(40);
    }];
}
- (void)nextButtonClick:(UIButton *)button
{
    
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:JumpWindow object:nil userInfo:nil];
}
@end
