//
//  RegistVC.m
//  YiFu
//
//  Created by Michael on 16/3/16.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------V-------------------------------------------*/
@interface LoginCustomCell : UICollectionViewCell


@end



@interface LoginCustomCell ()

@property (nonatomic, strong) UIImageView *bgImage;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@end

@implementation LoginCustomCell


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        self.bgImage = [UIImageView new];
        self.bgImage.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_bgImage];
        
        
        
        
        [_bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(-10);
            make.width.equalTo(64/2);
            make.height.equalTo(104/2);
        }];
        
    }
    return self;
}


@end
#import "LoginVC.h"
#import "RegistVC.h"
#import "ImproveInfomationVC.h"
#import "FindPasswordVC.h"
#import "UICollectionViewWaterfallLayout.h"
static NSString *identifier = @"RegistCustomCell";
@interface LoginVC()<UICollectionViewDelegateWaterfallLayout,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UIView                *line;
@property (nonatomic, strong) UIView                *line2;
@property (nonatomic, strong) UIImageView           *numberImage;
@property (nonatomic, strong) UIImageView           *passwordImage;
@property (nonatomic, strong) UITextField           *setUpNumberTF;
@property (nonatomic, strong) UITextField           *setUpPasswordTF;
@property (nonatomic, strong) UIButton              *nextButton;
@property (nonatomic, strong) UIButton              *registerButton;
@property (nonatomic, strong) UIButton              *findPassWordButton;
@property (nonatomic, strong) TTTAttributedLabel    *socialLabel;
@property (nonatomic, strong) UIView                *leftLine;
@property (nonatomic, strong) UIView                *rightLine;
@property (nonatomic, strong) UICollectionView      *collectionView;
@end
@implementation LoginVC


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

#pragma mark ------------------------------------------------------------------Actions Buttons-------------------------------------------------
- (void)nextButtonClick:(UIButton *)button
{
    [[NSNotificationCenter defaultCenter] postNotificationName:JumpWindow object:nil userInfo:nil];

}
- (void)registerButtonClick:(UIButton *)button
{
    RegistVC *re = [RegistVC new];
    [self.navigationController pushViewController:re animated:YES];
}
- (void)findPassWordButtonClick:(UIButton *)button
{
    FindPasswordVC *find = [FindPasswordVC new];
    [self.navigationController pushViewController:find animated:YES];
}
- (void)tapClick
{
    [self.view endEditing:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:tap];
    [self makeUI];
    UICollectionViewWaterfallLayout *layout = [[UICollectionViewWaterfallLayout alloc] init];
    layout.itemWidth = CoreWidth*2/9;                   //设置每个item 的宽度
    layout.columnCount = 3;                             //设置多少列
    layout.delegate = self;                             //设置delegate 通过协议获得每隔item的高度
    layout.sectionInset = UIEdgeInsetsMake(10, 5, 5, 5);//设置上左下右的间距
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.frame = CGRectMake(30, CoreHeight-180, CoreWidth-60, CoreHeight-280-80);
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    [self.collectionView registerClass:[LoginCustomCell class] forCellWithReuseIdentifier:identifier];
    
}
#pragma mark ------------------------------------------------------------------UITcollectionView-------------------------------------------------
//每个item 的高度
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterfallLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath

{
    return 80;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    LoginCustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSArray *imageArray = @[@"login_weibo",@"login_qq",@"login_weChat"];
    cell.bgImage.image= [UIImage imageNamed:imageArray[indexPath.row]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)makeUI
{
    
    self.line = [UIView new];
    self.line.backgroundColor = KHexColor(@"#b3b3b3");
    self.line.frame = CGRectMake(CoreWidth/6, 160, CoreWidth*2/3, 0.5);
    [self.view addSubview:_line];
    
    self.line2 = [UIView new];
    self.line2.backgroundColor = KHexColor(@"#b3b3b3");
    self.line2.frame = CGRectMake(CoreWidth/6, 210, CoreWidth*2/3, 0.5);
    [self.view addSubview:_line2];
    
    
    
    self.setUpNumberTF = [[UITextField alloc] init];
    self.setUpNumberTF.placeholder = @"请输入您的手机号码";
    self.setUpNumberTF.font = KFontSize(14);
    self.setUpNumberTF.textColor = DeepColor;
    self.setUpNumberTF.keyboardType = UIKeyboardTypePhonePad;
    [self.view addSubview:_setUpNumberTF];
    
    self.setUpPasswordTF = [[UITextField alloc] init];
    self.setUpPasswordTF.placeholder = @"请输入您的密码";
    self.setUpPasswordTF.font = KFontSize(14);
    self.setUpPasswordTF.textColor = DeepColor;
    [self.view addSubview:_setUpPasswordTF];
    
      
    
    self.numberImage = [UIImageView new];
    self.numberImage.image = [UIImage imageNamed:@"login_phoneNumber"];
    [self.view addSubview:_numberImage];
    
    
      
    self.passwordImage = [UIImageView new];
    self.passwordImage.image = [UIImage imageNamed:@"login_password"];
    [self.view addSubview:_passwordImage];
    
    
     
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextButton.layer.cornerRadius = 5;
    self.nextButton.layer.masksToBounds = YES;
    self.nextButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.nextButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.nextButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.nextButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.nextButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#2e408a")] forState:UIControlStateNormal];
    [self.nextButton addTarget:self action:@selector(nextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextButton];
    
  

    
    
    self.registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registerButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.registerButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.registerButton setTitle:@"注册账号" forState:UIControlStateNormal];
    [self.registerButton setImage:[UIImage imageNamed:@"login_register"] forState:UIControlStateNormal];
    [self.registerButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    [self.registerButton setTitleColor:LightColor forState:UIControlStateNormal];
    [self.registerButton addTarget:self action:@selector(registerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
    
   
    
    self.findPassWordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.findPassWordButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.findPassWordButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.findPassWordButton setTitle:@"找回密码" forState:UIControlStateNormal];
    [self.findPassWordButton setImage:[UIImage imageNamed:@"login_findpassword"] forState:UIControlStateNormal];
    [self.findPassWordButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    [self.findPassWordButton setTitleColor:LightColor forState:UIControlStateNormal];
    [self.findPassWordButton addTarget:self action:@selector(findPassWordButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_findPassWordButton];
    
    
    
    self.socialLabel = [TTTAttributedLabel new];
    self.socialLabel.textColor = LightColor;
    self.socialLabel.font = KFontSize(14);
    self.socialLabel.text = @"用社交账号登录";
    [self.view addSubview:_socialLabel];
    
    
    
    self.leftLine = [UIView new];
    self.leftLine.backgroundColor = KHexColor(@"#c6c6c6");
    [self.view addSubview:_leftLine];
    
    
    
    self.rightLine = [UIView new];
    self.rightLine.backgroundColor = KHexColor(@"#c6c6c6");
    [self.view addSubview:_rightLine];
    
    
    
    [_setUpNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.line.mas_bottom).offset(-5);
        make.left.equalTo(self.line.mas_left).offset(20);
        make.right.equalTo(self.line.mas_right).offset(0);
        make.height.equalTo(30);
    }];
    
    
    [_setUpPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.line2.mas_bottom).offset(-5);
        make.left.equalTo(self.line2.mas_left).offset(20);
        make.right.equalTo(self.line2.mas_right).offset(0);
        make.height.equalTo(30);
    }];
    [_numberImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.setUpNumberTF.mas_centerY).offset(0);
        make.left.equalTo(self.line.mas_left).offset(0);
        make.width.equalTo(16);
        make.height.equalTo(13);
    }];
    [_passwordImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.setUpPasswordTF.mas_centerY).offset(0);
        make.left.equalTo(self.line2.mas_left).offset(0);
        make.width.equalTo(16);
        make.height.equalTo(13);
    }];
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line2.mas_bottom).offset(20);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth*2/3);
        make.height.equalTo(40);
    }];
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nextButton.mas_bottom).offset(10);
        make.left.equalTo(self.nextButton.mas_left).offset(0);
        make.width.equalTo(80);
        make.height.equalTo(40);
    }];
    [_findPassWordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nextButton.mas_bottom).offset(10);
        make.right.equalTo(self.nextButton.mas_right).offset(5);
        make.width.equalTo(80);
        make.height.equalTo(40);
    }];
    

    
    
    [_socialLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nextButton.mas_bottom).offset(100);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.equalTo(self.socialLabel.mas_width);
        make.height.equalTo(14);
    }];
    [_leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.socialLabel.mas_centerY).offset(0);
        make.left.equalTo(self.line.mas_left).offset(0);
        make.right.equalTo(self.socialLabel.mas_left).offset(-10);
        make.height.equalTo(0.5);
    }];
    [_rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.socialLabel.mas_centerY).offset(0);
        make.left.equalTo(self.socialLabel.mas_right).offset(10);
        make.right.equalTo(self.line.mas_right).offset(0);
        make.height.equalTo(0.5);
    }];
}
@end
