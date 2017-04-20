//
//  ServiceViewController.m
//  YiFu
//
//  Created by Michael on 16/3/7.
//  Copyright © 2016年 jumper. All rights reserved.
//

/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
#import <UIKit/UIKit.h>
@interface MyModel : NSObject

@property(nonatomic,strong)NSString *iconName;
@property(nonatomic,strong)NSString *titleName;
@property(nonatomic,strong)Class cls;
@end


@interface MyModel ()

@end


@implementation MyModel



@end

/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface MyCustomCell : UITableViewCell

@property(nonatomic,strong)MyModel *allData;


@end


@interface MyCustomCell ()
@property (nonatomic, strong) UIView               *cellView;
@property (nonatomic, strong) UIButton             *iconImageBbutton;
@property (nonatomic, strong) TTTAttributedLabel   *titleLabel;
@property (nonatomic, strong) UIView               *line;
@property (nonatomic, strong) UIImageView          *arrowImage;
@end

@implementation MyCustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ( self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        self.cellView = [UIView new];
        self.cellView.backgroundColor = KHexColor(@"#30293c");
        self.cellView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.5];
        [self.contentView addSubview:_cellView];
        
       
        self.line = [UIView new];
        self.line.backgroundColor = KHexColor(@"#231e29");
        [self.cellView addSubview:_line];
        
        
        self.iconImageBbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.cellView addSubview:_iconImageBbutton];
        
        self.arrowImage = [UIImageView new];
        self.arrowImage.image = [UIImage imageNamed:@"arrows"];
        [self.cellView addSubview:_arrowImage];
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = KHexColor(@"#ffffff");
        [self.cellView addSubview:_titleLabel];
        
        [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            
        }];

        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.cellView);
            make.left.equalTo(self.cellView.mas_left).offset(15);
            make.right.equalTo(self.cellView.mas_right).offset(-15);
            make.height.equalTo(1);
        }];
        
        [_iconImageBbutton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY);
            make.left.equalTo(self.line.mas_left).offset(10);
            make.width.equalTo(49/2);
            make.height.equalTo(48/2);
        }];
        
        [_arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY);
            make.right.equalTo(self.cellView.mas_right).offset(-10);
            make.width.equalTo(17/2);
            make.height.equalTo(29/2);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY);
            make.left.equalTo(self.iconImageBbutton.mas_right).offset(15);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
    }
    return self;
}


- (void)setAllData:(MyModel *)allData
{
    if (nil == allData) {
        return;
    }
    self.titleLabel.text = allData.titleName;
    [self.iconImageBbutton setImage:[UIImage imageNamed:allData.iconName] forState:UIControlStateNormal];

}
@end


/*-----------------------------------------------------------------------------C----------------------------------------------------------------------------*/



#import "MyViewController.h"
#import "PersonalVC.h"
#import "ShippingAdressVC.h"
#import "BankCardVC.h"
#import "AccountNumberVC.h"
#import "BillDetailVC.h"
#import "CleanCacheVC.h"
#import "FeedbackVC.h"
#import "AboutYifuVC.h"
#import "ExitVC.h"
#import "TanKuangView.h"
@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIView       *headerView;
//@property (nonatomic, strong) UIImageView  *headerImage;
@property (nonatomic, strong) UIButton      *headerImageButton;
@property (nonatomic, strong) UIImageView  *headerQuanImage;
@property (nonatomic, strong) UIImageView  *bgImage;
@property (nonatomic, strong) UITableView  *tableView;
@property (nonatomic, strong) NSDictionary *infoDic;
@property (nonatomic, strong) UILabel      *nickNameLabel;
@property (nonatomic, strong) UILabel      *integralLabel;
@property (nonatomic, strong) UIButton     *addsButton;
@property (nonatomic, assign) BOOL          isPresented; ///上滑滑弹框
@property (nonatomic, strong) UIView       *xiaHuaView;
@property (nonatomic, strong) UIButton     *historyButton;
@property (nonatomic, strong) UIButton     *yinshiSchemeButton;
@property (nonatomic, strong) UIButton     *reportButton;
@property (nonatomic, strong) UIView       *tanLine;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, strong) TanKuangView *tan;
@property (nonatomic, assign) BOOL          isOpen;
@end

@implementation MyViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.tabBarController.tabBar.hidden = NO;

}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.isPresented = NO;
    self.isOpen = NO;
    self.bgImage = [UIImageView new];
    self.bgImage.image = [UIImage imageNamed:@"my_bg"];
    self.bgImage.frame = self.view.frame;
    [self.view addSubview:_bgImage];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 50;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
    }];
    [self makeHeaderView];
    [self shangHuaView];
}
#pragma mark ------------------------------------------------------------------Actions  ButtonClick-----------------------------------------------------------

- (void)addFriendsButtonClick:(UIButton *)button
{
}

- (void)headerImageButotnClick
{
    PersonalVC *per = [PersonalVC new];
    [self.navigationController pushViewController:per animated:YES];
}
#pragma mark -------------------------------------------------------------------TanKuangView-------------------------------------------------------------------
- (void)addButtonClick:(UIButton *)button
{
    if (_isOpen == NO) {
        self.tan = [[TanKuangView alloc] init];
        self.tan.navigation = self.navigationController;
        self.tan.frame = CGRectMake(CoreWidth-180-10, 54, 180, 164);
        [self.view addSubview:_tan];
        
        __weak MyViewController *isOp = self;
        [_tan setTankuangDismissBlock:^(TanKuangView *tan) {
            [tan removeFromSuperview];
            isOp.isOpen = NO;
        }];
        
        self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClickTanRemoveFrom)];
        [self.view addGestureRecognizer:_tap];
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
    [self.view removeGestureRecognizer:_tap];
    [_tan removeFromSuperview];
    self.isOpen = NO;
}

#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _infoDic.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionKey = [@(section) stringValue];
    NSArray *array = _infoDic[sectionKey];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"more_cell";
    MyCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[MyCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSString *sectionKey = [@(indexPath.section) stringValue];
    NSArray *array = _infoDic[sectionKey];
    cell.allData = array[indexPath.row];
    if (indexPath.row == array.count-1) {
        cell.line.backgroundColor = [UIColor clearColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *sectionKey = [@(indexPath.section) stringValue];
    NSArray *array = _infoDic[sectionKey];
    MyModel *infoO = array[indexPath.row];
    UIViewController *viewController = (UIViewController *)[infoO.cls new];
        if ([viewController isKindOfClass:[PersonalVC class]]) {
            [self.navigationController pushViewController:viewController animated:YES];
        }
        else if ([viewController isKindOfClass:[ShippingAdressVC class]])
        {
            [self.navigationController pushViewController:viewController animated:YES];
        }
        else if ([viewController isKindOfClass:[BankCardVC class]])
        {
            [self.navigationController pushViewController:viewController animated:YES];
    
        }else if ([viewController isKindOfClass:[AccountNumberVC class]])
        {
            [self.navigationController pushViewController:viewController animated:YES];
        }else if ([viewController isKindOfClass:[BillDetailVC class]])
        {
            [self.navigationController pushViewController:viewController animated:YES];
        }
        else if ([viewController isKindOfClass:[CleanCacheVC class]])
        {
            [self.navigationController pushViewController:viewController animated:YES];
        }
        else if ([viewController isKindOfClass:[FeedbackVC class]])
        {
            [self.navigationController pushViewController:viewController animated:YES];
        }
        else if ([viewController isKindOfClass:[AboutYifuVC class]])
        {
            [self.navigationController pushViewController:viewController animated:YES];
        }
        else if ([viewController isKindOfClass:[ExitVC class]])
        {
            //[self.navigationController pushViewController:viewController animated:YES];
            
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

            
        }
}
#pragma mark ------------------------------------------------------------------退出登录View-------------------------------------------------------------------

- (void)yinshiSchemeButtonClick:(UIButton *)button
{
    if (button.tag == 100) {
    }
    else if (button.tag == 101)
    {
        
    }
    else if (button.tag == 102){
        [self animationedDown];
    }
    
}

- (void)animationUp
{
    self.tabBarController.tabBar.hidden = YES;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];
    self.xiaHuaView.frame = CGRectMake(0, CoreHeight-160, CoreWidth, 160);
    [UIView commitAnimations];
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:_tap];
    _isPresented = YES;

}
- (void)animationedDown
{
    self.tabBarController.tabBar.hidden = NO;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.xiaHuaView.frame = CGRectMake(0, CoreHeight, CoreWidth, 160);
    [UIView commitAnimations];
    [self.view removeGestureRecognizer:_tap];
    _isPresented = NO;

}
- (void)tapClick
{
    [self animationedDown];
}
#pragma mark ------------------------------------------------------------------ASURLConnection----------------------------------------------------------------
#pragma mark ------------------------------------------------------------------Self makeUI -------------------------------------------------------------------
- (void)shangHuaView
{
 
    self.xiaHuaView = [UIView new];
    self.xiaHuaView.frame = CGRectMake(0, CoreHeight, CoreWidth, 160);
    self.xiaHuaView.backgroundColor = KHexColor(@"#dbdbdb");
    [self.view addSubview:_xiaHuaView];
    
    
    
    self.historyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.historyButton.titleLabel.font = KFontSize(14);
    self.historyButton.tag = 100;
    [self.historyButton setImageEdgeInsets:UIEdgeInsetsMake(0,-10, 0, 0)];
    [self.historyButton setImage:[UIImage imageNamed:@"tankuang_history"] forState:UIControlStateNormal];
    [self.historyButton setTitle:@"提示:是否确定退出" forState:UIControlStateNormal];
    [self.historyButton setTitleColor:KHexColor(@"#3e3a39") forState:UIControlStateNormal];
    [self.historyButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ffffff")] forState:UIControlStateNormal];
    [self.historyButton addTarget:self action:@selector(yinshiSchemeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.xiaHuaView addSubview:_historyButton];
    
    self.tanLine = [UIView new];
    self.tanLine.backgroundColor = KHexColor(@"#d1d1d1");
    self.tanLine.frame = CGRectMake(0, 50, CoreWidth, 0.5);
    [self.xiaHuaView addSubview:_tanLine];
    
    
    self.yinshiSchemeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.yinshiSchemeButton.titleLabel.font = KFontSize(14);
    self.yinshiSchemeButton.tag = 101;
    [self.yinshiSchemeButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [self.yinshiSchemeButton setTitleColor:KHexColor(@"#c20c23") forState:UIControlStateNormal];
    [self.yinshiSchemeButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ffffff")] forState:UIControlStateNormal];
    [self.yinshiSchemeButton addTarget:self action:@selector(yinshiSchemeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.xiaHuaView addSubview:_yinshiSchemeButton];
    
    
    
    
    self.reportButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.reportButton.titleLabel.font = KFontSize(14);
    self.reportButton.tag = 102;
    [self.reportButton setTitle:@"取消" forState:UIControlStateNormal];
    self.reportButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self.reportButton setTitleColor:KHexColor(@"#3e3a39") forState:UIControlStateNormal];
    [self.reportButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ffffff")] forState:UIControlStateNormal];
    [self.reportButton addTarget:self action:@selector(yinshiSchemeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.xiaHuaView addSubview:_reportButton];
    
    
    
    [_historyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.xiaHuaView.mas_top).offset(0);
        make.left.equalTo(self.xiaHuaView.mas_left).offset(0);
        make.right.equalTo(self.xiaHuaView.mas_right).offset(0);
        make.height.equalTo(50);
    }];

    
    [_yinshiSchemeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.xiaHuaView.mas_top).offset(50.5);
        make.left.equalTo(self.xiaHuaView.mas_left).offset(0);
        make.right.equalTo(self.xiaHuaView.mas_right).offset(0);
        make.height.equalTo(50);
    }];

    [_reportButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.xiaHuaView.mas_top).offset(110);
        make.left.equalTo(self.xiaHuaView.mas_left).offset(0);
        make.right.equalTo(self.xiaHuaView.mas_right).offset(0);
        make.height.equalTo(50);
    }];
    
    
}

- (void)makeHeaderView
{
    self.headerView = [UIView new];
    self.headerView.frame = CGRectMake(0, 0, CoreWidth, 100);
    self.tableView.tableHeaderView = _headerView;
    
    self.headerQuanImage = [UIImageView new];
    self.headerQuanImage.image = [UIImage imageNamed:@"headerQuan"];
    [self.headerView addSubview:_headerQuanImage];
    
    

//    self.headerImage = [UIImageView new];
//    self.headerImage.image = [UIImage imageNamed:@"header"];
//    self.headerImage.userInteractionEnabled = YES;
//    [self.view addSubview:_headerImage];
    
    self.headerImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.headerImageButton setImage:[UIImage imageNamed:@"header"] forState:UIControlStateNormal];
    [self.headerImageButton addTarget:self action:@selector(headerImageButotnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:_headerImageButton];
    
    
    [_headerImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headerQuanImage.mas_centerY).offset(0);
        make.centerX.equalTo(self.headerQuanImage.mas_centerX).offset(0);
        make.width.equalTo(127/2);
        make.height.equalTo(127/2);
    }];
    
    self.nickNameLabel = [TTTAttributedLabel new];
    self.nickNameLabel.font = [UIFont systemFontOfSize:14];
    self.nickNameLabel.textColor = KHexColor(@"#ffffff");
    self.nickNameLabel.text = @"乔布斯 昵称";
    [self.headerView addSubview:_nickNameLabel];
       
    self.integralLabel = [TTTAttributedLabel new];
    self.integralLabel.font = [UIFont systemFontOfSize:14];
    self.integralLabel.textColor = KHexColor(@"#6b6f81");
    self.integralLabel.text = @"积分: 888";
    [self.headerView addSubview:_integralLabel];
    
     
    self.addsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addsButton setImage:[UIImage imageNamed:@"add_image"] forState:UIControlStateNormal];
    [self.addsButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:_addsButton];
    
    
    [_headerQuanImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headerView.mas_centerY).offset(10);
        make.left.equalTo(self.headerView.mas_left).offset(10);
        make.width.equalTo(70);
        make.height.equalTo(70);
    }];
    
    [_nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headerQuanImage.mas_centerY).offset(-12);
        make.left.equalTo(self.headerQuanImage.mas_right).offset(15);
        make.width.equalTo(self.nickNameLabel.mas_width);
        make.height.equalTo(14);
    }];
    [_integralLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headerQuanImage.mas_centerY).offset(12);
        make.left.equalTo(self.headerQuanImage.mas_right).offset(15);
        make.width.equalTo(self.integralLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    [_addsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerQuanImage.mas_top).offset(0);
        make.right.equalTo(self.headerView.mas_right).offset(-10);
        make.width.equalTo(30);
        make.height.equalTo(30);
    }];
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self == [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        
        
        MyModel *myProfit1  = [MyModel new];
        myProfit1.iconName  = @"gerenziliao";
        myProfit1.titleName = @"个人资料";
        myProfit1.cls = [PersonalVC class];
        
        MyModel *myProfit2  = [MyModel new];
        myProfit2.iconName  = @"shouhuodizhi";
        myProfit2.titleName = @"收货地址";
        myProfit2.cls = [ShippingAdressVC class];
        
        MyModel *myProfit3  = [MyModel new];
        myProfit3.iconName  = @"yinhangkabangding";
        myProfit3.titleName = @"银行卡绑定";
        myProfit3.cls = [BankCardVC class];
        
        MyModel *myProfit4  = [MyModel new];
        myProfit4.iconName  = @"zhanghaobangding";
        myProfit4.titleName = @"账号绑定";
        myProfit4.cls = [AccountNumberVC class];
        
        MyModel *myProfit5  = [MyModel new];
        myProfit5.iconName  = @"billdetail";
        myProfit5.titleName = @"账单明细";
        myProfit5.cls = [BillDetailVC class];
        
        MyModel *myProfit6  = [MyModel new];
        myProfit6.iconName  = @"cleanhuancun";
        myProfit6.titleName = @"清除缓存";
        myProfit6.cls = [CleanCacheVC class];
        
        MyModel *myProfit7  = [MyModel new];
        myProfit7.iconName  = @"feedback";
        myProfit7.titleName = @"意见反馈";
        myProfit7.cls = [FeedbackVC class];
        
        MyModel *myProfit8  = [MyModel new];
        myProfit8.iconName  = @"aboutyifu";
        myProfit8.titleName = @"关于亿付";
        myProfit8.cls = [AboutYifuVC class];
        
        MyModel *myProfit9  = [MyModel new];
        myProfit9.iconName  = @"dengchu";
        myProfit9.titleName = @"登出";
        myProfit9.cls = [ExitVC class];
        
        _infoDic = @{@"0":@[myProfit1,myProfit2,],
                     @"1":@[myProfit3,myProfit4,myProfit5],
                     @"2":@[myProfit6,myProfit7,myProfit8,myProfit9],
                     };
        
    }
    return self;
}
//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
//    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {//如果当前是tableView
//        //做自己想做的事
//        return NO;
//    }
//    return YES;
//}
@end


