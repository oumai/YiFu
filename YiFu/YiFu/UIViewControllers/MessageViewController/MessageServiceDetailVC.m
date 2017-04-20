//
//  MessageServiceDetailVC.m
//  YiFu
//
//  Created by Michael on 16/3/19.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "MessageServiceDetailVC.h"

@interface MessageServiceDetailVC ()<UITextFieldDelegate>
@property (nonatomic, strong) UIView        *bottomView;
@property (nonatomic, strong) UIButton      *helpButton;
@property (nonatomic, strong) UIButton      *lingShiButton;
@property (nonatomic, strong) UIButton      *youJiButton;
@property (nonatomic, strong) UIButton      *changeButton;
@property (nonatomic, strong) UIImageView   *arrowUpImage;

@property (nonatomic, strong) UIView        *keyboardView;
@property (nonatomic, strong) UIButton      *KeyboardChangeButton;
@property (nonatomic, strong) UITextField   *textTF;
@property (nonatomic, strong) UIButton      *addButton;
@property (nonatomic, strong) UIButton      *biaoQingButon;
@property (nonatomic, strong) UIButton      *voiceButton;

@end

@implementation MessageServiceDetailVC
#pragma mark ------------------------------------------------------------------ActionButtonClicks-------------------------------------------------
- (void)addButtonClick:(UIButton *)UIButton{
    
}
- (void)biaoQingButonClick:(UIButton *)UIButton{
    
}

- (void)voiceButtonClick:(UIButton *)UIButton{
    
}

- (void)helpButtonClick:(UIButton *)button
{
    if (button.tag == 100) {
        
    }else if (button.tag == 101)
    {
        
    }
    else if (button.tag == 102)
    {
        
    }
    else if (button.tag == 103)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationed)];
        self.bottomView.frame = CGRectMake(0, CoreHeight, CoreWidth, 50);
        [UIView commitAnimations];
    }
}
- (void)animationed
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.keyboardView.frame = CGRectMake(0, CoreHeight-50, CoreWidth, 50);
    [UIView commitAnimations];
}
- (void)animationedKeyboardXia
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.bottomView.frame = CGRectMake(0, CoreHeight-50, CoreWidth, 50);
    [UIView commitAnimations];
}
- (void)KeyboardChangeButtonClick:(UIButton *)button
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationedKeyboardXia)];
    self.keyboardView.frame = CGRectMake(0, CoreHeight, CoreWidth, 50);
    [UIView commitAnimations];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"食材配送";
    self.view.backgroundColor = BackgroundColor;
    [self makeBottomView];
    [self makeKeyBoardView];
    //[self requestData];
}
#pragma mark ------------------------------------------------------------------AFNetworking-------------------------------------------------
- (void)requestData
{
    [ASLoadingView showActivity:self.view];
    NSDictionary *jsonDic = @{@"message_id":@1,};
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [sessionManager GET:YiFuUrl(@"yf/yf_main/message_detail") parameters:jsonDic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [ASLoadingView hidenActivity:self.view];
        
        k_yjHUD(@"我的消息详情列表", self.view);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
    }];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animationedKeyboardXia];
}
- (void)keyboardChange:(NSNotification *)noti
{
    NSValue *value = [noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect rect = [value CGRectValue];
    self.keyboardView.frame = CGRectMake(0, rect.origin.y-50, CoreWidth, 50);
    
}
- (void)makeKeyBoardView
{
    self.keyboardView = [UIView new];
    self.keyboardView.layer.borderWidth = 0.5;
    self.keyboardView.layer.borderColor = KHexColor(@"#c5c5c5").CGColor;
    self.keyboardView.frame = CGRectMake(0, CoreHeight, CoreWidth, 50);
    self.keyboardView.backgroundColor = KHexColor(@"#ffffff");
    [self.view addSubview:_keyboardView];
    
    
    self.KeyboardChangeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.KeyboardChangeButton.layer.borderWidth = 0.5;
    self.KeyboardChangeButton.layer.borderColor = KHexColor(@"#c5c5c5").CGColor;
    self.KeyboardChangeButton.titleLabel.font = KFontSize(14);
    self.KeyboardChangeButton.tag = 103;
    [self.KeyboardChangeButton setTitleColor:DeepColor forState:UIControlStateNormal];
    [self.KeyboardChangeButton setImage:[UIImage imageNamed:@"message_keyboard"] forState:UIControlStateNormal];
    [self.KeyboardChangeButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ffffff")] forState:UIControlStateNormal];
    [self.KeyboardChangeButton addTarget:self action:@selector(KeyboardChangeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboardView addSubview:_KeyboardChangeButton];
    
       
    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addButton setImage:[UIImage imageNamed:@"message_add"] forState:UIControlStateNormal];
    [self.addButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboardView addSubview:_addButton];
    
  
    self.biaoQingButon = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.biaoQingButon setImage:[UIImage imageNamed:@"message_biaoqing"] forState:UIControlStateNormal];
    [self.biaoQingButon addTarget:self action:@selector(biaoQingButonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboardView addSubview:_biaoQingButon];
    
      
    self.voiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.voiceButton setImage:[UIImage imageNamed:@"message_voice"] forState:UIControlStateNormal];
    [self.voiceButton addTarget:self action:@selector(voiceButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.keyboardView addSubview:_voiceButton];
    
 

    self.textTF = [UITextField new];
    self.textTF.layer.cornerRadius = 6;
    self.textTF.layer.masksToBounds = YES;
    self.textTF.layer.borderColor = KHexColor(@"#bbbbbb").CGColor;
    self.textTF.layer.borderWidth = 0.5;
    self.textTF.placeholder = @"回复谁";
    self.textTF.returnKeyType = UIReturnKeySend;
    self.textTF.delegate = self;
    self.textTF.font = KFontSize(14);
    [self.keyboardView addSubview:_textTF];
    
    [_KeyboardChangeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.keyboardView.mas_centerY).offset(0);
        make.left.equalTo(self.KeyboardChangeButton.mas_left).offset(0);
        make.width.equalTo(CoreWidth/7);
        make.height.equalTo(50);
    }];
    [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.keyboardView.mas_centerY).offset(0);
        make.right.equalTo(self.keyboardView.mas_right).offset(-10);
        make.width.equalTo(29);
        make.height.equalTo(29);
    }];
    [_biaoQingButon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.keyboardView.mas_centerY).offset(0);
        make.right.equalTo(self.addButton.mas_left).offset(-10);
        make.width.equalTo(29);
        make.height.equalTo(29);
    }];
    [_voiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.keyboardView.mas_centerY).offset(0);
        make.left.equalTo(self.keyboardView.mas_left).offset(CoreWidth/7+10);
        make.width.equalTo(29);
        make.height.equalTo(29);
    }];
    [_textTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.keyboardView.mas_centerY).offset(0);
        make.left.equalTo(self.voiceButton.mas_right).offset(10);
        make.right.equalTo(self.biaoQingButon.mas_left).offset(-10);
        make.height.equalTo(32);
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
- (void)makeBottomView
{
    self.bottomView = [UIView new];
    self.bottomView.frame = CGRectMake(0, CoreHeight-50, CoreWidth, 50);
    self.bottomView.backgroundColor = KHexColor(@"#ffffff");
    [self.view addSubview:_bottomView];
    
    self.helpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.helpButton.layer.borderWidth = 0.5;
    self.helpButton.layer.borderColor = KHexColor(@"#c5c5c5").CGColor;
    self.helpButton.titleLabel.font = KFontSize(14);
    self.helpButton.tag = 100;
    [self.helpButton setTitle:@"帮助" forState:UIControlStateNormal];
    [self.helpButton setTitleColor:DeepColor forState:UIControlStateNormal];
    [self.helpButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ffffff")] forState:UIControlStateNormal];
    [self.helpButton addTarget:self action:@selector(helpButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:_helpButton];
    
    
    self.lingShiButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.lingShiButton.layer.borderWidth = 0.5;
    self.lingShiButton.layer.borderColor = KHexColor(@"#c5c5c5").CGColor;
    self.lingShiButton.titleLabel.font = KFontSize(14);
    self.lingShiButton.tag = 101;
    [self.lingShiButton setTitle:@"零食天地" forState:UIControlStateNormal];
    [self.lingShiButton setTitleColor:DeepColor forState:UIControlStateNormal];
    [self.lingShiButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ffffff")] forState:UIControlStateNormal];
    [self.lingShiButton addTarget:self action:@selector(helpButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:_lingShiButton];
    
     
    
    self.youJiButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.youJiButton.layer.borderWidth = 0.5;
    self.youJiButton.layer.borderColor = KHexColor(@"#c5c5c5").CGColor;
    self.youJiButton.titleLabel.font = KFontSize(14);
    self.youJiButton.tag = 102;
    [self.youJiButton setTitle:@"有机生鲜" forState:UIControlStateNormal];
    [self.youJiButton setTitleColor:DeepColor forState:UIControlStateNormal];
    [self.youJiButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ffffff")] forState:UIControlStateNormal];
    [self.youJiButton addTarget:self action:@selector(helpButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:_youJiButton];
    
      
    
    self.changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.changeButton.layer.borderWidth = 0.5;
    self.changeButton.layer.borderColor = KHexColor(@"#c5c5c5").CGColor;
    self.changeButton.titleLabel.font = KFontSize(14);
    self.changeButton.tag = 103;
    [self.changeButton setTitleColor:DeepColor forState:UIControlStateNormal];
    [self.changeButton setImage:[UIImage imageNamed:@"message_keyboard"] forState:UIControlStateNormal];
    [self.changeButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ffffff")] forState:UIControlStateNormal];
    [self.changeButton addTarget:self action:@selector(helpButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:_changeButton];
    
    self.arrowUpImage = [UIImageView new];
    self.arrowUpImage.image = [UIImage imageNamed:@"message_arrow_up"];
    [self.changeButton addSubview:_arrowUpImage];
    
    [_arrowUpImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.changeButton.mas_centerX).offset(0);
        make.top.equalTo(self.changeButton.mas_top).offset(10);
        make.width.equalTo(5.5);
        make.height.equalTo(3);
    }];
    
    [_helpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomView.mas_centerY).offset(0);
        make.right.equalTo(self.bottomView.mas_right).offset(0);
        make.width.equalTo(CoreWidth*2/7);
        make.height.equalTo(50);
    }];
    
    [_lingShiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomView.mas_centerY).offset(0);
        make.right.equalTo(self.helpButton.mas_left).offset(0);
        make.width.equalTo(CoreWidth*2/7);
        make.height.equalTo(50);
    }];
    [_youJiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomView.mas_centerY).offset(0);
        make.right.equalTo(self.lingShiButton.mas_left).offset(0);
        make.width.equalTo(CoreWidth*2/7);
        make.height.equalTo(50);
    }];
    [_changeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomView.mas_centerY).offset(0);
        make.right.equalTo(self.youJiButton.mas_left).offset(0);
        make.width.equalTo(CoreWidth/7);
        make.height.equalTo(50);
    }];
}
@end
