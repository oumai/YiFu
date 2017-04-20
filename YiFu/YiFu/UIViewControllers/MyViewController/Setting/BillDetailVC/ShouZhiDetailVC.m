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
@interface ShouZhiDetailModel  : NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface ShouZhiDetailModel ()

@end


@implementation ShouZhiDetailModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
    }
    return self;
}
@end





/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface ShouZhiDetailCustomCell : UITableViewCell
@end


@interface ShouZhiDetailCustomCell ()
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel *detailLabel;

@end


@implementation ShouZhiDetailCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = KHexColor(@"#f0f0f0");
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.textColor = LightColor;
        self.titleLabel.font = KFontSize(14);
        [self.contentView addSubview:_titleLabel];
        
        
  
        
        self.detailLabel= [TTTAttributedLabel new];
        self.detailLabel.textColor = DeepColor;
        self.detailLabel.font = KFontSize(14);
        [self.contentView addSubview:_detailLabel];
        
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];

        
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.width.equalTo(self.detailLabel.mas_width);
            make.height.equalTo(14);
        }];

        
        
    }
    return self;
}
@end
#import "ShouZhiDetailVC.h"
@interface ShouZhiDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ShouZhiDetailVC
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
    
    
    self.title = @"收支详情";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.tabBarController.tabBar.hidden = YES;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 40;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = KHexColor(@"#f2f2f2");
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
    }];
  }
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    ShouZhiDetailCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[ShouZhiDetailCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    NSArray *titleArray = @[@"流水号:",@"类型:",@"支出:",@"支付方式:",@"时间:",@"余额:",@"备注:"];
    NSArray *detailArray = @[@"1200890039687",@"在线支付",@"10.00元",@"支付宝",@"2016-10-10 22:20:20",@"400.00",@"购买了滴滴车费-车主商品"];
    cell.titleLabel.text = titleArray[indexPath.row];
    cell.detailLabel.text = detailArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

@end
