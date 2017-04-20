//
//  AddDuiFangAccountVC.m
//  YiFu
//
//  Created by Michael on 16/3/19.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "AddYiFuAccountVC.h"
#import "QinMiPayVC.h"
@interface AddYiFuAccountVC ()
@property (nonatomic, strong) UIView                *headerView;
@property (nonatomic, strong) UIImageView           *headerImage;
@property (nonatomic, strong) UIImageView           *headerQuanImage;
@property (nonatomic, strong) UIView                *duifangAccountView;
@property (nonatomic, strong) UITextField           *setUpPasswordTF;
@property (nonatomic, strong) UIButton              *nextButton;
@end

@implementation AddYiFuAccountVC

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
    [self makeUI];
}

- (void)makeUI
{
    self.duifangAccountView = [UIView new];
    self.duifangAccountView.layer.borderColor = KHexColor(@"#c5c5c5").CGColor;
    self.duifangAccountView.layer.borderWidth = 0.5;
    self.duifangAccountView.backgroundColor = [UIColor whiteColor];
    self.duifangAccountView.frame = CGRectMake(20, 180, CoreWidth-40, 40);
    [self.view addSubview:_duifangAccountView];
    
//    self.beiZhuView = [UIView new];
//    self.beiZhuView.backgroundColor = [UIColor whiteColor];
//    self.beiZhuView.frame = CGRectMake(20, 230, CoreWidth-40, 40);
//    [self.view addSubview:_beiZhuView];
    
    
    
    
    self.setUpPasswordTF = [[UITextField alloc] init];
    self.setUpPasswordTF.placeholder = @"添加对方亿付账号";
    self.setUpPasswordTF.font = KFontSize(14);
    self.setUpPasswordTF.textColor = DeepColor;
    [self.duifangAccountView addSubview:_setUpPasswordTF];
    
//    self.ResetUpPasswordTF = [[UITextField alloc] init];
//    self.ResetUpPasswordTF.placeholder = @"请再输入一次";
//    self.ResetUpPasswordTF.font = KFontSize(14);
//    self.ResetUpPasswordTF.textColor = DeepColor;
//    [self.view addSubview:_ResetUpPasswordTF];
    
    
    
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
    
    
    [_setUpPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.duifangAccountView.mas_bottom).offset(-5);
        make.left.equalTo(self.duifangAccountView.mas_left).offset(0);
        make.right.equalTo(self.duifangAccountView.mas_right).offset(0);
        make.height.equalTo(30);
        
    }];
//    [_ResetUpPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.beiZhuView.mas_bottom).offset(-5);
//        make.left.equalTo(self.beiZhuView.mas_left).offset(0);
//        make.right.equalTo(self.beiZhuView.mas_right).offset(0);
//        make.height.equalTo(30);
//    }];
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.duifangAccountView.mas_bottom).offset(20);
        make.left.equalTo(self.duifangAccountView.mas_left).offset(0);
        make.right.equalTo(self.duifangAccountView.mas_right).offset(0);
        make.height.equalTo(40);
    }];
    
}
- (void)nextButtonClick:(UIButton *)button
{
    QinMiPayVC *qin = [QinMiPayVC new];
    [self.navigationController pushViewController:qin animated:YES];
}
@end
