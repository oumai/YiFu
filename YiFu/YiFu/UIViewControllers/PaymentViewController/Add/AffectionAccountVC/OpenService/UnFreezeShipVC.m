//
//  QinMiPayVC.m
//  YiFu
//
//  Created by Michael on 16/3/21.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "UnFreezeShipVC.h"
#import "FDAlertView.h"
@interface UnFreezeShipVC ()<FDAlertViewDelegate>
@property (nonatomic, strong) UIView                *headerView;
@property (nonatomic, strong) UIImageView           *headerImage;
@property (nonatomic, strong) UIImageView           *headerQuanImage;
@property (nonatomic, strong) TTTAttributedLabel    *relationShipLabel;
@property (nonatomic, strong) TTTAttributedLabel    *nickNameLabel;
@property (nonatomic, strong) UIView                *duifangAccountView;
@property (nonatomic, strong) UITextField           *meiYueEduTF;
@property (nonatomic, strong) TTTAttributedLabel    *qinMiFuJieLabel;
@property (nonatomic, strong) TTTAttributedLabel    *daiSureLabel;
@property (nonatomic, strong) UIButton              *sureUnfeezeButton;
@end

@implementation UnFreezeShipVC



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"开通服务";
    self.view.backgroundColor = BackgroundColor;
    self.headerView = [UIView new];
    self.headerView.frame = CGRectMake(0, 0, CoreWidth, 64+44);
    self.headerView.backgroundColor = [UIColor colorWithRed:33/255 green:33/255 blue:33/255 alpha:1];
    [self.view addSubview: _headerView];
    
    self.headerQuanImage = [UIImageView new];      ///头像
    self.headerQuanImage.image = [UIImage imageNamed:@"headerQuan"];
    [self.headerView addSubview:_headerQuanImage];
    
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    self.headerImage = [UIImageView new];
    self.headerImage.image = [UIImage imageNamed:@"header"];
    self.headerImage.userInteractionEnabled = YES;
    [self.headerImage addGestureRecognizer:tapG];
    [self.headerView addSubview:_headerImage];
    
    
    
    
    self.relationShipLabel = [TTTAttributedLabel new];
    self.relationShipLabel.font = [UIFont systemFontOfSize:14];
    self.relationShipLabel.textColor = DeepColor;
    self.relationShipLabel.text = @"亲人";
    [self.view addSubview:_relationShipLabel];
    
    
    
    self.nickNameLabel = [TTTAttributedLabel new];
    self.nickNameLabel.font = [UIFont systemFontOfSize:14];
    self.nickNameLabel.textColor = LightColor;
    self.nickNameLabel.text = @"NickName";
    [self.headerView addSubview:_nickNameLabel];
    
    self.daiSureLabel = [TTTAttributedLabel new];
    self.daiSureLabel.font = [UIFont systemFontOfSize:14];
    self.daiSureLabel.textColor = KHexColor(@"#b44719");
    self.daiSureLabel.text = @"等待对方确认";
    [self.headerView addSubview:_daiSureLabel];
    
    [_headerQuanImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerView.mas_centerX).offset(0);
        make.centerY.equalTo(self.headerView.mas_bottom).offset(0);
        make.width.equalTo(70);
        make.height.equalTo(70);
    }];
    [_headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headerQuanImage.mas_centerY).offset(0);
        make.centerX.equalTo(self.headerQuanImage.mas_centerX).offset(0);
        make.width.equalTo(127/2);
        make.height.equalTo(127/2);
    }];
    [_relationShipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerQuanImage.mas_centerX).offset(0);
        make.top.equalTo(self.headerQuanImage.mas_bottom).offset(10);
        make.width.equalTo(self.relationShipLabel.mas_width);
        make.height.equalTo(14);
    }];
    [_nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerQuanImage.mas_centerX).offset(0);
        make.top.equalTo(self.relationShipLabel.mas_bottom).offset(10);
        make.width.equalTo(self.nickNameLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    [_daiSureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerQuanImage.mas_centerX).offset(0);
        make.top.equalTo(self.nickNameLabel.mas_bottom).offset(30);
        make.width.equalTo(self.daiSureLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    
    [self makeUI];
}
#pragma mark ------------------------------------------------------------------ActionsButton -------------------------------------------------
- (void)tap
{
    
}
- (void)switchOnClick:(id)sender
{
    UISwitch *switc = (UISwitch *)sender;
    BOOL isButtonOn = [switc isOn];
    
    if (isButtonOn) {
    }
    else
    {
        
    }
}
- (void)sureUnfeezeButtonClick:(UIButton *)button
{
    FDAlertView *alertView = [[FDAlertView alloc] initWithTitle:@"确认解除关系" icon:nil message:@"" delegate:self  buttonTitles:@"取消",@"确认", nil];
    [alertView show];
}
-(void)alertView:(FDAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            break;
        case 1:
            break;
    }
}

- (void)makeUI
{
    self.duifangAccountView = [UIView new];
    self.duifangAccountView.layer.borderColor = KHexColor(@"#c5c5c5").CGColor;
    self.duifangAccountView.layer.borderWidth = 0.5;
    self.duifangAccountView.backgroundColor = [UIColor whiteColor];
    self.duifangAccountView.frame = CGRectMake(0, 250, CoreWidth-0, 40);
    [self.view addSubview:_duifangAccountView];
    
    
    
    self.qinMiFuJieLabel = [TTTAttributedLabel new];
    self.qinMiFuJieLabel.font = KFontSize(14);
    self.qinMiFuJieLabel.textColor = DeepColor;
    self.qinMiFuJieLabel.text = @"亲密付";
    [self.duifangAccountView addSubview:_qinMiFuJieLabel];
    
    
    
    
    self.meiYueEduTF = [[UITextField alloc] init];
    self.meiYueEduTF.font = KFontSize(14);
    self.meiYueEduTF.textColor = DeepColor;
    self.meiYueEduTF.textAlignment = NSTextAlignmentLeft;
    self.meiYueEduTF.placeholder = @"1000";
    [self.duifangAccountView addSubview:_meiYueEduTF];
    
   
    
    
    
    self.sureUnfeezeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sureUnfeezeButton.layer.cornerRadius = 5;
    self.sureUnfeezeButton.layer.masksToBounds = YES;
    self.sureUnfeezeButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.sureUnfeezeButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.sureUnfeezeButton setTitle:@"解除关联" forState:UIControlStateNormal];
    [self.sureUnfeezeButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.sureUnfeezeButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#2e408a")] forState:UIControlStateNormal];
    [self.sureUnfeezeButton addTarget:self action:@selector(sureUnfeezeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sureUnfeezeButton];
    
    
    [_qinMiFuJieLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.duifangAccountView.mas_top).offset(13);
        make.left.equalTo(self.duifangAccountView.mas_left).offset(20);
        make.width.equalTo(60);
        make.height.equalTo(14);
    }];
    
    
    
    [_meiYueEduTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.duifangAccountView.mas_centerY).offset(0);
        make.left.equalTo(self.qinMiFuJieLabel.mas_right).offset(20);
        make.right.equalTo(self.duifangAccountView.mas_right).offset(-150);
        make.height.equalTo(30);
    }];
    
    
    [_sureUnfeezeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.duifangAccountView.mas_bottom).offset(20);
        make.left.equalTo(self.duifangAccountView.mas_left).offset(20);
        make.right.equalTo(self.duifangAccountView.mas_right).offset(-20);
        make.height.equalTo(40);
    }];
    
    
}
@end

