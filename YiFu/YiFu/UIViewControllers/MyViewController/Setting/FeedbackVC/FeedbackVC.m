//
//  FeedbackVC.m
//  YiFu
//
//  Created by Michael on 16/3/8.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "FeedbackVC.h"

@interface FeedbackVC ()
@property (nonatomic ,strong) UITableView   *tableView;
@property (nonatomic ,strong) UIView       *headerView;
@property (nonatomic ,strong) UIView       *oneView;
@property (nonatomic ,strong) UIView       *twoView;
@property (nonatomic ,strong) UIView       *oneLine;
@property (nonatomic ,strong) UIView       *twoLine;
@property (nonatomic ,strong) UILabel      *feedLabel;
@property (nonatomic ,strong) UILabel      *numberLabel;
@property (nonatomic ,strong) UILabel      *limitLabel;
@property (nonatomic ,strong) UITextView   *textView;
@property (nonatomic ,strong) UITextField  *textPhone;
@property (nonatomic ,strong) UIButton     *submitButton;
@end

@implementation FeedbackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    self.title = @"意见反馈";
    [self setRightItem];
    self.navigationItem.rightBarButtonItem.title = @"提交";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CoreWidth, CoreHeight - 64)];
    self.headerView.backgroundColor = KHexColor(@"#ebebeb");
    [self.tableView addSubview:_headerView];
    
    self.oneView = [UIView new];
    self.oneView.backgroundColor = KHexColor(@"#ffffff");
    [_headerView addSubview:_oneView];
    
    self.twoView = [UIView new];
    self.twoView.backgroundColor = KHexColor(@"#ffffff");
    [_headerView addSubview:_twoView];
    
    self.oneLine = [UIView new];
    self.oneLine.backgroundColor = KHexColor(@"#dcdcdc");
    [_oneView addSubview:_oneLine];
    
    self.twoLine = [UIView new];
    self.twoLine.backgroundColor = KHexColor(@"#dcdcdc");
    [_twoView addSubview:_twoLine];
    
    self.feedLabel = [UILabel new];
    self.feedLabel.font = [UIFont systemFontOfSize:14];
    self.feedLabel.textColor = DeepColor;
    self.feedLabel.text = @"您的意见我们认真聆听";
    [_oneView addSubview:_feedLabel];
    
    self.numberLabel = [UILabel new];
    self.numberLabel.font = [UIFont systemFontOfSize:14];
    self.numberLabel.textColor = DeepColor;
    self.numberLabel.text = @"请留下您的联系方式";
    [_twoView addSubview:_numberLabel];
    
    self.textView = [UITextView new];
    [_oneView addSubview:_textView];
    
    self.textPhone = [UITextField new];
    self.textPhone.textColor = DeepColor;
    self.textPhone.keyboardType = UIKeyboardTypeNumberPad;
    self.textPhone.font = [UIFont systemFontOfSize:14];
    self.textPhone.placeholder = @"手机号码";
    [_twoView addSubview:_textPhone];
    
    
    self.limitLabel = [UILabel new];
    self.limitLabel.font = [UIFont systemFontOfSize:14];
    self.limitLabel.textColor = KHexColor(@"#cccccc");
    self.limitLabel.text = @"5-120个字";
    [_oneView addSubview:_limitLabel];
    
    
    self.submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.submitButton.layer.cornerRadius = 3;
    self.submitButton.layer.masksToBounds = YES;
    self.submitButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.submitButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.submitButton setTitle:@"提交" forState:UIControlStateNormal];
    [self.submitButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.submitButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#2e408a")] forState:UIControlStateNormal];
    [self.submitButton addTarget:self action:@selector(submitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:_submitButton];
    
    
    [_submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.twoView.mas_bottom).offset(30);
        make.centerX.equalTo(self.twoView.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth*3/4);
        make.height.equalTo(40);
    }];

    
    
    [_oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(10);
        make.left.right.equalTo(self.headerView);
        make.height.equalTo(122);
        
    }];
    
    [_twoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oneView.mas_bottom).offset(10);
        make.left.right.equalTo(self.headerView);
        make.height.equalTo(75);
        
    }];
    
    [_oneLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oneView.mas_top).offset(33);
        make.left.equalTo(self.oneView.mas_left).offset(10);
        make.right.equalTo(self.oneView);
        make.height.equalTo(0.5);
    }];
    [_twoLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.twoView.mas_top).offset(35);
        make.left.equalTo(self.oneView.mas_left).offset(10);
        make.right.equalTo(self.oneView);
        make.height.equalTo(0.5);
    }];
    
    [_feedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oneView.mas_top).offset(10);
        make.left.equalTo(self.oneView.mas_left).offset(10);
        make.width.equalTo(self.feedLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.twoView.mas_top).offset(10);
        make.left.equalTo(self.twoView.mas_left).offset(10);
        make.width.equalTo(self.feedLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.oneView);
        make.height.equalTo(88);
        
    }];
    
    [_textPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(self.twoView);
        make.left.equalTo(self.twoView.mas_left).offset(10);
        make.height.equalTo(39);
        
    }];
    
    [_limitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.oneView.mas_bottom).offset(-10);
        make.right.equalTo(self.oneView.mas_right).offset(-10);
        make.width.equalTo(self.limitLabel.mas_width);
        make.height.equalTo(14);
        
    }];

}
- (void)submitButtonClick:(UIButton *)button
{
    [ASLoadingView showActivity:self.view];
    NSDictionary *jsonDic = @{@"auid":@1,
                              @"parentid":@"",
                              @"feed_back_title":@"",
                              @"feed_back_content":self.textView.text,
                              @"feed_back_type":@0,
                              @"tel":self.textPhone.text};
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [sessionManager GET:YiFuUrl(@"yf/yf_main/suggestion_submit") parameters:jsonDic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [ASLoadingView hidenActivity:self.view];
        k_NSlogHUD(@"提交意见反馈成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
    }];

}

@end
