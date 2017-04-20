//
//  PaymentViewController.m
//  YiFu
//
//  Created by Michael on 16/3/7.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "PaymentViewController.h"
#import "TanKuangView.h"
#import "BankCardVC.h"
#import "FeeAllVC.h"
#import "RemainingSumVC.h"
#import "AddressBookVC.h"
#import "LocationCityVC.h"
@interface PaymentViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIImageView   *bgImage;
@property (nonatomic, strong) UIView        *upView;
@property (nonatomic, strong) UIButton      *locationButton;
@property (nonatomic, strong) UIButton      *addButton;
@property (nonatomic, strong) UIButton      *addFriendsButton;

@property (nonatomic, strong) UIButton      *yuEButton;
@property (nonatomic, strong) UIButton      *scanButton;
@property (nonatomic, strong) UIButton      *bankCardButton;
@property (nonatomic, strong) UILabel       *yuELabel;
@property (nonatomic, strong) UILabel       *scanLabel;
@property (nonatomic, strong) UILabel       *banCardLabel;
@property (nonatomic, strong) UIImageView   *houseImage;

@property (nonatomic, strong) UIButton      *feeButton;   ///费用
@property (nonatomic, strong) UIButton      *nuanqiButton;
@property (nonatomic, strong) UIButton      *dianButton;
@property (nonatomic, strong) UIButton      *meiqiButton;
@property (nonatomic, strong) UILabel       *feeLabel;
@property (nonatomic, strong) UILabel       *nuanqiLabel;
@property (nonatomic, strong) UILabel       *dianLabel;
@property (nonatomic, strong) UILabel       *meiqiLabel;

@property (nonatomic, assign) BOOL          isOpen;
@property (nonatomic, strong) TanKuangView  *tan;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@end

@implementation PaymentViewController

#pragma mark ------------------------------------------------------------------ActionsButton -------------------------------------------------
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    
    
    self.tabBarController.tabBar.hidden = NO;
}
- (void)locationButtonClick:(UIButton *)button
{
    LocationCityVC *vc = [LocationCityVC new];
    [vc setPopBackBlock:^(NSString *string) {
        [self.locationButton setTitle:string forState:UIControlStateNormal];

    }];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)addButtonClick:(UIButton *)button
{
    if (_isOpen == NO) {
        
        self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClickTanRemoveFrom)];
        self.tap.delegate = self;
        
        
        [self.view addGestureRecognizer:_tap];
        self.tan = [[TanKuangView alloc] init];
        self.tan.navigation = self.navigationController;
        self.tan.frame = CGRectMake(CoreWidth-180-10, 54, 180, 164);
        self.tan.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_tan];
        
        __weak PaymentViewController *isOp = self;
        [_tan setTankuangDismissBlock:^(TanKuangView *tan) {
            [tan removeFromSuperview];
            isOp.isOpen = NO;
        }];
        self.isOpen = YES;
    }
    else
    {
        [_tan removeFromSuperview];
        [self.view removeGestureRecognizer:_tap];
        self.isOpen = NO;
    }
}
- (void)tapClickTanRemoveFrom
{
    [_tan removeFromSuperview];
    [self.view removeGestureRecognizer:_tap];
    self.isOpen = NO;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}
- (void)feeButtonClick:(UIButton *)button
{
    
    FeeAllVC *fee = [FeeAllVC new];
    if (button.tag == 100) {
        fee.feeInsteger = 0;
    }
    else if (button.tag == 101)
    {
        fee.feeInsteger = 1;
    }
    else if (button.tag == 102)
    {
        fee.feeInsteger = 2;

    }

    else if (button.tag == 103)
    {
        fee.feeInsteger = 3;

    }
    [self.navigationController pushViewController:fee animated:YES];
    
}
- (void)addFriendsButtonClick:(UIButton *)button
{
//    k_NSlogHUD(@"亿付棒棒哒");
//    k_yjHUD(@"good", self.view);
//    k_SVprogressHUD  [SVProgressHUD show];
//    k_SVprogressDisMiss [SVProgressHUD dismiss];
    
    
    AddressBookVC *add = [AddressBookVC new];
    [self.navigationController pushViewController:add animated:YES];
}
- (void)scanButtonClick:(UIButton *)button
{
    [self scanQRcode];
}
- (void)bankCardButtonClick:(UIButton *)button
{
    BankCardVC *bank = [BankCardVC new];
    [self.navigationController pushViewController:bank animated:YES];
}
- (void)remainingSumButtonClick:(UIButton*)button
{
    RemainingSumVC *remain = [RemainingSumVC new];
    [self.navigationController pushViewController:remain animated:YES];
}
#pragma mark ------------------------------------------------------------------QRcode -------------------------------------------------
/**
 *  是否可以打开设置页面
 *
 *  @return
 */
- (BOOL)canOpenSystemSettingView {
    if (IS_VAILABLE_IOS8) {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}
/**
 *  跳到系统设置页面
 */
- (void)systemSettingView {
    if (IS_VAILABLE_IOS8) {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
}
/*!
 *  扫一扫
 */
- (void)scanQRcode
{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusDenied){
        if (IS_VAILABLE_IOS8) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"相机权限受限" message:@"请在iPhone的\"设置->隐私->相机\"选项中,允许\"自游邦\"访问您的相机." preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if ([self canOpenSystemSettingView]) {
                    [self systemSettingView];
                }
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"相机权限受限" message:@"请在iPhone的\"设置->隐私->相机\"选项中,允许\"自游邦\"访问您的相机." delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil];
            [alert show];
        }
        
        return;
    }
    
    QRCodeController *qrcodeVC = [[QRCodeController alloc] init];
    qrcodeVC.view.alpha = 0;
    [qrcodeVC setDidReceiveBlock:^(NSString *result) {
        NSLog(@"%@", result);
    }];
    AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [del.window.rootViewController addChildViewController:qrcodeVC];
    [del.window.rootViewController.view addSubview:qrcodeVC.view];
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        qrcodeVC.view.alpha = 1;
    } completion:^(BOOL finished) {
    }];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self makeUI];
    //[self requestData];
    
}
#pragma mark ------------------------------------------------------------------AFNetworking-------------------------------------------------
- (void)requestData
{
    
    [ASLoadingView showActivity:self.view];
    NSDictionary *jsonDic = @{@"auid":@1,@"user_key":@"745d0f2263ccb8f3ea0fb93218772d5b",@"territory_id":@"02880eb5353f7cb0153546142f0000b"};
    
    
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [sessionManager GET:YiFuUrl(@"yf/yf_main/app_main") parameters:jsonDic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"responseObject = %@",responseObject);
        [ASLoadingView hidenActivity:self.view];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
    }];

}
#pragma mark ------------------------------------------------------------------MakeUI -------------------------------------------------
- (void)makeUI
{
    self.isOpen = NO;
    self.bgImage = [UIImageView new];
    self.bgImage.image = [UIImage imageNamed:@"bgPay"];
    self.bgImage.frame = self.view.frame;
    [self.view addSubview:_bgImage];
    
    
    self.upView = [UIView new];
    self.upView.backgroundColor = KHexColor(@"#3b3038");
    self.upView.frame = CGRectMake(0, 0, CoreWidth, 180);
    self.upView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.5];
    [self.view addSubview:_upView];
    
    
    self.locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.locationButton.titleLabel.font = KFontSize(14);
    [self.locationButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    [self.locationButton setTitle:@"太原" forState:UIControlStateNormal];
    [self.locationButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.locationButton setImage:[UIImage imageNamed:@"location"] forState:UIControlStateNormal];
    [self.locationButton addTarget:self action:@selector(locationButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.upView addSubview:_locationButton];
    
    
    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addButton setImage:[UIImage imageNamed:@"add_image"] forState:UIControlStateNormal];
    [self.addButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.upView addSubview:_addButton];
    
    
    self.addFriendsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addFriendsButton setImage:[UIImage imageNamed:@"add_friend_image"] forState:UIControlStateNormal];
    [self.addFriendsButton addTarget:self action:@selector(addFriendsButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.upView addSubview:_addFriendsButton];
    
    
    self.yuEButton = [UIButton buttonWithType:UIButtonTypeCustom];    ///余额
    [self.yuEButton setImage:[UIImage imageNamed:@"yuE"] forState:UIControlStateNormal];
    [self.yuEButton addTarget:self action:@selector(remainingSumButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.upView addSubview:_yuEButton];
    
    self.yuELabel = [TTTAttributedLabel new];
    self.yuELabel.textColor = KHexColor(@"#ffffff");
    self.yuELabel.font = [UIFont boldSystemFontOfSize:14];
    self.yuELabel.text = @"余额";
    [self.upView addSubview:_yuELabel];
    
    self.scanButton = [UIButton buttonWithType:UIButtonTypeCustom];    ///扫一扫
    [self.scanButton setImage:[UIImage imageNamed:@"saoyisao"] forState:UIControlStateNormal];
    [self.scanButton addTarget:self action:@selector(scanButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.upView addSubview:_scanButton];
    
    self.scanLabel = [TTTAttributedLabel new];
    self.scanLabel.textColor = KHexColor(@"#ffffff");
    self.scanLabel.font = [UIFont boldSystemFontOfSize:14];
    self.scanLabel.text = @"扫一扫";
    [self.upView addSubview:_scanLabel];
    
    
    self.bankCardButton = [UIButton buttonWithType:UIButtonTypeCustom];    ///银行卡
    [self.bankCardButton setImage:[UIImage imageNamed:@"yinhangka"] forState:UIControlStateNormal];
    [self.bankCardButton addTarget:self action:@selector(bankCardButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.upView addSubview:_bankCardButton];
    
    
    self.banCardLabel = [TTTAttributedLabel new];
    self.banCardLabel.textColor = KHexColor(@"#ffffff");
    self.banCardLabel.font = [UIFont boldSystemFontOfSize:14];
    self.banCardLabel.text = @"银行卡";
    [self.upView addSubview:_banCardLabel];
    
    
    self.houseImage = [UIImageView new];
    self.houseImage.image = [UIImage imageNamed:@"fangzi"];
    [self.view addSubview:_houseImage];
    
    
    self.nuanqiButton = [UIButton buttonWithType:UIButtonTypeCustom];    ///暖气费
    self.nuanqiButton.tag = 101;
    [self.nuanqiButton setImage:[UIImage imageNamed:@"nuanqifei"] forState:UIControlStateNormal];
    [self.nuanqiButton addTarget:self action:@selector(feeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nuanqiButton];
    
    
    
    self.nuanqiLabel = [TTTAttributedLabel new];
    self.nuanqiLabel.textColor = KHexColor(@"#ffffff");
    self.nuanqiLabel.font = [UIFont boldSystemFontOfSize:14];
    self.nuanqiLabel.text = @"暖气费";
    [self.view addSubview:_nuanqiLabel];
    
    
    self.feeButton = [UIButton buttonWithType:UIButtonTypeCustom];    ///水费
    self.feeButton.tag = 100;
    [self.feeButton setImage:[UIImage imageNamed:@"shuifei"] forState:UIControlStateNormal];
    [self.feeButton addTarget:self action:@selector(feeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_feeButton];
    
    
    
    self.feeLabel = [TTTAttributedLabel new];
    self.feeLabel.textColor = KHexColor(@"#ffffff");
    self.feeLabel.font = [UIFont boldSystemFontOfSize:14];
    self.feeLabel.text = @"水费";
    [self.view addSubview:_feeLabel];
    
    
    
    self.dianButton = [UIButton buttonWithType:UIButtonTypeCustom];    ///电费
    self.dianButton.tag = 102;
    [self.dianButton setImage:[UIImage imageNamed:@"dianfei"] forState:UIControlStateNormal];
    [self.dianButton addTarget:self action:@selector(feeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_dianButton];
    
    
    self.dianLabel = [TTTAttributedLabel new];
    self.dianLabel.textColor = KHexColor(@"#ffffff");
    self.dianLabel.font = [UIFont boldSystemFontOfSize:14];
    self.dianLabel.text = @"电费";
    [self.view addSubview:_dianLabel];
    
    
    
    self.meiqiButton = [UIButton buttonWithType:UIButtonTypeCustom];    ///煤气费
    self.meiqiButton.tag = 103;
    [self.meiqiButton setImage:[UIImage imageNamed:@"meiqifei"] forState:UIControlStateNormal];
    [self.meiqiButton addTarget:self action:@selector(feeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_meiqiButton];
    
    
    
    self.meiqiLabel = [TTTAttributedLabel new];
    self.meiqiLabel.textColor = KHexColor(@"#ffffff");
    self.meiqiLabel.font = [UIFont boldSystemFontOfSize:14];
    self.meiqiLabel.text = @"煤气费";
    [self.view addSubview:_meiqiLabel];
    
    [_locationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.upView.mas_top).offset(20);
        make.left.equalTo(self.upView.mas_left).offset(10);
        make.width.equalTo(70);
        make.height.equalTo(30);
    }];
    [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.locationButton.mas_centerY).offset(0);
        make.right.equalTo(self.upView.mas_right).offset(-10);
        make.width.equalTo(40);
        make.height.equalTo(40);
    }];
    [_addFriendsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.upView.mas_top).offset(20);
        make.right.equalTo(self.addButton.mas_left).offset(-10);
        make.width.equalTo(30);
        make.height.equalTo(30);
    }];
    [_yuEButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.upView.mas_top).offset(100);
        make.centerX.equalTo(self.upView.mas_centerX).offset(0);
        make.width.equalTo(50);
        make.height.equalTo(35);
    }];
    [_yuELabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yuEButton.mas_bottom).offset(15);
        make.centerX.equalTo(self.yuEButton.mas_centerX).offset(0);
        make.width.equalTo(self.yuELabel.mas_width);
        make.height.equalTo(14);
    }];
    [_scanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.upView.mas_top).offset(100);
        make.centerX.equalTo(self.upView.mas_centerX).offset(-100);
        make.width.equalTo(50);
        make.height.equalTo(35);
    }];
    [_scanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yuEButton.mas_bottom).offset(15);
        make.centerX.equalTo(self.scanButton.mas_centerX).offset(0);
        make.width.equalTo(self.scanLabel.mas_width);
        make.height.equalTo(14);
    }];
    [_bankCardButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.upView.mas_top).offset(100);
        make.centerX.equalTo(self.upView.mas_centerX).offset(100);
        make.width.equalTo(50);
        make.height.equalTo(35);
    }];
    [_banCardLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yuEButton.mas_bottom).offset(15);
        make.centerX.equalTo(self.bankCardButton.mas_centerX).offset(0);
        make.width.equalTo(self.banCardLabel.mas_width);
        make.height.equalTo(14);
    }];
    [_houseImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.view);
        make.width.equalTo(250);
        make.height.equalTo(196);
    }];
    [_nuanqiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-100);
        make.right.equalTo(self.view.mas_centerX).offset(-(CoreWidth-240)/8);
        make.width.equalTo(60);
        make.height.equalTo(60);
    }];
    [_nuanqiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-85);
        make.centerX.equalTo(self.nuanqiButton.mas_centerX).offset(0);
        make.width.equalTo(self.nuanqiLabel.mas_width);
        make.height.equalTo(14);
    }];
    [_feeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-100);
        make.right.equalTo(self.nuanqiButton.mas_left).offset(-(CoreWidth-240)/4);
        make.width.equalTo(60);
        make.height.equalTo(60);
    }];
    [_feeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-85);
        make.centerX.equalTo(self.feeButton.mas_centerX).offset(0);
        make.width.equalTo(self.feeLabel.mas_width);
        make.height.equalTo(14);
    }];
    [_dianButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-100);
        make.left.equalTo(self.view.mas_centerX).offset((CoreWidth-240)/8);
        make.width.equalTo(60);
        make.height.equalTo(60);
    }];
    [_dianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-85);
        make.centerX.equalTo(self.dianButton.mas_centerX).offset(0);
        make.width.equalTo(self.dianLabel.mas_width);
        make.height.equalTo(14);
    }];
    [_meiqiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-100);
        make.left.equalTo(self.dianButton.mas_right).offset((CoreWidth-240)/4);
        make.width.equalTo(60);
        make.height.equalTo(60);
    }];
    [_meiqiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-85);
        make.centerX.equalTo(self.meiqiButton.mas_centerX).offset(0);
        make.width.equalTo(self.meiqiLabel.mas_width);
        make.height.equalTo(14);
    }];
}
@end
