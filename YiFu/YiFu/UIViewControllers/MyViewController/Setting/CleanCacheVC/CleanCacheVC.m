//
//  CleanCacheVC.m
//  YiFu
//
//  Created by Michael on 16/3/8.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "CleanCacheVC.h"

@interface CleanCacheVC ()
@property (nonatomic, strong) UIView      *fontView;
@property (nonatomic, strong) UIImageView *rubbishImage;
@property (nonatomic, strong) UIButton    *cleanButton;
@end

@implementation CleanCacheVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.tabBarController.tabBar.hidden = YES;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = KHexColor(@"#f2f2f2");
    self.title = @"清除缓存";
    self.fontView = [UIView new];
    self.fontView.backgroundColor = [UIColor whiteColor];
    self.fontView.frame = CGRectMake(0, 64, CoreWidth, CoreWidth);
    [self.view addSubview:_fontView];
    
    self.rubbishImage = [UIImageView new];
    self.rubbishImage.contentMode = UIViewContentModeScaleAspectFit;
    self.rubbishImage.image = [UIImage imageNamed:@"clean_end"];
    [self.fontView addSubview:_rubbishImage];
    
    
    self.cleanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cleanButton.layer.cornerRadius = 3;
    self.cleanButton.layer.masksToBounds = YES;
    self.cleanButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.cleanButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.cleanButton setTitle:@"清理缓存" forState:UIControlStateNormal];
    [self.cleanButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.cleanButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#2e408a")] forState:UIControlStateNormal];
    [self.cleanButton addTarget:self action:@selector(cleanButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_cleanButton];
    
    [_rubbishImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.fontView.mas_centerY).offset(0);
        make.centerX.equalTo(self.fontView.mas_centerX).offset(0);
        make.width.equalTo(240);
        make.height.equalTo(240);
    }];

    
    [_cleanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fontView.mas_bottom).offset(50);
        make.centerX.equalTo(self.fontView.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth*3/4);
        make.height.equalTo(40);
    }];

}
- (void)cleanButtonClick:(UIButton *)button
{
    self.rubbishImage.image = [UIImage imageNamed:@"clean_ing"];
    [self.cleanButton setTitleColor:KHexColor(@"#333333") forState:UIControlStateNormal];
    [self.cleanButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#c3c3c3")] forState:UIControlStateNormal];
}
@end
