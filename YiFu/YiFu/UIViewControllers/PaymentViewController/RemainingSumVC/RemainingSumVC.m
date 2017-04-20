//
//  AccountNumberVC.m
//  YiFu
//
//  Created by Michael on 16/3/8.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface RemainingSumModel: NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface RemainingSumModel ()

@end


@implementation RemainingSumModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
    }
    return self;
}
@end





/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface RemainingSumCustomCell : UITableViewCell

@end


@interface RemainingSumCustomCell ()
@property (nonatomic, strong) UIView             *line;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel *remainMoneyLabel;
@property (nonatomic, strong) UIImageView        *arrowImage;
@end


@implementation RemainingSumCustomCell
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
            make.width.equalTo(self.titleLabel.mas_width);
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



#import "RemainingSumVC.h"

@interface RemainingSumVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView        *tableView;
@end

@implementation RemainingSumVC

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
    self.title = @"账户余额";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = KHexColor(@"#f2f2f2");
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
      [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
    
}
- (void)setPasswordButtonClick
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
    RemainingSumCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[RemainingSumCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    NSArray *titleArr    = @[@"账户余额",@"充值",@"余额转出"];
    cell.titleLabel.text = titleArr[indexPath.row];
    if (indexPath.row == 0) {
        cell.remainMoneyLabel.text = @"10.0";
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
