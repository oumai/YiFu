//
//  BankCardVC.m
//  YiFu
//
//  Created by Michael on 16/3/12.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface BankCardModel  : NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface BankCardModel ()

@end


@implementation BankCardModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
    }
    return self;
}
@end





/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface BankCardCustomCell : UITableViewCell

@end

@interface BankCardCustomCell ()
@property (nonatomic, strong) UIView             *cellView;
@property (nonatomic, strong) UIImageView        *bgImage;
@property (nonatomic, strong) UIImageView        *iconImage;
@property (nonatomic, strong) TTTAttributedLabel *bankLabel;
@property (nonatomic, strong) TTTAttributedLabel *kindLabel;
@property (nonatomic, strong) TTTAttributedLabel *accountLabel;
@end


@implementation BankCardCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor colorWithWhite:0.f alpha:0];
        
        self.cellView = [UIView new];
        self.cellView.layer.cornerRadius = 5;
        self.cellView.layer.masksToBounds = YES;
        self.cellView.backgroundColor = KHexColor(@"#ffffff");
        [self.contentView addSubview:_cellView];
        
             
        
        self.bgImage = [UIImageView new];
        self.bgImage.image = [UIImage imageNamed:@"bankCard_jiao"];
        [self.contentView addSubview:_bgImage];
        
              
        self.iconImage = [UIImageView new];
        self.iconImage.image = [UIImage imageNamed:@"bank_traffic"];
        [self.contentView addSubview:_iconImage];
        
              

        
        self.bankLabel = [TTTAttributedLabel new];
        self.bankLabel.font = KFontSize(14);
        self.bankLabel.textColor = KHexColor(@"#ffffff");
        self.bankLabel.text = @"交通银行";
        [self.contentView addSubview:_bankLabel];
        
          
        self.kindLabel = [TTTAttributedLabel new];
        self.kindLabel.font = KFontSize(14);
        self.kindLabel.textColor = KHexColor(@"#ffffff");
        self.kindLabel.text = @"信用卡";
        [self.contentView addSubview:_kindLabel];
        
            
        self.accountLabel = [TTTAttributedLabel new];
        self.accountLabel.font = KFontSize(14);
        self.accountLabel.textColor = KHexColor(@"#ffffff");
        self.accountLabel.text = @"6222  2222  2222  2222";
        [self.contentView addSubview:_accountLabel];
        
        
        [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            
        }];
        
        
        [_bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self.cellView);
        }];
        
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cellView.mas_top).offset(10);
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.width.equalTo(36);
            make.height.equalTo(36);
        }];
        
        
        [_bankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImage.mas_top).offset(0);
            make.left.equalTo(self.iconImage.mas_right).offset(10);
            make.width.equalTo(self.bankLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        [_kindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.iconImage.mas_bottom).offset(0);
            make.left.equalTo(self.iconImage.mas_right).offset(10);
            make.width.equalTo(self.kindLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        [_accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.cellView.mas_bottom).offset(-10);
            make.centerX.equalTo(self.cellView.mas_centerX).offset(0);
            make.width.equalTo(self.accountLabel.mas_width);
            make.height.equalTo(14);
        }];

        
    
    }
    return self;
}
@end

/*-----------------------------------------------------------------------------C----------------------------------------------------------------------------*/
#import "BankCardVC.h"
#import "DCPaymentView.h"
#import "AddBankCardVC.h"
@interface BankCardVC()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UIImageView *bgImage;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView      *footerView;
@property (nonatomic, strong) UIButton    *accountSafingButton;
@property (nonatomic, strong) UIButton    *addBankCardButton;
@end
@implementation BankCardVC
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)rightImageClick
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"银行卡";
    [self setRightItemImage];
    self.bgImage = [UIImageView new];
    self.bgImage.image = [UIImage imageNamed:@"bgPay"];
    self.bgImage.frame = self.view.frame;
    [self.view addSubview:_bgImage];
    

    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 100;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.frame = CGRectMake(0, 69, CoreWidth, CoreHeight-69-50);
    [self.view addSubview:_tableView];
    
    
    self.footerView = [UIView new];
    self.footerView.frame = CGRectMake(0, 0, CoreWidth, 30);
    self.tableView.tableFooterView = _footerView;
    
    self.accountSafingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.accountSafingButton.titleLabel.font = KFontSize(10);
    [self.accountSafingButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [self.accountSafingButton setTitle:@"账户安全保障中" forState:UIControlStateNormal];
    [self.accountSafingButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.accountSafingButton setImage:[UIImage imageNamed:@"bank_lock"] forState:UIControlStateNormal];
    [self.footerView addSubview:_accountSafingButton];
    
    
    [_accountSafingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.footerView.mas_centerY).offset(0);
        make.centerX.equalTo(self.footerView.mas_centerX).offset(0);
        make.width.equalTo(140);
        make.height.equalTo(30);
    }];

    
}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    BankCardCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[BankCardCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 60;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *sectionFooterView= [UIView new];
    sectionFooterView.frame = CGRectMake(0, 0, CoreWidth, 60);
    sectionFooterView.backgroundColor = [UIColor clearColor];
    self.addBankCardButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addBankCardButton.frame = CGRectMake(10, 5, CoreWidth-20, 50);
    [self.addBankCardButton setImage:[UIImage imageNamed:@"binding_bankCard"] forState:UIControlStateNormal];
    [self.addBankCardButton addTarget:self action:@selector(addBankCardButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [sectionFooterView addSubview:_addBankCardButton];
    return sectionFooterView;
}
- (void)addBankCardButtonClick:(UIButton *)button
{
    DCPaymentView *payAlert = [[DCPaymentView alloc]init];
    payAlert.title = @"请输入支付密码,以验证身份";
    payAlert.detail = @"提现";
    payAlert.amount= 10;
    [payAlert show];
    payAlert.completeHandle = ^(NSString *inputPwd) {
        NSLog(@"密码是%@",inputPwd);
        AddBankCardVC *add = [AddBankCardVC new];
        [self.navigationController pushViewController:add animated:YES];
    };

    
}
@end
