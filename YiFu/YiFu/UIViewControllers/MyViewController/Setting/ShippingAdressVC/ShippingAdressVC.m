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
@interface ShippingAdressModel  : NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface ShippingAdressModel ()

@end


@implementation ShippingAdressModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
    }
    return self;
}
@end





/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface ShippingAdressCustomCell : UITableViewCell
@property (nonatomic, strong) void(^editingBlock)(ShippingAdressCustomCell *);
@end


@interface ShippingAdressCustomCell ()
@property (nonatomic, strong) UIView             *line;
@property (nonatomic, strong) TTTAttributedLabel *nameLabel;
@property (nonatomic, strong) TTTAttributedLabel *phoneNumberLabel;
@property (nonatomic, strong) TTTAttributedLabel *shengFenLabel;
@property (nonatomic, strong) UIButton           *editingButton;
@end


@implementation ShippingAdressCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = KHexColor(@"#ffffff");
        
        
        self.editingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.editingButton setImage:[UIImage imageNamed:@"personal_editing"] forState:UIControlStateNormal];
        [self.editingButton addTarget:self action:@selector(editingButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_editingButton];
        
        self.nameLabel = [TTTAttributedLabel new];
        self.nameLabel.textColor = KHexColor(@"#878787");
        self.nameLabel.font = KFontSize(12);
        self.nameLabel.text = @"付钱";
        [self.contentView addSubview:_nameLabel];
        
        
        
        self.phoneNumberLabel = [TTTAttributedLabel new];
        self.phoneNumberLabel.textColor = KHexColor(@"#878787");
        self.phoneNumberLabel.font = KFontSize(12);
        self.phoneNumberLabel.text = @"1388888888";
        [self.contentView addSubview:_phoneNumberLabel];
        
        self.shengFenLabel = [TTTAttributedLabel new];
        self.shengFenLabel.textColor = KHexColor(@"#3e3a39");
        self.shengFenLabel.font = KFontSize(14);
        self.shengFenLabel.text = @"广东省深圳市";
        [self.contentView addSubview:_shengFenLabel];
        
        
        self.line = [UIView new];
        self.line.backgroundColor = KHexColor(@"#e2e2e2");
        [self.contentView addSubview:_line];
        
        
        [_editingButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.width.equalTo(40);
            make.height.equalTo(40);
        }];
        

        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(-10);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.width.equalTo(self.nameLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        [_phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLabel.mas_centerY).offset(0);
            make.left.equalTo(self.nameLabel.mas_right).offset(20);
            make.width.equalTo(self.phoneNumberLabel.mas_width);
            make.height.equalTo(14);
        }];
        [_shengFenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(10);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.width.equalTo(self.shengFenLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
    }
    return self;
}
- (void)editingButtonClick:(UIButton *)button
{
    if (self.editingBlock) {
        self.editingBlock(self);
    }
}
@end
#import "ShippingAdressVC.h"
#import "EditingAdressVC.h"
@interface ShippingAdressVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView      *headerView;
@end

@implementation ShippingAdressVC
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
   
    [self setRightItem];
    self.title = @"收货地址";
    self.navigationItem.rightBarButtonItem.title = @"新增地址";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.tabBarController.tabBar.hidden = YES;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 50;
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
}
- (void)rightBarButtonItemClick
{
    EditingAdressVC *edi = [EditingAdressVC new];
    [self.navigationController pushViewController:edi animated:YES];
}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    ShippingAdressCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[ShippingAdressCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    [cell setEditingBlock:^(ShippingAdressCustomCell *cel) {
        
        EditingAdressVC *edi = [EditingAdressVC new];
        [self.navigationController pushViewController:edi animated:YES];
    }];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

@end
