//
//  EditingAdressVC.m
//  YiFu
//
//  Created by Michael on 16/3/11.
//  Copyright © 2016年 jumper. All rights reserved.
//
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
@interface EditingAdressModel  : NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface EditingAdressModel ()

@end


@implementation EditingAdressModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
    }
    return self;
}
@end





/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface EditingAdressCustomCell : UITableViewCell

@end


@interface EditingAdressCustomCell ()
@property (nonatomic, strong) UIView             *line;
@property (nonatomic, strong) UIView             *shortLine;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) UITextField        *textFied;
//@property (nonatomic, strong) TTTAttributedLabel *phoneNumberLabel;
//@property (nonatomic, strong) TTTAttributedLabel *shengFenLabel;
@property (nonatomic, strong) UIButton           *manButton;
@property (nonatomic, strong) UIButton           *womanButton;
@end


@implementation EditingAdressCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = KHexColor(@"#ffffff");
        
        
   
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.textColor = KHexColor(@"#333333");
        self.titleLabel.font = KFontSize(14);
        [self.contentView addSubview:_titleLabel];
        
        
//        
//        self.phoneNumberLabel = [TTTAttributedLabel new];
//        self.phoneNumberLabel.textColor = KHexColor(@"#878787");
//        self.phoneNumberLabel.font = KFontSize(12);
//        self.phoneNumberLabel.text = @"1388888888";
//        [self.contentView addSubview:_phoneNumberLabel];
//        
//        self.shengFenLabel = [TTTAttributedLabel new];
//        self.shengFenLabel.textColor = KHexColor(@"#3e3a39");
//        self.shengFenLabel.font = KFontSize(14);
//        self.shengFenLabel.text = @"广东省深圳市";
//        [self.contentView addSubview:_shengFenLabel];
//        
//        
        self.line = [UIView new];
        [self.contentView addSubview:_line];
        
        self.shortLine = [UIView new];
        [self.contentView addSubview:_shortLine];
        
      

        
        
        
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.height.equalTo(0.5);
        }];
        [_shortLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(90);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.height.equalTo(0.5);
        }];


        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.line.mas_left).offset(0);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
//        [_phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(self.nameLabel.mas_centerY).offset(0);
//            make.left.equalTo(self.nameLabel.mas_right).offset(20);
//            make.width.equalTo(self.phoneNumberLabel.mas_width);
//            make.height.equalTo(14);
//        }];
//        [_shengFenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(self.contentView.mas_centerY).offset(10);
//            make.left.equalTo(self.contentView.mas_left).offset(20);
//            make.width.equalTo(self.shengFenLabel.mas_width);
//            make.height.equalTo(14);
//        }];
        
        
     }
    return self;
}
- (void)editingButtonClick:(UIButton *)button
{
    
}
@end

#import "EditingAdressVC.h"
@interface EditingAdressVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView      *headerView;
@property (nonatomic, strong) UIButton    *manButton;
@property (nonatomic, strong) UIButton    *womanButton;
@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UITextField *detailField;
@property (nonatomic, strong) UITextField *phoneField;

@property (nonatomic, strong) UIView      *footerView;
@property (nonatomic, strong) UIButton    *deleteBUtton;
@property (nonatomic, strong) UIImageView *locationImage;
@property (nonatomic, strong) UITextField *shengShiField;
@end


@implementation EditingAdressVC
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
    
    self.title = @"编辑地址";
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
    
    self.footerView = [UIView new];
    self.footerView.backgroundColor = [UIColor whiteColor];
    self.footerView.frame = CGRectMake(0, 300, CoreWidth, 50);
    [self.tableView addSubview:_footerView];
    
    
    self.deleteBUtton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.deleteBUtton.frame = CGRectMake(0, 0, CoreWidth, 50);
    self.deleteBUtton.titleLabel.font = KFontSize(15);
    [self.deleteBUtton setTitle:@"删除地址" forState:UIControlStateNormal];
    [self.deleteBUtton setTitleColor:KHexColor(@"#c10d23") forState:UIControlStateNormal];
    [self.deleteBUtton addTarget:self action:@selector(deleteBUttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.footerView addSubview:_deleteBUtton];
    
    
}
- (void)rightBarButtonItemClick
{
    
}

- (void)deleteBUttonClick
{
    
}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    EditingAdressCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[EditingAdressCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    NSArray *titleArr = @[@"联系人",@"",@"收货地址",@"门牌号",@"手机号"];
    cell.titleLabel.text = titleArr[indexPath.row];
    if (indexPath.row == 0)
    {
        cell.shortLine.backgroundColor = KHexColor(@"#e2e2e2");
        self.nameField = [UITextField new];
        self.nameField.font = KFontSize(14);
        self.nameField.frame = CGRectMake(90, 5, CoreWidth-120, 40);
        self.nameField.text =  @"付账";
        [cell addSubview:_nameField];
    }
    else
    {
        cell.line.backgroundColor = KHexColor(@"#e2e2e2");

    }
    if (indexPath.row == 1) {
        self.manButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.manButton.titleLabel.font = KFontSize(14);
        self.manButton.frame = CGRectMake(90, 5, 80, 40);
        self.manButton.tag = 100;
        [self.manButton setTitle:@"先生" forState:UIControlStateNormal];
        [self.manButton setTitleColor:KHexColor(@"#333333") forState:UIControlStateNormal];
        [self.manButton setImage:[UIImage imageNamed:@"adress_choose"] forState:UIControlStateNormal];
        [self.manButton setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [self.manButton addTarget:self action:@selector(editingButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:_manButton];
        
        
        self.womanButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.womanButton.titleLabel.font = KFontSize(14);
        self.womanButton.frame = CGRectMake(200, 5, 80, 40);
        self.womanButton.tag = 101;
        [self.womanButton setTitle:@"女士" forState:UIControlStateNormal];
        [self.womanButton setTitleColor:KHexColor(@"#333333") forState:UIControlStateNormal];
        [self.womanButton setImage:[UIImage imageNamed:@"adress_nochoose"] forState:UIControlStateNormal];
        [self.womanButton setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [self.womanButton addTarget:self action:@selector(editingButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:_womanButton];
    }
    if (indexPath.row == 2) {
        
        self.locationImage  =[UIImageView new];
        self.locationImage.frame = CGRectMake(90, 15, 15, 20);
        self.locationImage.image = [UIImage imageNamed:@"adress_location"];
        [cell addSubview:_locationImage];
        
        
        self.shengShiField = [UITextField new];
        self.shengShiField.font = KFontSize(14);
        self.shengShiField.frame = CGRectMake(120, 5, CoreWidth-120, 40);
        self.shengShiField.text = @"广东省深圳市";
        [cell addSubview:_shengShiField];
        
    }
    if (indexPath.row == 3) {
        self.nameField = [UITextField new];
        self.nameField.font = KFontSize(14);
        self.nameField.frame = CGRectMake(90, 5, CoreWidth-120, 40);
        self.nameField.text = @"宝安区西乡天虹";
        [cell addSubview:_nameField];
        
    }
    if (indexPath.row == 4) {
        self.phoneField = [UITextField new];
        self.phoneField.font = KFontSize(14);
        self.phoneField.frame = CGRectMake(90, 5, CoreWidth-120, 40);
        self.phoneField.text =  @"1582777777";
        [cell addSubview:_phoneField];
    }
    
    return cell;
}
- (void)editingButtonClick:(UIButton *)button
{
    if (button.tag == 100) {
        [self.manButton setImage:[UIImage imageNamed:@"adress_choose"] forState:UIControlStateNormal];
        [self.womanButton setImage:[UIImage imageNamed:@"adress_nochoose"] forState:UIControlStateNormal];
        button.tag = 101;

    }
     else
    {
        [self.manButton setImage:[UIImage imageNamed:@"adress_nochoose"] forState:UIControlStateNormal];
        [self.womanButton setImage:[UIImage imageNamed:@"adress_choose"] forState:UIControlStateNormal];
        button.tag = 100;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

@end
