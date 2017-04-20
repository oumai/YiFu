//
//  MyCustomVC.m
//  YiFu
//
//  Created by Michael on 16/3/9.
//  Copyright © 2016年 jumper. All rights reserved.
//

//
//  ServiceViewController.m
//  YiFu
//
//  Created by Michael on 16/3/7.
//  Copyright © 2016年 jumper. All rights reserved.
//


/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
#import <UIKit/UIKit.h>
@interface MyCustomModel : NSObject

@property(nonatomic,strong)NSString *iconName;
@property(nonatomic,strong)NSString *titleName;
@property(nonatomic,strong)Class cls;
@end


@interface MyCustomModel ()

@end


@implementation MyCustomModel



@end
/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface SectionHeaderView : UIView
@property (nonatomic, strong) UIImageView           *colorImage;
@property (nonatomic, strong) TTTAttributedLabel    *titleLabel;
@property (nonatomic, strong) UIImageView           *arrowImage;
@property (nonatomic, copy) void(^openDetailDescriptionBlock)();
@end


@interface SectionHeaderView ()
@property (nonatomic, strong) UIView                *sectionView; //区头

@end

@implementation SectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        
        self.sectionView = [UIView new];
        self.sectionView.backgroundColor = KHexColor(@"#30293c");
        self.sectionView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.3];
        [self addSubview:_sectionView];
        
        
        self.arrowImage = [UIImageView new];
        self.arrowImage.contentMode = UIViewContentModeScaleAspectFit;
        self.arrowImage.image = [UIImage imageNamed:@"service_arrows"];
        [self.sectionView addSubview:_arrowImage];
        
        self.colorImage = [UIImageView new];
        [self.sectionView addSubview:_colorImage];
        
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = KHexColor(@"#ffffff");
        [self.sectionView addSubview:_titleLabel];
        
        [_sectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(5);
            make.left.equalTo(self.mas_left).offset(10);
            make.bottom.equalTo(self.mas_bottom).offset(-5);
            make.right.equalTo(self.mas_right).offset(-10);
            
        }];
        
        [_colorImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.sectionView.mas_left).offset(0);
            make.top.equalTo(self.sectionView.mas_top).offset(0);
            make.width.equalTo(5);
            make.bottom.equalTo(self.sectionView.mas_bottom).offset(0);;
        }];
        
        
        [_arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.sectionView.mas_centerY);
            make.right.equalTo(self.sectionView.mas_right).offset(-20);
            make.width.equalTo(29/2);
            make.height.equalTo(29/2);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.sectionView.mas_centerY);
            make.left.equalTo(self.sectionView.mas_left).offset(30);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGessure:)];
        [self addGestureRecognizer:tapGes];
    }
    return self;
}
- (void)tapGessure:(UITapGestureRecognizer *)tap
{
    if (self.openDetailDescriptionBlock) {
        self.openDetailDescriptionBlock();
    }
}
@end
/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface MyCustomCustomCell : UITableViewCell

@property(nonatomic,strong)MyCustomCustomCell *allData;

@property (nonatomic, strong) void(^leftButtonBlock)(MyCustomCustomCell *);
@property (nonatomic, strong) void(^rightButtonBlock)(MyCustomCustomCell *);
@end


@interface MyCustomCustomCell ()
@property (nonatomic, strong) UIButton     *leftButton;
@property (nonatomic, strong) UIButton     *rightButon;
@end

@implementation MyCustomCustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ( self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftButton.layer.cornerRadius = 3;
        self.leftButton.layer.masksToBounds = YES;
        self.leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
        self.leftButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.leftButton setImage:[UIImage imageNamed:@"service_guahao"] forState:UIControlStateNormal];
        [self.leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
        [self.leftButton setTitle:@"挂号就诊" forState:UIControlStateNormal];
        [self.leftButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
        [self.leftButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithWhite:0.f alpha:0.3]] forState:UIControlStateNormal];
        [self.leftButton addTarget:self action:@selector(leftnButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_leftButton];
        
        
        
        self.rightButon = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightButon.layer.cornerRadius = 3;
        self.rightButon.layer.masksToBounds = YES;
        self.rightButon.titleLabel.font = [UIFont systemFontOfSize:14];
        self.rightButon.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.rightButon setImage:[UIImage imageNamed:@"service_guahao"] forState:UIControlStateNormal];
        [self.rightButon setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
        [self.rightButon setTitle:@"挂号就诊" forState:UIControlStateNormal];
        [self.rightButon setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
        [self.rightButon setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithWhite:0.f alpha:0.3]] forState:UIControlStateNormal];
        [self.rightButon addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_rightButon];
        
        
        [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.right.equalTo(self.contentView.mas_centerX).offset(-2.5);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        }];
        [_rightButon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.left.equalTo(self.contentView.mas_centerX).offset(2.5);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        }];
        

    }
    return self;
}

- (void)leftnButtonClick:(UIButton *)button
{
    if (self.leftButtonBlock) {
        self.leftButtonBlock(self);
    }
}
- (void)rightButtonClick:(UIButton *)button
{
    if (self.rightButtonBlock) {
        self.rightButtonBlock(self);
    }
}


@end


/*-----------------------------------------------------------------------------C----------------------------------------------------------------------------*/
#import "MyCustomVC.h"
@interface MyCustomVC ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL *_isOpen;
}
@property (nonatomic, strong) UIImageView           *bgImage;
@property (nonatomic, strong) UITableView           *tableView;
@property (nonatomic, strong) NSDictionary          *infoDic;
@property (nonatomic, strong) UIView                *headerView;  ///表头
@property (nonatomic, strong) UIImageView           *headerBgImage;
@property (nonatomic, strong) UIImageView           *welcomeImage;
@property (nonatomic, strong) UIButton              *locationButton;
@property (nonatomic, strong) UIView                *shadowView;
@property (nonatomic, strong) TTTAttributedLabel    *temperatureLabel;
@property (nonatomic, strong) TTTAttributedLabel    *weatherLabel;
@property (nonatomic, strong) TTTAttributedLabel    *airLabel;
@property (nonatomic, strong) UIImageView           *weatherImage;




@property (nonatomic, strong) NSMutableArray        *sectionArray;
@end

@implementation MyCustomVC
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sectionArray = [[NSMutableArray alloc] initWithObjects:@"好的",@"真的",@"棒的",nil];
    _isOpen = malloc(sizeof(BOOL) *_sectionArray.count);
    memset(_isOpen, 0, sizeof(BOOL) *_sectionArray.count);
    
    self.bgImage = [UIImageView new];
    self.bgImage.image = [UIImage imageNamed:@"my_bg"];
    self.bgImage.frame = self.view.frame;
    [self.view addSubview:_bgImage];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.frame = CGRectMake(0, 64, CoreWidth, CoreHeight-64);
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
    
    [self makeHeaderView];
    
    //[self requestData];
  
}
- (void)requestData
{
    [ASLoadingView showActivity:self.view];
    NSDictionary *jsonDic = @{@"auid":@1,
                              @"user_key":@"745d0f2263ccb8f3ea0fb93218772d5b",
                              @"pay_order_id":@"123456789",
                              @"pay_money":@100,
                              @"order_use_code":@1,
                              @"pay_type":@0
                              };
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [sessionManager GET:YiFuUrl(@"yf/yf_main/list_all_service") parameters:@{@"territory_id":@0} progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [ASLoadingView hidenActivity:self.view];
        
        k_yjHUD(@"列出城市所有订制服务", self.view);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
    }];
    
    
}

#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    SectionHeaderView *sectionHeader = [SectionHeaderView new];
    sectionHeader.frame = CGRectMake(0, 0, CoreWidth, 50);
    sectionHeader.colorImage.backgroundColor = 0 == section ? KHexColor(@"#ab243c") : 1 == section ? KHexColor(@"#2edcde") : KHexColor(@"#ffa93c");
    sectionHeader.titleLabel.text =0 == section ? @"医疗服务" : 1 == section ? @"车主服务" : @"食材配送";
    
    [sectionHeader setOpenDetailDescriptionBlock:^{
        _isOpen[section] = !_isOpen[section];
        [_tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    sectionHeader.arrowImage.image = [UIImage imageNamed:_isOpen[section] ? @"service_arrow_down" : @"service_arrows"];

    return sectionHeader;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _isOpen[section] ? 1 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ServiceCustomCell_cell";
    MyCustomCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[MyCustomCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setLeftButtonBlock:^(MyCustomCustomCell *left) {
        
    }];
    
    [cell setRightButtonBlock:^(MyCustomCustomCell *right) {
        
    }];
    return cell;
}
- (void)makeHeaderView
{
    self.headerView = [UIView new];
    self.headerView.backgroundColor = [UIColor grayColor];
    self.headerView.frame = CGRectMake(0, 0, CoreWidth, 170);
    self.tableView.tableHeaderView = _headerView;
    
    self.headerBgImage = [UIImageView new];
    self.headerBgImage.frame = CGRectMake(0, 0, CoreWidth, 170);
    self.headerBgImage.image = [UIImage imageNamed:@"service_banner"];
    [self.headerView addSubview:_headerBgImage];
    
    self.welcomeImage = [UIImageView new];
    self.welcomeImage.frame = CGRectMake(0, 10, 343/2, 55/2);
    self.welcomeImage.image = [UIImage imageNamed:@"service_welcome"];
    [self.headerView addSubview:_welcomeImage];
    
    
    self.locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.locationButton.titleLabel.font = KFontSize(14);
    [self.locationButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [self.locationButton setTitle:@"太原" forState:UIControlStateNormal];
    [self.locationButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.locationButton setImage:[UIImage imageNamed:@"location"] forState:UIControlStateNormal];
    [self.locationButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]] forState:UIControlStateNormal];
    [self.headerView addSubview:_locationButton];
    
    
  

    self.shadowView = [UIView new];
    self.shadowView.layer.cornerRadius = 5;
    self.shadowView.layer.masksToBounds = YES;
    self.shadowView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    [self.headerView addSubview:_shadowView];
    
    
    
  
    self.temperatureLabel = [TTTAttributedLabel new];
    self.temperatureLabel.font = [UIFont systemFontOfSize:20];
    self.temperatureLabel.textColor = KHexColor(@"#ffffff");
    self.temperatureLabel.text = @"11℃ ~ 18℃";
    [self.shadowView addSubview:_temperatureLabel];
    
    
      
    self.weatherImage = [UIImageView new];
    self.weatherImage.image = [UIImage imageNamed:@""];
    self.weatherImage.backgroundColor = [UIColor grayColor];
    [self.shadowView addSubview:_weatherImage];
    
  
    
    self.weatherLabel = [TTTAttributedLabel new];
    self.weatherLabel.font = [UIFont systemFontOfSize:14];
    self.weatherLabel.textColor = KHexColor(@"#ffffff");
    self.weatherLabel.text = @"晴";
    [self.shadowView addSubview:_weatherLabel];
    
    
      
    self.airLabel = [TTTAttributedLabel new];
    self.airLabel.font = [UIFont systemFontOfSize:14];
    self.airLabel.textColor = KHexColor(@"#ffffff");
    self.airLabel.text = @"空气良";
    [self.shadowView addSubview:_airLabel];
    
    [_locationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(30);
        make.right.equalTo(self.headerView.mas_right).offset(-20);
        make.width.equalTo(60);
        make.height.equalTo(30);
    }];
    
    [_shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerView.mas_left).offset(10);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(-10);
        make.width.equalTo(160);
        make.height.equalTo(110);
        
    }];
    [_temperatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shadowView.mas_top).offset(20);
        make.left.equalTo(self.shadowView.mas_left).offset(20);
        make.width.equalTo(self.temperatureLabel.mas_width);
        make.height.equalTo(20);
    }];
    [_weatherImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.temperatureLabel.mas_bottom).offset(10);
        make.left.equalTo(self.temperatureLabel.mas_left).offset(0);
        make.width.equalTo(50);
        make.height.equalTo(50);
    }];
    [_weatherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.weatherImage.mas_top).offset(10);
        make.left.equalTo(self.weatherImage.mas_right).offset(10);
        make.width.equalTo(self.temperatureLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    [_airLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.weatherImage.mas_bottom).offset(-10);
        make.left.equalTo(self.weatherImage.mas_right).offset(10);
        make.width.equalTo(self.airLabel.mas_width);
        make.height.equalTo(14);
    }];


}

@end


