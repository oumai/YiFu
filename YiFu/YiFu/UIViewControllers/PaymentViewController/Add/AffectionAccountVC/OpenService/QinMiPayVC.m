//
//  QinMiPayVC.m
//  YiFu
//
//  Created by Michael on 16/3/21.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "QinMiPayVC.h"
#import "UnFreezeShipVC.h"
@interface QinMiPayVC ()
@property (nonatomic, strong) UIView                *headerView;
@property (nonatomic, strong) UIImageView           *headerImage;
@property (nonatomic, strong) UIImageView           *headerQuanImage;
@property (nonatomic, strong) TTTAttributedLabel    *relationShipLabel;
@property (nonatomic, strong) TTTAttributedLabel    *nickNameLabel;
@property (nonatomic, strong) UIView                *duifangAccountView;
@property (nonatomic, strong) UITextField           *meiYueEduTF;
@property (nonatomic, strong) TTTAttributedLabel    *qinMiFuLabel;
@property (nonatomic, strong) TTTAttributedLabel    *meiYueEDuLabel;
@property (nonatomic, strong) UIView                *line;
@property (nonatomic, strong) UISwitch              *switchOn;
@property (nonatomic, strong) UIButton              *nextButton;
@property (nonatomic, strong) TTTAttributedLabel    *protocolLabel;
@property (nonatomic, strong) UIButton              *kuangButton;
@property (nonatomic, strong) UIButton              *jieChuButton;

@end

@implementation QinMiPayVC



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
- (void)nextButtonClick:(UIButton *)button
{
    
}
- (void)jieChuButtonClick:(UIButton *)button
{
    UnFreezeShipVC *fee = [UnFreezeShipVC new];
    [self.navigationController pushViewController:fee animated:YES];
}
- (void)makeUI
{
    self.duifangAccountView = [UIView new];
    self.duifangAccountView.layer.borderColor = KHexColor(@"#c5c5c5").CGColor;
    self.duifangAccountView.layer.borderWidth = 0.5;
    self.duifangAccountView.backgroundColor = [UIColor whiteColor];
    self.duifangAccountView.frame = CGRectMake(0, 200, CoreWidth-0, 80);
    [self.view addSubview:_duifangAccountView];
    
    
    self.line = [UIView new];
    self.line.backgroundColor = KHexColor(@"#cbcbcb");
    self.line.frame = CGRectMake(0, 40, CoreWidth, 0.5);
    [self.duifangAccountView addSubview:_line];
    
    self.qinMiFuLabel = [TTTAttributedLabel new];
    self.qinMiFuLabel.font = [UIFont systemFontOfSize:14];
    self.qinMiFuLabel.textColor = DeepColor;
    self.qinMiFuLabel.text = @"亲密付";
    [self.duifangAccountView addSubview:_qinMiFuLabel];
    
    
    self.switchOn = [UISwitch new];
    self.switchOn.on = YES;
    self.switchOn.onTintColor = KHexColor(@"#2e408a");
    [self.switchOn addTarget:self action:@selector(switchOnClick:) forControlEvents:UIControlEventValueChanged];
    [self.duifangAccountView addSubview:_switchOn];
    
    self.meiYueEDuLabel = [TTTAttributedLabel new];
    self.meiYueEDuLabel.font = [UIFont systemFontOfSize:14];
    self.meiYueEDuLabel.textColor = DeepColor;
    self.meiYueEDuLabel.text = @"每月额度";
    [self.duifangAccountView addSubview:_meiYueEDuLabel];
    
    
    
    self.meiYueEduTF = [[UITextField alloc] init];
    self.meiYueEduTF.placeholder = @"1000";
    self.meiYueEduTF.font = KFontSize(14);
    self.meiYueEduTF.textColor = DeepColor;
    self.meiYueEduTF.textAlignment = NSTextAlignmentLeft;
    [self.duifangAccountView addSubview:_meiYueEduTF];
    
    self.jieChuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.jieChuButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [self.jieChuButton setTitle:@"╳" forState:UIControlStateNormal];
    [self.jieChuButton setTitleColor:KHexColor(@"#2e408a") forState:UIControlStateNormal];
    [self.jieChuButton addTarget:self action:@selector(jieChuButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.duifangAccountView addSubview:_jieChuButton];
    
    
    self.kuangButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.kuangButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [self.kuangButton setImage:[UIImage imageNamed:@"shiping_kuang"] forState:UIControlStateNormal];
    [self.kuangButton addTarget:self action:@selector(kuangButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_kuangButton];
    
    
    self.protocolLabel = [TTTAttributedLabel new];
    self.protocolLabel.font = KFontSize(12);
    self.protocolLabel.textColor = DeepColor;
    [self.view addSubview:_protocolLabel];
    
    [self.protocolLabel setText:@"同意" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        
        NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"《用户协议》"
                                                                   attributes:@{NSForegroundColorAttributeName : KHexColor(@"#2e408a"),
                                                                                NSFontAttributeName:KFontSize(12)}];
        [mutableAttributedString appendAttributedString:yuan];
        return mutableAttributedString;
    }];

    
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
    
    
    
    
    [_qinMiFuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.duifangAccountView.mas_left).offset(20);
        make.top.equalTo(self.duifangAccountView.mas_top).offset(13);
        make.width.equalTo(self.qinMiFuLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    [_switchOn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.qinMiFuLabel.mas_centerY).offset(0);
        make.right.equalTo(self.duifangAccountView.mas_right).offset(-20);
        make.width.equalTo(40);
        make.height.equalTo(28);
    }];

    
    [_meiYueEDuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.duifangAccountView.mas_left).offset(20);
        make.bottom.equalTo(self.duifangAccountView.mas_bottom).offset(-13);
        make.width.equalTo(60);
        make.height.equalTo(14);
    }];
    
    
    [_meiYueEduTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.meiYueEDuLabel.mas_centerY).offset(0);
        make.left.equalTo(self.meiYueEDuLabel.mas_right).offset(20);
        make.right.equalTo(self.duifangAccountView.mas_right).offset(-150);
        make.height.equalTo(30);
    }];
    [_jieChuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.meiYueEDuLabel.mas_centerY).offset(0);
        make.right.equalTo(self.duifangAccountView.mas_right).offset(-20);
        make.width.equalTo(40);
        make.height.equalTo(40);
    }];
    
    [_kuangButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.qinMiFuLabel.mas_left).offset(0);
        make.top.equalTo(self.duifangAccountView.mas_bottom).offset(10);
        make.width.equalTo(20);
        make.height.equalTo(20);
    }];

    
    
    [_protocolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.kuangButton.mas_centerY).offset(0);
        make.left.equalTo(self.kuangButton.mas_right).offset(0);
        make.width.equalTo(self.view.mas_width);
        make.height.equalTo(14);
    }];
    
  
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.protocolLabel.mas_bottom).offset(20);
        make.left.equalTo(self.duifangAccountView.mas_left).offset(20);
        make.right.equalTo(self.duifangAccountView.mas_right).offset(-20);
        make.height.equalTo(40);
    }];
    
    
  }
@end
