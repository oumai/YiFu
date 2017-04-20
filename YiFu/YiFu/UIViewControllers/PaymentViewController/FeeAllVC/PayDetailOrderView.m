//
//  PayDetailView.m
//  YiFu
//
//  Created by Michael on 16/4/6.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "PayDetailOrderView.h"
@interface PayDetailOrderView ()

@property (nonatomic, strong) UIView        *bgView;
@property (nonatomic, strong) UIView        *horizonalLine;
@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UILabel       *nameLabel;
@property (nonatomic, strong) UILabel       *nameLabel1;
@property (nonatomic, strong) UILabel       *detailLabel;
@property (nonatomic, strong) UILabel       *detailLabel1;
@property (nonatomic, strong) UILabel       *xuFuKuanTitleLabel;
@property (nonatomic, strong) UILabel       *xuFuKuanLabel;
@property (nonatomic, strong) UIButton      *xButton;
@property (nonatomic, strong) UIButton      *sureButton;
@property (nonatomic, strong) UIImageView   *arrowImage;
@property (nonatomic, strong) UIButton      *chooseBankCardButton;
@end
@implementation PayDetailOrderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        
       
        self.frame = frame;
        self.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.4];
        
        self.bgView = [UIView new];
        self.bgView.backgroundColor = [UIColor whiteColor];
        self.bgView.frame = CGRectMake(0, CoreHeight/2, CoreWidth, CoreHeight/2);
        [self addSubview:_bgView];
        
        for (int i = 0; i<3; i++) {
            self.horizonalLine = [UIView new];
            self.horizonalLine.backgroundColor = LineColor;
            self.horizonalLine.frame = CGRectMake(0, 50*(i+1), CoreWidth, 0.5);
            [self.bgView addSubview:_horizonalLine];
        }
        
        self.titleLabel = [UILabel new];
        self.titleLabel.textColor = DeepColor;
        self.titleLabel.font = KFontSize(16);
        self.titleLabel.text = @"付款详情";
        [self.bgView addSubview:_titleLabel];
        
            
        self.xButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.xButton setTitle:@"╳" forState:UIControlStateNormal];
        [self.xButton setTitleColor:LightColor forState:UIControlStateNormal];
        [self.xButton addTarget:self action:@selector(xButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgView addSubview:_xButton];
        
              
        self.nameLabel = [UILabel new];
        self.nameLabel.textColor = LightColor;
        self.nameLabel.font = KFontSize(14);
        self.nameLabel.text = @"订单信息";
        [self.bgView addSubview:_nameLabel];
        
              
        self.nameLabel1 = [UILabel new];
        self.nameLabel1.textColor = LightColor;
        self.nameLabel1.font = KFontSize(14);
        self.nameLabel1.text = @"付款方式";
        [self.bgView addSubview:_nameLabel1];
        
             
        self.detailLabel = [UILabel new];
        self.detailLabel.textColor = LightColor;
        self.detailLabel.font = KFontSize(14);
        self.detailLabel.text = @"深圳市自来水有限公司";
        [self.bgView addSubview:_detailLabel];
        
              
        self.arrowImage = [UIImageView new];
        self.arrowImage.image = [UIImage imageNamed:@"arrows"];
        [self.bgView addSubview:_arrowImage];
        
        
              
        self.detailLabel1 = [UILabel new];
        self.detailLabel1.textColor = LightColor;
        self.detailLabel1.font = KFontSize(14);
        self.detailLabel1.text = [NSString stringWithFormat:@"%@   %@",@"中国建设银行",@"(236)"];
        [self.bgView addSubview:_detailLabel1];
        
        self.chooseBankCardButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.chooseBankCardButton addTarget:self action:@selector(chooseBankCardButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgView addSubview:_chooseBankCardButton];
           
        
        self.xuFuKuanTitleLabel = [UILabel new];
        self.xuFuKuanTitleLabel.textColor = DeepColor;
        self.xuFuKuanTitleLabel.font = KFontSize(16);
        self.xuFuKuanTitleLabel.frame = CGRectMake(100, 160, 100, 100);
        self.xuFuKuanTitleLabel.text = @"需付款";
        [self.bgView addSubview:_xuFuKuanTitleLabel];
        
             
        
        self.xuFuKuanLabel = [UILabel new];
        self.xuFuKuanLabel.textColor = DeepColor;
        self.xuFuKuanLabel.font = KFontSize(18);
        self.xuFuKuanLabel.text = @"10.00";
        [self.bgView addSubview:_xuFuKuanLabel];
        
        self.sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.sureButton.layer.cornerRadius = 5;
        self.sureButton.layer.masksToBounds = YES;
        self.sureButton.titleLabel.font = [UIFont systemFontOfSize:14];
        self.sureButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [self.sureButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
        [self.sureButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#2e408a")] forState:UIControlStateNormal];
        [self.sureButton addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgView addSubview:_sureButton];
        
        
        [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.xuFuKuanLabel.mas_bottom).offset(30);
            make.left.equalTo(self.bgView.mas_left).offset(30);
            make.right.equalTo(self.bgView.mas_right).offset(-30);
            make.height.equalTo(40);
        }];

        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgView.mas_top).offset((50-16)/2);
            make.centerX.equalTo(self.bgView);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(16);
        }];
        [_xButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bgView.mas_left).offset(10);
            make.centerY.equalTo(self.titleLabel.mas_centerY).offset(0);
            make.width.equalTo(30);
            make.height.equalTo(30);
        }];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgView.mas_top).offset((50-14)/2+50);
            make.left.equalTo(self.bgView.mas_left).offset(20);
            make.width.equalTo(self.nameLabel.mas_width);
            make.height.equalTo(14);
        }];
        [_nameLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgView.mas_top).offset((50-14)/2+100);
            make.left.equalTo(self.bgView.mas_left).offset(20);
            make.width.equalTo(self.nameLabel1.mas_width);
            make.height.equalTo(14);
        }];
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLabel.mas_top).offset(0);
            make.right.equalTo(self.bgView.mas_right).offset(-20);
            make.width.equalTo(self.detailLabel.mas_width);
            make.height.equalTo(14);
        }];
        [_arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLabel1.mas_centerY);
            make.right.equalTo(self.bgView.mas_right).offset(-10);
            make.width.equalTo(17/2);
            make.height.equalTo(29/2);
        }];
        
        [_detailLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLabel1.mas_top).offset(0);
            make.right.equalTo(self.arrowImage.mas_left).offset(-10);
            make.width.equalTo(self.detailLabel.mas_width);
            make.height.equalTo(14);
        }];
        [_chooseBankCardButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgView.mas_top).offset(100);
            make.left.equalTo(self.bgView.mas_left).offset(00);
            make.width.equalTo(CoreWidth);
            make.height.equalTo(50);
        }];

        [_xuFuKuanTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgView.mas_top).offset(170);
            make.left.equalTo(self.bgView.mas_left).offset(20);
            make.width.equalTo(self.xuFuKuanTitleLabel.mas_width);
            make.height.equalTo(16);
        }];
        [_xuFuKuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.xuFuKuanTitleLabel.mas_centerY).offset(0);
            make.right.equalTo(self.bgView.mas_right).offset(-20);
            make.width.equalTo(self.xuFuKuanLabel.mas_width);
            make.height.equalTo(18);
        }];

        
    }
    return self;
}
- (void)xButtonClick:(UIButton *)button
{
    if (self.downBlock) {
        self.downBlock();
    }
}
- (void)chooseBankCardButtonClick:(UIButton *)button
{
    if (self.chooseBankCardBlock) {
        self.chooseBankCardBlock();
    }
}
- (void)sureButtonClick:(UIButton *)button
{
    [ASLoadingView showActivity:self];
    NSDictionary *jsonDic = @{@"auid":@1,
                              @"user_key":@"745d0f2263ccb8f3ea0fb93218772d5b",
                              @"pay_order_id":@"123456789",
                              @"pay_money":@100,
                              @"order_use_code":@1,
                              @"pay_type":@0
                              };
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [sessionManager GET:YiFuUrl(@"yf/yf_main/pay_order_pay") parameters:jsonDic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [ASLoadingView hidenActivity:self];
        
        k_yjHUD(@"缴费订单缴费", self);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
    }];

}
@end
