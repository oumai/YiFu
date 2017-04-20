//
//  BaseViewController.m
//  YiFu
//
//  Created by Michael on 16/3/11.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController()
@property (nonatomic, strong) UIButton *leftButton;
@end
@implementation BaseViewController

- (void)leftButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    //    dispatch_async(dispatch_get_main_queue(), ^{
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
    //    });
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self setBarLeftItem];
}
- (void)setBarLeftItem
{
    NavigationBarBackgroundColor
    
    NSString * image = @"private_back";
    NSString * hImage = @"private_back";
    UIButton *right = [UIButton buttonWithType:UIButtonTypeCustom];
    right.titleLabel.font = KFontSize(14);
    [right setFrame:CGRectMake(0, 0, 60, 24)];
    [right setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [right setImage:[UIImage imageNamed:hImage] forState:UIControlStateHighlighted];
    right.imageEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 0);
    [right setTitle:@"" forState:UIControlStateNormal];
    right.titleEdgeInsets = UIEdgeInsetsMake(0, -35, 0, 0);
    [right addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:right];
}
- (void)setRightItem
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(rightTitleClick)];
    self.navigationItem.leftBarButtonItem.tintColor = KHexColor(@"#ffffff");
}
- (void)rightTitleClick
{
    
}
- (void)setRightItemImage
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add_image"] style:(UIBarButtonItemStylePlain) target:self action:@selector(rightImageClick)];;
    self.navigationItem.rightBarButtonItem.tintColor = KHexColor(@"#ffffff");
}
- (void)rightImageClick
{
    
}
@end
