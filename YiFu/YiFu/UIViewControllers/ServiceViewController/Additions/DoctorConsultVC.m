//
//  AccountNumberVC.m
//  YiFu
//
//  Created by Michael on 16/3/8.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface DoctorConsultModel: NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface DoctorConsultModel ()

@end


@implementation DoctorConsultModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
    }
    return self;
}
@end





/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface DoctorConsultCustomCell : UITableViewCell

@end


@interface DoctorConsultCustomCell ()
@property (nonatomic, strong) UIView             *line;
@property (nonatomic, strong) UIImageView        *iconImage;
@property (nonatomic, strong) UIImageView        *zhuanJiaImage;
@property (nonatomic, strong) TTTAttributedLabel *nameLabel;
@property (nonatomic, strong) TTTAttributedLabel *zhurenLabel;
@property (nonatomic, strong) TTTAttributedLabel *detailLabel;
@property (nonatomic, strong) UIImageView        *xingImage;
@property (nonatomic, strong) TTTAttributedLabel *fenLabel;
@property (nonatomic, strong) TTTAttributedLabel *jiezhenLiangLabel;
@property (nonatomic, strong) TTTAttributedLabel *shanchangLabel;
@property (nonatomic, strong) UIButton           *centerButton;
@property (nonatomic, strong) UIButton           *leftButton;
//@property (nonatomic, strong) UIButton           *rightButton;
@property (nonatomic, strong) UIView             *verticalLeftLine;
//@property (nonatomic, strong) UIView             *verticalrightLine;
@end


@implementation DoctorConsultCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.line = [UIView new];
        self.line.backgroundColor = KHexColor(@"#c6c6c6");
        [self.contentView addSubview:_line];
        
        
      
        
        self.iconImage = [UIImageView new];
        [self.contentView addSubview:_iconImage];
        
        
    
        self.zhuanJiaImage = [UIImageView new];
        self.zhuanJiaImage.image = [UIImage imageNamed:@"zhensuo_zhuanjia"];
        [self.contentView addSubview:_zhuanJiaImage];
        
        
            
        self.nameLabel = [TTTAttributedLabel new];
        self.nameLabel.textColor = KHexColor(@"#000000");
        self.nameLabel.font = KFontSize(16);
        self.nameLabel.text = @"姜伟";
        [self.contentView addSubview:_nameLabel];
        
        
           
        self.zhurenLabel = [TTTAttributedLabel new];
        self.zhurenLabel.textColor = DeepColor;
        self.zhurenLabel.font = KFontSize(14);
        self.zhurenLabel.text = @"主任医师";
        [self.contentView addSubview:_zhurenLabel];
        
        
        self.detailLabel = [TTTAttributedLabel new];
        self.detailLabel.textColor = DeepColor;
        self.detailLabel.font = KFontSize(14);
        self.detailLabel.text = @"北京协和医院资深医师，复旦大学黄埔区教授医师";
        [self.contentView addSubview:_detailLabel];
        
        

        
        self.xingImage = [UIImageView new];
        self.xingImage.image = [UIImage imageNamed:@"zhensuo_xing"];
        [self.contentView addSubview:_xingImage];
        
        
            
        self.fenLabel = [TTTAttributedLabel new];
        self.fenLabel.textColor = KHexColor(@"#f98f11");
        self.fenLabel.font = [UIFont boldSystemFontOfSize:12];
        self.fenLabel.text = @"9.9";
        [self.contentView addSubview:_fenLabel];
        
   
        
        self.jiezhenLiangLabel = [TTTAttributedLabel new];
        self.jiezhenLiangLabel.textColor = LightColor;
        self.jiezhenLiangLabel.font = KFontSize(12);
        self.jiezhenLiangLabel.text = [NSString stringWithFormat:@"接诊量:%@",@"1992"];
        [self.contentView addSubview:_jiezhenLiangLabel];
        
            
        
        
        
        self.shanchangLabel = [TTTAttributedLabel new];
        self.shanchangLabel.textColor = LightColor;
        self.shanchangLabel.font = KFontSize(12);
        self.shanchangLabel.text = [NSString stringWithFormat:@"擅长:%@",@"肩周炎，颈椎病，腰间盘突出,冠心病"];
        [self.contentView addSubview:_shanchangLabel];
        
          
        
        
        self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftButton.titleLabel.font = KFontSize(14);
        [self.leftButton setImage:[UIImage imageNamed:@"zhensuo_jiaoliu"] forState:UIControlStateNormal];
        [self.leftButton setImage:[UIImage imageNamed:@"zhensuo_jiaoliu"] forState:UIControlStateHighlighted];
        [self.leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        [self.leftButton setTitle:@"40" forState:UIControlStateNormal];
        [self.leftButton setTitleColor:LightColor forState:UIControlStateNormal];
        [self.contentView addSubview:_leftButton];
        
        
    
        
        
        self.verticalLeftLine = [UIView new];
        self.verticalLeftLine.backgroundColor = KHexColor(@"#c6c6c6");
        [self.contentView addSubview:_verticalLeftLine];
        
        
   
        self.centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.centerButton.titleLabel.font = KFontSize(14);
        [self.centerButton setImage:[UIImage imageNamed:@"zhensuo_iphone"] forState:UIControlStateNormal];
        [self.centerButton setImage:[UIImage imageNamed:@"private_back"] forState:UIControlStateHighlighted];
        [self.centerButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        [self.centerButton setTitle:@"160" forState:UIControlStateNormal];
//        [self.centerButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        [self.centerButton setTitleColor:LightColor forState:UIControlStateNormal];
        [self.contentView addSubview:_centerButton];
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(10);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.width.equalTo(60);
            make.height.equalTo(60);
        }];
        [_zhuanJiaImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImage.mas_bottom).offset(15);
            make.centerX.equalTo(self.iconImage.mas_centerX).offset(0);
            make.width.equalTo(142/2);
            make.height.equalTo(69/2);
        }];
        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImage.mas_top).offset(0);
            make.left.equalTo(self.iconImage.mas_right).offset(15);
            make.width.equalTo(self.nameLabel.mas_width);
            make.height.equalTo(16);
        }];
        [_zhurenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.nameLabel.mas_bottom).offset(0);
            make.left.equalTo(self.nameLabel.mas_right).offset(10);
            make.width.equalTo(self.zhurenLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.iconImage.mas_centerY).offset(0);
            make.left.equalTo(self.nameLabel.mas_left).offset(0);
            make.width.equalTo(CoreWidth-80);
            make.height.equalTo(14);
        }];
        
        [_xingImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.detailLabel.mas_bottom).offset(3);
            make.left.equalTo(self.nameLabel.mas_left).offset(0);
            make.width.equalTo(15);
            make.height.equalTo(15);
        }];
        
        [_fenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.xingImage.mas_centerY).offset(2);
            make.left.equalTo(self.xingImage.mas_right).offset(10);
            make.width.equalTo(self.fenLabel.mas_width);
            make.height.equalTo(14);
        }];
        [_jiezhenLiangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.fenLabel.mas_centerY).offset(0);
            make.left.equalTo(self.fenLabel.mas_right).offset(10);
            make.width.equalTo(self.jiezhenLiangLabel.mas_width);
            make.height.equalTo(14);
        }];
        [_shanchangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.xingImage.mas_bottom).offset(5);
            make.left.equalTo(self.detailLabel.mas_left).offset(0);
            make.width.equalTo(CoreWidth-80);
            make.height.equalTo(14);
        }];
        
        [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.shanchangLabel.mas_bottom).offset(5);
            make.left.equalTo(self.iconImage.mas_right).offset(10);
            make.width.equalTo(60);
            make.height.equalTo(30);
        }];
        [_verticalLeftLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.leftButton.mas_centerY).offset(0);
            make.left.equalTo(self.leftButton.mas_right).offset(10);
            make.width.equalTo(0.5);
            make.height.equalTo(20);
        }];
        
        
        [_centerButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.leftButton.mas_centerY).offset(0);
            make.left.equalTo(self.verticalLeftLine.mas_left).offset(10);
            make.width.equalTo(60);
            make.height.equalTo(30);
        }];
        
        
        
//        self.verticalrightLine = [UIView new];
//        self.verticalrightLine.backgroundColor = KHexColor(@"#c6c6c6");
//        [self.contentView addSubview:_verticalrightLine];
        
        
//        [_verticalrightLine mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(self.centerButton.mas_centerY).offset(0);
//            make.left.equalTo(self.centerButton.mas_right).offset(10);
//            make.width.equalTo(0.5);
//            make.height.equalTo(20);
//        }];
        
//        self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.rightButton.titleLabel.font = KFontSize(14);
//        [self.rightButton setImage:[UIImage imageNamed:@"private_back"] forState:UIControlStateNormal];
//        [self.rightButton setImage:[UIImage imageNamed:@"private_back"] forState:UIControlStateHighlighted];
//        [self.rightButton setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
//        [self.rightButton setTitle:@"未开通" forState:UIControlStateNormal];
//        [self.rightButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
//        [self.rightButton setTitleColor:LightColor forState:UIControlStateNormal];
//        [self.contentView addSubview:_rightButton];
//        
//        
//        [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.equalTo(self.contentView.mas_bottom).offset(-20);
//            make.left.equalTo(self.verticalrightLine.mas_right).offset(10);
//            make.width.equalTo(80);
//            make.height.equalTo(30);
//        }];


        
    }
    return self;
}
@end



#import "DoctorConsultVC.h"
@interface DoctorConsultVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView        *tableView;
@property (nonatomic, strong) UIView             *footerView;
@property (nonatomic, strong) TTTAttributedLabel *footerLabel;
@property (nonatomic, strong) UIImageView        *arrowImage;
@property (nonatomic, strong) UIButton           *setPasswordButton;
@end

@implementation DoctorConsultVC

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
    self.title = @"医生咨询";
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
    return 125;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    DoctorConsultCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[DoctorConsultCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
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
