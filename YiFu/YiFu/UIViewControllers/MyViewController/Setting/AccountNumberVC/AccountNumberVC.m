//
//  AccountNumberVC.m
//  YiFu
//
//  Created by Michael on 16/3/8.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface AccountNumberModel: NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface AccountNumberModel ()

@end


@implementation AccountNumberModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
    }
    return self;
}
@end





/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface AccountNumberCustomCell : UITableViewCell

@end


@interface AccountNumberCustomCell ()
@property (nonatomic, strong) UIView             *line;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel *statusLabel;
@property (nonatomic, strong) UIImageView        *iconImage;
@property (nonatomic, strong) UIImageView        *arrowImage;
@end


@implementation AccountNumberCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.iconImage = [UIImageView new];
        [self.contentView addSubview:_iconImage];
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.textColor = KHexColor(@"#3c3b39");
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.text = @"Michael Jackson";
        [self.contentView addSubview:_titleLabel];
        
        
        
        
        self.statusLabel = [TTTAttributedLabel new];
        self.statusLabel.textColor = LightColor;
        self.statusLabel.font = KFontSize(14);
        self.statusLabel.text = @"未绑定";
        [self.contentView addSubview:_statusLabel];
        
        
        
        self.line = [UIView new];
        self.line.backgroundColor = KHexColor(@"#c6c6c6");
        [self.contentView addSubview:_line];
        
        self.arrowImage = [UIImageView new];
        self.arrowImage.image = [UIImage imageNamed:@"arrows"];
        [self.contentView addSubview:_arrowImage];
        
        
        [_arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-30);
            make.width.equalTo(17/2);
            make.height.equalTo(29/2);
        }];
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
        
        
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.width.equalTo(26);
            make.height.equalTo(26);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.iconImage.right).offset(10);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_top).offset(0);
            make.right.equalTo(self.arrowImage.mas_left).offset(-15);
            make.width.equalTo(self.statusLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        
        
    }
    return self;
}
@end



#import "AccountNumberVC.h"

@interface AccountNumberVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView        *tableView;
@property (nonatomic, strong) UIView             *footerView;
@property (nonatomic, strong) TTTAttributedLabel *footerLabel;
@property (nonatomic, strong) UIImageView        *arrowImage;
@property (nonatomic, strong) UIButton           *setPasswordButton;
@end

@implementation AccountNumberVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.tabBarController.tabBar.hidden = YES;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"绑定账号";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = KHexColor(@"#f2f2f2");
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    self.footerView = [UIView new];
    self.footerView.backgroundColor = [UIColor whiteColor];
    self.footerView.frame = CGRectMake(0, 220, CoreWidth, 50);
    [self.tableView addSubview:_footerView];
    
    
    self.footerLabel = [TTTAttributedLabel new];
    self.footerLabel.textColor = KHexColor(@"#3c3b39");
    self.footerLabel.font = KFontSize(14);
    self.footerLabel.text = @"设置密码";
    [self.footerView addSubview:_footerLabel];
    
    self.arrowImage = [UIImageView new];
    self.arrowImage.image = [UIImage imageNamed:@"arrows"];
    [self.footerView addSubview:_arrowImage];
    
    self.setPasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.setPasswordButton.frame = self.footerView.frame;
    [self.setPasswordButton addTarget:self action:@selector(setPasswordButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.footerView addSubview:_setPasswordButton];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];

    
    [_arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.footerView.mas_centerY).offset(0);
        make.right.equalTo(self.footerView.mas_right).offset(-30);
        make.width.equalTo(17/2);
        make.height.equalTo(29/2);
    }];

    
    [_footerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.footerView.mas_centerY).offset(0);
        make.left.equalTo(self.footerView.left).offset(56);
        make.width.equalTo(self.footerLabel.mas_width);
        make.height.equalTo(14);
    }];
    
}
- (void)setPasswordButtonClick
{
    
}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    AccountNumberCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[AccountNumberCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    NSArray *titleArr    = @[@"手机号",@"微信账号",@"QQ账号",@"新浪微博"];
    NSArray *imageArr       = @[@"binding_phoneNumber",@"binding_weChat",@"binding_qq",@"binding_weibo"];
    cell.iconImage.image = [UIImage imageNamed:imageArr[indexPath.row]];
    cell.titleLabel.text = titleArr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
