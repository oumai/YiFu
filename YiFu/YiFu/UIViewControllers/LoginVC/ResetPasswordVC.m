//
//  ImproveInfomationVC.m
//  YiFu
//
//  Created by Michael on 16/3/16.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "ResetPasswordVC.h"
@interface ResetPasswordVC()

@property (nonatomic, strong) UIView        *bgView;

@property (nonatomic, strong) UIView        *line;
@property (nonatomic, strong) UIView        *line2;
@property (nonatomic, strong) UITextField   *setUpPasswordTF;
@property (nonatomic, strong) UITextField   *ResetUpPasswordTF;
@property (nonatomic, strong) UIButton      *nextButton;
@end


@implementation ResetPasswordVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"重置密码";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.bgView = [UIView new];
    self.bgView.frame = self.view.frame;
    [self.view addSubview:_bgView];
    
    self.line = [UIView new];
    self.line.backgroundColor = KHexColor(@"#b3b3b3");
    self.line.frame = CGRectMake(CoreWidth/6, 160, CoreWidth*2/3, 0.5);
    [self.bgView addSubview:_line];
    
    self.line2 = [UIView new];
    self.line2.backgroundColor = KHexColor(@"#b3b3b3");
    self.line2.frame = CGRectMake(CoreWidth/6, 210, CoreWidth*2/3, 0.5);
    [self.bgView addSubview:_line2];
    
    
   
    
    self.setUpPasswordTF = [[UITextField alloc] init];
    self.setUpPasswordTF.placeholder = @"请输入6-8位新密码";
    self.setUpPasswordTF.font = KFontSize(14);
    self.setUpPasswordTF.textColor = DeepColor;
    [self.bgView addSubview:_setUpPasswordTF];
    
    self.ResetUpPasswordTF = [[UITextField alloc] init];
    self.ResetUpPasswordTF.placeholder = @"请再输入一次";
    self.ResetUpPasswordTF.font = KFontSize(14);
    self.ResetUpPasswordTF.textColor = DeepColor;
    [self.bgView addSubview:_ResetUpPasswordTF];
    
    
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextButton.layer.cornerRadius = 5;
    self.nextButton.layer.masksToBounds = YES;
    self.nextButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.nextButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [self.nextButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.nextButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#2e408a")] forState:UIControlStateNormal];
    [self.nextButton addTarget:self action:@selector(nextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:_nextButton];
    
     
    [_setUpPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.line.mas_bottom).offset(-5);
        make.left.equalTo(self.line.mas_left).offset(0);
        make.right.equalTo(self.line.mas_right).offset(0);
        make.height.equalTo(30);
       
    }];
    [_ResetUpPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.line2.mas_bottom).offset(-5);
        make.left.equalTo(self.line2.mas_left).offset(0);
        make.right.equalTo(self.line2.mas_right).offset(0);
        make.height.equalTo(30);
    }];
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line2.mas_bottom).offset(20);
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
