//
//  AppLaunchManager.m
//  AppLaunchManager
//
//  Created by Michael on 16/1/19.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "AppLaunchManager.h"

#import "PaymentViewController.h"
#import "ServiceViewController.h"
#import "MessageViewController.h"
#import "MyViewController.h"
#import "RegistVC.h"
#import "LoginVC.h"
@interface AppLaunchManager()<UIScrollViewDelegate>
{
    BOOL isOut;
}

@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) RegistVC           *registerVCQ;
@property (nonatomic, strong) LoginVC            *loginVCQ;
@property (nonatomic, strong) UIWindow           *window;
@property (nonatomic, strong) UIScrollView       *scrollView;
@property (nonatomic, strong) UIPageControl      *pageControl;
@property (nonatomic, strong) UIButton           *loginButton;
@property (nonatomic, strong) UIButton           *registButton;
@end



@implementation AppLaunchManager

+ (instancetype)shareDafaults
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once (&once,^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


- (void)launch
{
    //1设置引导页
    
    isOut =NO;
    self.window = [UIApplication sharedApplication].delegate.window;
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstStart"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstStart"];
        NSLog(@"第一次启动");
         [self makeLaunchView]; //为假表示没有文件，没有进入过主页
    }else{
        NSLog(@"不是第一次启动");
        [self tabBarController];        //为真表示已有文件 曾经进入过主页
        //[self registerV];
        [self loginV];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mainWindowClick) name:JumpWindow object:nil];

    
}
- (RegistVC *)registerV
{

    self.registerVCQ = [RegistVC new];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:_registerVCQ];
    return _registerVCQ;
}

- (LoginVC *)loginV
{
    
    self.loginVCQ = [LoginVC new];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:_loginVCQ];
    return _loginVCQ;
}

- (UITabBarController *)tabBarController
{
    if ( nil == _tabBarController ) {
        
        
        PaymentViewController *pay = [PaymentViewController new];
        pay.title = @"缴费";
        pay.tabBarItem.image = [UIImage imageNamed:@"BarItem_pay"];
        UINavigationController *preNav = [[UINavigationController alloc] initWithRootViewController:pay];
        
        
        ServiceViewController *ser = [ServiceViewController new];
        ser.title = @"服务";
        ser.tabBarItem.image = [UIImage imageNamed:@"BarItem_service"];
        UINavigationController *heaNav = [[UINavigationController alloc] initWithRootViewController:ser];
        
        MessageViewController *mes = [MessageViewController new];
        mes.title = @"消息";
        mes.tabBarItem.image = [UIImage imageNamed:@"BarItem_message"];
        UINavigationController *onNav = [[UINavigationController alloc] initWithRootViewController:mes];
        
        
        MyViewController *myv = [MyViewController new];
        myv.title = @"我的";
        myv.tabBarItem.image = [UIImage imageNamed:@"BarItem_my"];
        UINavigationController *maNav = [[UINavigationController alloc] initWithRootViewController:myv];
        
        UITabBarController *tab = [[UITabBarController alloc] init];
        tab.viewControllers = @[preNav,heaNav,onNav,maNav];
        
        
        UIView * mView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, CoreWidth, 50)];//这是整个tabbar的颜色
        [mView setBackgroundColor:KHexColor(@"#182837")];
        [tab.tabBar insertSubview:mView atIndex:0];
        mView.alpha=0.8;
        tab.tabBar.tintColor = [UIColor whiteColor];
        self.window.rootViewController = tab;
        
    }
    return _tabBarController;
}
- (void)mainWindowClick
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(mainClick)];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.window cache:YES];
    self.loginVCQ.view.alpha = 0;
    [UIView commitAnimations];
}
- (void)mainClick{

    [self tabBarController];
}
-(void)makeLaunchView{
    NSArray *arr    = [NSArray arrayWithObjects:
                       @"secruity",
                       @"multivariate",
                       @"quick",nil];                                //数组内存放的是我要显示的假引导页面图片
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.window.bounds];    //通过scrollView 将这些图片添加在上面，从而达到滚动这些图片
    self.scrollView.contentSize = CGSizeMake(CoreWidth*arr.count, self.window.frame.size.height);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.tag = 7000;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    UIViewController *rootViewController = [[UIViewController alloc] init];
    self.window.rootViewController = rootViewController;
    [rootViewController.view addSubview:_scrollView];
    for (int i=0; i<arr.count; i++) {
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(i*CoreWidth, 0, CoreWidth, CoreHeight)];
        img.image=[UIImage imageNamed:arr[i]];
        [_scrollView addSubview:img];
    }
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CoreHeight-115, CoreWidth, 20)];
    self.pageControl.numberOfPages = 3;
    self.pageControl.currentPage = 0;
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.currentPageIndicatorTintColor = KHexColor(@"#2e408a");
    [self.pageControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [rootViewController.view addSubview:_pageControl];
    
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginButton.layer.cornerRadius = 5;
    self.loginButton.layer.masksToBounds = YES;
    self.loginButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.loginButton.frame = CGRectMake((CoreWidth/2-100)/2, CoreHeight-70, 100, 40);
    self.loginButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.loginButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#2e408a")] forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [rootViewController.view addSubview:_loginButton];
    
    self.registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registButton.layer.cornerRadius = 5;
    self.registButton.layer.masksToBounds = YES;
    self.registButton.layer.borderWidth = 1;
    self.registButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.registButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.registButton.frame = CGRectMake((CoreWidth/2-100)/2+CoreWidth/2, CoreHeight-70, 100, 40);
    self.registButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.registButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.registButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.registButton setBackgroundImage:[UIImage createImageWithColor:[UIColor grayColor]] forState:UIControlStateNormal];//KHexColor(@"#2e408a")
    [self.registButton addTarget:self action:@selector(registButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [rootViewController.view addSubview:_registButton];
}
#pragma mark ---------------------------------------------------------------UIScrollView Delegate-----------------------------------------------------------
- (void)valueChanged:(UIPageControl*)page
{
    [_scrollView setContentOffset:CGPointMake(CoreWidth*page.currentPage , 0) animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    _pageControl.currentPage = scrollView.contentOffset.x/(205.5);
    if (scrollView.contentOffset.x>2*CoreWidth+30) {
        isOut=YES;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (isOut)
    {
        [UIView animateWithDuration:1.5 animations:^{
            scrollView.alpha = 0;                 //让scrollview 渐变消失
            self.registButton.alpha = 0;
            self.loginButton.alpha = 0;
            self.pageControl.alpha = 0;
        
            
        }completion:^(BOOL finished) {
            [_registButton removeFromSuperview];
            [_loginButton removeFromSuperview];
            [_pageControl removeFromSuperview];
            [scrollView  removeFromSuperview];  //将scrollView移除
            [self gotoMain];                    //进入主界面
            
        } ];
    }
    
}
#pragma mark ---------------------------------------------------------------Actions ButtonClick-----------------------------------------------------------

-(void)gotoMain
{
     UITabBarController *tabBarController = [self tabBarController];
    
}
- (void)loginButtonClick:(UIButton *)button
{
     UITabBarController *tabBarController = [self tabBarController];
}
- (void)registButtonClick:(UIButton *)button
{
    
}
@end
