//
//  AccountNumberVC.m
//  YiFu
//
//  Created by Michael on 16/3/8.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface GuaHaoJiuZhenModel: NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface GuaHaoJiuZhenModel ()

@end


@implementation GuaHaoJiuZhenModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
    }
    return self;
}
@end





/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface GuaHaoJiuZhenCustomCell : UITableViewCell

@end


@interface GuaHaoJiuZhenCustomCell ()
@property (nonatomic, strong) UIView             *line;
@property (nonatomic, strong) UIImageView        *iconImage;
@property (nonatomic, strong) TTTAttributedLabel *detailLabel;
@property (nonatomic, strong) TTTAttributedLabel *fenLabel;
@property (nonatomic, strong) TTTAttributedLabel *shanchangLabel;
@end


@implementation GuaHaoJiuZhenCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.line = [UIView new];
        self.line.backgroundColor = KHexColor(@"#c6c6c6");
        [self.contentView addSubview:_line];
        
        
        
        
        self.iconImage = [UIImageView new];
        [self.contentView addSubview:_iconImage];
        
        
        
        self.detailLabel = [TTTAttributedLabel new];
        self.detailLabel.textColor = DeepColor;
        self.detailLabel.font = KFontSize(14);
        self.detailLabel.text = @"湖北省武汉市协和医院";
        [self.contentView addSubview:_detailLabel];
        
        
        
        
        
        
        
        self.fenLabel = [TTTAttributedLabel new];
        self.fenLabel.textColor = KHexColor(@"#f98f11");
        self.fenLabel.font = [UIFont boldSystemFontOfSize:12];
        self.fenLabel.text = @"[三级甲等]";
        [self.contentView addSubview:_fenLabel];
        
        
        
        
        
        self.shanchangLabel = [TTTAttributedLabel new];
        self.shanchangLabel.textColor = LightColor;
        self.shanchangLabel.font = KFontSize(12);
        self.shanchangLabel.text = [NSString stringWithFormat:@"预定量:%@",@"1.44万"];
        [self.contentView addSubview:_shanchangLabel];
        
        
        

        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.width.equalTo(60);
            make.height.equalTo(60);
        }];
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImage.mas_top).offset(0);
            make.left.equalTo(self.iconImage.mas_right).offset(10);
            make.width.equalTo(self.detailLabel.mas_width);
            make.height.equalTo(14);
        }];
        [_shanchangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.detailLabel.mas_left).offset(0);
            make.width.equalTo(self.shanchangLabel.mas_width);
            make.height.equalTo(14);
        }];

        
        [_fenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.iconImage.mas_bottom).offset(0);
            make.left.equalTo(self.detailLabel.mas_left).offset(0);
            make.width.equalTo(self.fenLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        
        
        
        
        
        
    }
    return self;
}
@end



#import "GuaHaoJiuZhenVC.h"
@interface GuaHaoJiuZhenVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView        *tableView;
@property (nonatomic, strong) UIView             *footerView;
@property (nonatomic, strong) TTTAttributedLabel *footerLabel;
@property (nonatomic, strong) UIImageView        *arrowImage;
@property (nonatomic, strong) UIButton           *setPasswordButton;
@end

@implementation GuaHaoJiuZhenVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.tabBarController.tabBar.hidden = YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = KHexColor(@"#f2f2f2");
    self.title = @"挂号就诊";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = BackgroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
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
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    GuaHaoJiuZhenCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[GuaHaoJiuZhenCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    NSArray *titleArr    = @[@"手机号",@"微信账号",@"QQ账号",@"新浪微博"];
    NSArray *imageArr       = @[@"binding_phoneNumber",@"binding_weChat",@"binding_qq",@"binding_weibo"];
    cell.iconImage.image = [UIImage imageNamed:imageArr[indexPath.row]];
    //    cell.titleLabel.text = titleArr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
