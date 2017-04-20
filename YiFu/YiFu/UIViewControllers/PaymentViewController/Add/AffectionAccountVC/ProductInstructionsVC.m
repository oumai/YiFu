//
//  ProductInstructionsVC.m
//  YiFu
//
//  Created by Michael on 16/3/15.
//  Copyright © 2016年 jumper. All rights reserved.
//

//
//  AccountNumberVC.m
//  YiFu
//
//  Created by Michael on 16/3/8.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface ProductInstructionsModel: NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface ProductInstructionsModel ()

@end


@implementation ProductInstructionsModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
    }
    return self;
}
@end





/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface ProductInstructionsCustomCell : UITableViewCell

@end


@interface ProductInstructionsCustomCell ()
@property (nonatomic, strong) UIView             *line;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel *remainMoneyLabel;
@property (nonatomic, strong) UIImageView        *arrowImage;
@end


@implementation ProductInstructionsCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.textColor = DeepColor;
        self.titleLabel.font = KFontSize(14);
        [self.contentView addSubview:_titleLabel];
        
        
        self.remainMoneyLabel = [TTTAttributedLabel new];
        self.remainMoneyLabel.textColor = LightColor;
        self.remainMoneyLabel.font = KFontSize(14);
        [self.contentView addSubview:_remainMoneyLabel];
        
        
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
        
        
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.contentView.left).offset(15);
            make.width.equalTo(CoreWidth-50);
            make.height.equalTo(14);
        }];
        
        
        [_remainMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_top).offset(0);
            make.right.equalTo(self.arrowImage.mas_left).offset(-15);
            make.width.equalTo(self.remainMoneyLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        
        
    }
    return self;
}
@end



#import "ProductInstructionsVC.h"
#import "HelpVC.h"
@interface ProductInstructionsVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView        *tableView;
@property (nonatomic, strong) UIView             *headerView;
@property (nonatomic, strong) TTTAttributedLabel *shippingLabel;
@property (nonatomic, strong) TTTAttributedLabel *weitapayLabel;
@property (nonatomic, strong) UIButton           *helpButton;

@end

@implementation ProductInstructionsVC

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
    self.title = @"产品说明";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = KHexColor(@"#f2f2f2");
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
    self.headerView = [UIView new];
    self.headerView.backgroundColor = KHexColor(@"#f0f0f0");
    self.headerView.frame = CGRectMake(0, 0, CoreWidth, 100);
    self.tableView.tableHeaderView = _headerView;
    
    self.shippingLabel = [TTTAttributedLabel new];
    self.shippingLabel.textColor = LightColor;
    self.shippingLabel.font = KFontSize(14);
    self.shippingLabel.text = @"亲情账户可为他人注册新账户，开通存入亿付钱包";
    [self.headerView addSubview:_shippingLabel];
    
    [_shippingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerView.mas_centerX).offset(0);
        make.top.equalTo(self.headerView.mas_top).offset(15);
        make.width.equalTo(self.shippingLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    
    self.weitapayLabel = [TTTAttributedLabel new];
    self.weitapayLabel.textColor = LightColor;
    self.weitapayLabel.font = KFontSize(14);
    self.weitapayLabel.text = @"为Ta亲密支付，支付无忧";
    [self.headerView addSubview:_weitapayLabel];
    
    [_weitapayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerView.mas_centerX).offset(0);
        make.top.equalTo(self.shippingLabel.mas_bottom).offset(10);
        make.width.equalTo(self.weitapayLabel.mas_width);
        make.height.equalTo(14);
    }];

    self.helpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.helpButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.helpButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.helpButton.frame = CGRectMake(20, 70, 50, 30);
    [self.helpButton setTitle:@"帮助" forState:UIControlStateNormal];
    [self.helpButton setTitleColor:LightColor forState:UIControlStateNormal];
    [self.helpButton addTarget:self action:@selector(helpButtonButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:_helpButton];
}
- (void)helpButtonButtonClick:(UIButton *)button
{
    
}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    ProductInstructionsCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[ProductInstructionsCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    NSArray *titleArr    = @[@"加急费加咖啡及刻录机水电费蒋介石的放假快乐就借款方的抗衰老克拉克的反馈",@"充值阿斯达克反馈",@"余额发顺丰就看空间转出"];
    cell.titleLabel.text = titleArr[indexPath.row];
    //    if (indexPath.row == 0) {
    //        cell.remainMoneyLabel.text = @"10.0";
    //    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HelpVC *help = [HelpVC new];
    [self.navigationController pushViewController:help animated:YES];
}

@end
