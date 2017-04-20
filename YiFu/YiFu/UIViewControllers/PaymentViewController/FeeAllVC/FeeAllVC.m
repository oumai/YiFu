//
//  FeeAllVC.m
//  YiFu
//
//  Created by Michael on 16/3/12.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "FeeAllVC.h"
#import "JiaTingVC.h"
#import "PlaceholderTextView.h"
#import "PayDetailOrderView.h"
#import "BankCardVC.h"
@interface FeeAllVC()
@property (nonatomic, strong) UIView                *firstWhiteView;
@property (nonatomic, strong) UIView                *secondWhiteView;
@property (nonatomic, strong) UIView                *firstLine;
@property (nonatomic, strong) UIView                *secondLine;
@property (nonatomic, strong) UIImageView           *feeImage;
@property (nonatomic, strong) TTTAttributedLabel    *feeLabel;
@property (nonatomic, strong) TTTAttributedLabel    *homeLabel;
@property (nonatomic, strong) TTTAttributedLabel    *titlePayUnitLabel;
@property (nonatomic, strong) TTTAttributedLabel    *payUnitLabel;
@property (nonatomic, strong) TTTAttributedLabel    *numberLabel;

@property (nonatomic, strong) PlaceholderTextView   *numberTextView;
@property (nonatomic, strong) TTTAttributedLabel    *myHomeLabel;  //我家
@property (nonatomic, strong) UIImageView           *myHomeImage;
@property (nonatomic, strong) UIButton              *myHomeButton;
@property (nonatomic, strong) UIView                *footerView;
@property (nonatomic, strong) UIButton              *nextButton;

@property (nonatomic, strong) PayDetailOrderView    *payDetailView;
@property (nonatomic, assign) BOOL isPresented;
@end
@implementation FeeAllVC
#pragma mark ------------------------------------------------------------------AFNetworking-------------------------------------------------
- (void)requestData
{
   
    [ASLoadingView showActivity:self.view];
    NSDictionary *jsonDic = @{@"auid":@1,
                              @"user_key":@"745d0f2263ccb8f3ea0fb93218772d5b",
                              @"territory_id":@"02880eb5353f7cb0153546142f0000b",
                              @"pay_main_id":@1,
                              @"order_use_code":@1,
                              @"order_money":@100
                              };
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [sessionManager GET:YiFuUrl(@"yf/yf_main/app_main") parameters:jsonDic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [ASLoadingView hidenActivity:self.view];
        
        k_yjHUD(@"创建缴费订单成功", self.view);
        
        if (_isPresented == NO) {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.1];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDidStopSelector:@selector(animationUp)];
            [UIView commitAnimations];
        }
        else
        {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.1];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDidStopSelector:@selector(animationedDown)];
            [UIView commitAnimations];
        }

        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
    }];
    
}

- (void)animationUp
{
    self.tabBarController.tabBar.hidden = YES;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];
    self.payDetailView.frame = CGRectMake(0, 0, CoreWidth, CoreHeight);
    [UIView commitAnimations];

    _isPresented = YES;
    
}
- (void)animationedDown
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.payDetailView.frame = CGRectMake(0, CoreHeight, CoreWidth, CoreHeight);
    [UIView commitAnimations];
    _isPresented = NO;
    
}

- (void)makePayDetailOrderView
{
    self.payDetailView = [PayDetailOrderView new];
    self.payDetailView.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.4];
    self.payDetailView.frame = CGRectMake(0, CoreHeight, CoreWidth, CoreHeight);
    [self.view addSubview:_payDetailView];
    
    
    FeeAllVC *safeSelf = self;
    [_payDetailView setDownBlock:^{
        [safeSelf animationedDown];
    }];
    
    
    [_payDetailView setChooseBankCardBlock:^{
        
        BankCardVC *ban = [BankCardVC new];
        [safeSelf.navigationController pushViewController:ban animated:YES];
    }];
}
- (void)nextButtonClick:(UIButton *)button
{
    //[self requestData];
    
}
- (void)myHomeButtonClick:(UIButton *)button
{
    JiaTingVC *jia = [JiaTingVC new];
    [self.navigationController pushViewController:jia animated:YES];
}
- (void)inputTextChanged:(NSNotification *)notification {
    
    UITextField *textField = notification.object;
    NSString *inputText = textField.text;
    self.nextButton.enabled = [inputText isValid];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"新增缴费账户";
    self.view.backgroundColor = KHexColor(@"#f2f2f2");
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.isPresented = NO;
   
    
    [self makeUI];
    [self makePayDetailOrderView];
}
- (void)makeUI
{
    self.firstWhiteView = [UIView new];
    self.firstWhiteView.backgroundColor = KHexColor(@"#ffffff");
    self.firstWhiteView.frame = CGRectMake(0, 64, CoreWidth, 100);
    [self.view addSubview:_firstWhiteView];
    
    self.secondWhiteView = [UIView new];
    self.secondWhiteView.backgroundColor = KHexColor(@"#ffffff");
    self.secondWhiteView.frame = CGRectMake(0, 64+100+20, CoreWidth, 100);
    [self.view addSubview:_secondWhiteView];
    
    self.firstLine = [UIView new];
    self.firstLine.backgroundColor = KHexColor(@"#c6c6c6");
    self.firstLine.frame = CGRectMake(10, 50, CoreWidth, 0.5);
    [self.firstWhiteView addSubview:_firstLine];
    
    self.secondLine = [UIView new];
    self.secondLine.backgroundColor = KHexColor(@"#c6c6c6");
    self.secondLine.frame = CGRectMake(10, 50, CoreWidth, 0.5);
    [self.secondWhiteView addSubview:_secondLine];
    
    
    self.feeImage = [UIImageView new];
    self.feeImage.image = [UIImage imageNamed:self.feeInsteger == 0 ?  @"shuifei" : self.feeInsteger == 1 ? @"nuanqifei" : self.feeInsteger == 2 ? @"dianfei" : @"meiqifei"];
    [self.firstWhiteView addSubview:_feeImage];
    
    
    self.feeLabel = [TTTAttributedLabel new];
    self.feeLabel.font = [UIFont systemFontOfSize:14];
    self.feeLabel.textColor = KHexColor(@"#333333");
    self.feeLabel.text = [NSString stringWithFormat:@"%@缴费",self.feeInsteger == 0 ?  @"水费" : self.feeInsteger == 1 ? @"暖气费" : self.feeInsteger == 2 ? @"电费" : @"煤气费"];
    [self.firstWhiteView addSubview:_feeLabel];
    
    
    self.homeLabel = [TTTAttributedLabel new];
    self.homeLabel.font = [UIFont systemFontOfSize:14];
    self.homeLabel.textColor = KHexColor(@"#333333");
    self.homeLabel.text = [NSString stringWithFormat:@"家庭"];
    [self.firstWhiteView addSubview:_homeLabel];
    
    self.myHomeImage = [UIImageView new];
    self.myHomeImage.image = [UIImage imageNamed:@"arrows"];
    [self.firstWhiteView addSubview:_myHomeImage];
    
    self.myHomeLabel = [TTTAttributedLabel new];
    self.myHomeLabel.font = [UIFont systemFontOfSize:14];
    self.myHomeLabel.textColor = LightColor;
    self.myHomeLabel.text = [NSString stringWithFormat:@"我家"];
    [self.firstWhiteView addSubview:_myHomeLabel];
    
    
    self.myHomeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.myHomeButton addTarget:self action:@selector(myHomeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.firstWhiteView addSubview:_myHomeButton];
    
    
    
    self.titlePayUnitLabel = [TTTAttributedLabel new];    /////第二个白块
    self.titlePayUnitLabel.font = [UIFont systemFontOfSize:14];
    self.titlePayUnitLabel.textColor = KHexColor(@"#333333");
    self.titlePayUnitLabel.text = [NSString stringWithFormat:@"缴费单位"];
    [self.secondWhiteView addSubview:_titlePayUnitLabel];
    
    
    self.payUnitLabel = [TTTAttributedLabel new];    /////第二个白块
    self.payUnitLabel.font = [UIFont systemFontOfSize:14];
    self.payUnitLabel.textColor = LightColor;
    self.payUnitLabel.text = [NSString stringWithFormat:@"深圳供电局"];
    [self.secondWhiteView addSubview:_payUnitLabel];
    
    self.numberLabel = [TTTAttributedLabel new];
    self.numberLabel.font = [UIFont systemFontOfSize:14];
    self.numberLabel.textColor = KHexColor(@"#333333");
    self.numberLabel.text = [NSString stringWithFormat:@"用户编号"];
    [self.secondWhiteView addSubview:_numberLabel];
    
    
    self.numberTextView = [[PlaceholderTextView alloc]initWithFrame:CGRectMake(100, 60, CoreWidth-150, 30)];
    self.numberTextView.placeholder =  @"查看纸质订单或拨95598";
    self.numberTextView.font = KFontSize(14);
    [self.secondWhiteView addSubview:_numberTextView];
    
    
    
    
    
    self.nextButton = [UIButton ButtonWithBorderTitle:@"下一步"
                                     titleNormalColor:KHexColor(@"#ffffff")
                               titleHightlightedColor:KHexColor(@"#ffffff")
                                      backgroundColor:KHexColor(@"#2e408a")
                           highlightedBackgroundColor:KHexColor(@"#2e408a")
                                            titleSize:17
                                                frame:CGRectZero
                                                  tag:0
                                               target:self
                                               action:@selector(nextButtonClick:)];
    
    [self.nextButton setBackgroundImage:[UIImage createImageWithColor:[UIColor grayColor]] forState:UIControlStateDisabled];
    self.nextButton.enabled = NO;
    self.nextButton.layer.cornerRadius = 15.0f;
    self.nextButton.layer.masksToBounds = YES;
    [self.view addSubview:_nextButton];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(inputTextChanged:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self.numberTextView];
    
    [_feeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.firstWhiteView.mas_centerY).offset(-25);
        make.left.equalTo(self.firstWhiteView.mas_left).offset(15);
        make.width.equalTo(34);
        make.height.equalTo(34);
    }];
    [_feeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.feeImage.mas_centerY).offset(0);
        make.left.equalTo(self.feeImage.mas_right).offset(15);
        make.width.equalTo(self.feeLabel.mas_width);
        make.height.equalTo(14);
    }];
    [_homeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.firstLine.mas_centerY).offset(25);
        make.left.equalTo(self.firstWhiteView.mas_left).offset(15);
        make.width.equalTo(self.homeLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    [_myHomeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.firstWhiteView.mas_bottom).offset(0);
        make.left.equalTo(self.firstWhiteView.mas_left).offset(0);
        make.right.equalTo(self.firstWhiteView.mas_right).offset(0);
        make.height.equalTo(50);
    }];
    
    [_myHomeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.firstLine.mas_centerY).offset(25);
        make.right.equalTo(self.firstWhiteView.mas_right).offset(-10);
        make.width.equalTo(17/2);
        make.height.equalTo(29/2);
    }];
    
    [_myHomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.firstLine.mas_centerY).offset(25);
        make.right.equalTo(self.myHomeImage.mas_right).offset(-15);
        make.width.equalTo(self.myHomeLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    
    [_titlePayUnitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.secondWhiteView.mas_centerY).offset(-25);
        make.left.equalTo(self.secondWhiteView.mas_left).offset(15);
        make.width.equalTo(self.titlePayUnitLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    [_payUnitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.secondWhiteView.mas_centerY).offset(-25);
        make.right.equalTo(self.secondWhiteView.mas_right).offset(-15);
        make.width.equalTo(self.titlePayUnitLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.secondWhiteView.mas_centerY).offset(25);
        make.left.equalTo(self.secondWhiteView.mas_left).offset(15);
        make.width.equalTo(self.numberLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.secondWhiteView.mas_bottom).offset(50);
        make.centerX.equalTo(self.secondWhiteView.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth*3/4);
        make.height.equalTo(40);
    }];

}
@end
