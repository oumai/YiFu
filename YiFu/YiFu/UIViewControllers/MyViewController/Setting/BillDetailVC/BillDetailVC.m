//
//  ShippingAdressVC.m
//  YiFu
//
//  Created by Michael on 16/3/8.
//  Copyright © 2016年 jumper. All rights reserved.
//
#pragma mark ------------------------------------------------------------------Self makeUI -------------------------------------------------------------------
#pragma mark ------------------------------------------------------------------ASURLConnection----------------------------------------------------------------
#pragma mark ------------------------------------------------------------------Actions  ButtonClick-----------------------------------------------------------
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface BillDetailModel  : NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface BillDetailModel ()

@end


@implementation BillDetailModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
    }
    return self;
}
@end





/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface BillDetailCustomCell : UITableViewCell
@end


@interface BillDetailCustomCell ()
@property (nonatomic, strong) UIView             *line;
@property (nonatomic, strong) TTTAttributedLabel *typeOfPayLabel;
@property (nonatomic, strong) TTTAttributedLabel *timeLabel;
@property (nonatomic, strong) TTTAttributedLabel *yuELabel;
@property (nonatomic, strong) TTTAttributedLabel *changeMoneyLabel;
@end


@implementation BillDetailCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = KHexColor(@"#ffffff");
        
        
        
       
        self.line = [UIView new];
        self.line.backgroundColor = KHexColor(@"#e2e2e2");
        [self.contentView addSubview:_line];
        
        
             
        self.typeOfPayLabel = [TTTAttributedLabel new];
        self.typeOfPayLabel.textColor = KHexColor(@"#3e3a39");
        self.typeOfPayLabel.font = KFontSize(17);
        self.typeOfPayLabel.text = @"在线支付";
        [self.contentView addSubview:_typeOfPayLabel];
        
        
            
        
        
        self.timeLabel = [TTTAttributedLabel new];
        self.timeLabel.textColor = KHexColor(@"#878787");
        self.timeLabel.font = KFontSize(12);
        self.timeLabel.text = @"2016-6-6";
        [self.contentView addSubview:_timeLabel];
        
             
        
        self.yuELabel = [TTTAttributedLabel new];
        self.yuELabel.textColor = DeepColor;
        self.yuELabel.font = KFontSize(14);
        self.yuELabel.text = [NSString stringWithFormat:@"余额: %@",@"1582000"];
        [self.contentView addSubview:_yuELabel];
        
            

        
        self.changeMoneyLabel = [TTTAttributedLabel new];
        self.changeMoneyLabel.textColor = DeepColor;
        self.changeMoneyLabel.font = KFontSize(14);
        self.changeMoneyLabel.text = @"-15";
        [self.contentView addSubview:_changeMoneyLabel];
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
        
        [_typeOfPayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(-15);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.width.equalTo(self.typeOfPayLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.typeOfPayLabel.mas_centerY).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.width.equalTo(self.timeLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        [_yuELabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(15);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.width.equalTo(self.yuELabel.mas_width);
            make.height.equalTo(14);
        }];
        [_changeMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.yuELabel.mas_centerY).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.width.equalTo(self.changeMoneyLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
    }
    return self;
}
@end
#import "BillDetailVC.h"
#import "ShouZhiDetailVC.h"
@interface BillDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView      *headerView;
@end

@implementation BillDetailVC
- (void)leftButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.title = @"账单明细";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.tabBarController.tabBar.hidden = YES;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 70;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = KHexColor(@"#f2f2f2");
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
    self.headerView = [UIView new];
    self.headerView.backgroundColor = KHexColor(@"#f2f2f2");
    self.headerView.frame = CGRectMake(0, 0, CoreWidth -20, 10);
    self.tableView.tableHeaderView = _headerView;
    
    //[self requestData];
}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    BillDetailCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[BillDetailCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShouZhiDetailVC *shou = [ShouZhiDetailVC new];
    [self.navigationController pushViewController:shou animated:YES];
    
}
#pragma mark ------------------------------------------------------------------AFNetworking-------------------------------------------------
- (void)requestData
{
    [ASLoadingView showActivity:self.view];
    NSDictionary *jsonDic = @{@"auid":@1};
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [sessionManager GET:YiFuUrl(@"yf/yf_main/message_detail") parameters:jsonDic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"responseObject == %@",responseObject);
        [ASLoadingView hidenActivity:self.view];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
    }];
}
@end
