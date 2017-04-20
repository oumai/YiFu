//
//  AddBankCardVC.m
//  YiFu
//
//  Created by Michael on 16/3/18.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface AddBankCardModel  : NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface AddBankCardModel ()

@end


@implementation AddBankCardModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
    }
    return self;
}
@end





/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface AddBankCardCustomCell : UITableViewCell

@end

@interface AddBankCardCustomCell ()
@property (nonatomic, strong) UIView             *cellView;
@property (nonatomic, strong) UIImageView        *arrowImage;
@property (nonatomic, strong) UITextField        *textField;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;

@end


@implementation AddBankCardCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = KHexColor(@"#f0f0f0");//[UIColor colorWithWhite:0.f alpha:0];
        
        self.cellView = [UIView new];
        self.cellView.layer.cornerRadius = 5;
        self.cellView.layer.masksToBounds = YES;
        self.cellView.backgroundColor = KHexColor(@"#ffffff");
        [self.contentView addSubview:_cellView];
        
        
        self.arrowImage = [UIImageView new];
        [self.cellView addSubview:_arrowImage];
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.textColor = LightColor;
        [self.cellView addSubview:_titleLabel];
        
        
        self.textField = [[UITextField alloc] init];
        self.textField.font = KFontSize(14);
        self.textField.textColor = DeepColor;
//        self.textField.backgroundColor = [UIColor grayColor];
        [self.cellView addSubview:_textField];
        
        
      
        
        
        [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(10);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            
        }];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY).offset(0);
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY).offset(0);
            make.left.equalTo(self.titleLabel.mas_right).offset(20);
            make.width.equalTo(200);
            make.height.equalTo(30);
        }];

        
        [_arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY).offset(0);
            make.right.equalTo(self.cellView.mas_right).offset(-10);
            make.width.equalTo(17/2);
            make.height.equalTo(29/2);
        }];
        

        
    }
    return self;
}
@end

#import "AddBankCardVC.h"
#import "SureBindingBankCardVC.h"
@interface AddBankCardVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView           *tableView;
@property (nonatomic, strong) UIView                *footerView;
@property (nonatomic, strong) UIButton              *nextButton;
@property (nonatomic, strong) TTTAttributedLabel    *protocolLabel;
@end

@implementation AddBankCardVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加银行卡";
    self.view.backgroundColor = [UIColor whiteColor];
//    [self setRightItemImage];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 60;
    self.tableView.backgroundColor = KHexColor(@"f0f0f0");
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.frame = CGRectMake(0, 0, CoreWidth, CoreHeight);
    [self.view addSubview:_tableView];
    
  
    
    self.footerView = [UIView new];
    self.footerView.backgroundColor = KHexColor(@"f0f0f0");
    self.footerView.frame = CGRectMake(0, 0, CoreWidth, 100);
    self.tableView.tableFooterView = _footerView;
    
    
    self.protocolLabel = [TTTAttributedLabel new];
    self.protocolLabel.font = KFontSize(12);
    self.protocolLabel.textColor = DeepColor;
    [self.footerView addSubview:_protocolLabel];
    
    [_protocolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.footerView.mas_top).offset(10);
        make.left.equalTo(self.footerView.mas_left).offset(50);
        make.width.equalTo(self.protocolLabel.mas_width);
        make.height.equalTo(14);
    }];

    [self.protocolLabel setText:@"同意" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        
        NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"《用户协议》"
                                                                   attributes:@{NSForegroundColorAttributeName : KHexColor(@"#2e408a"),
                                                                                NSFontAttributeName:KFontSize(12)}];
        [mutableAttributedString appendAttributedString:yuan];
        return mutableAttributedString;
    }];
    
    
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextButton.layer.cornerRadius = 5;
    self.nextButton.layer.masksToBounds = YES;
    self.nextButton.titleLabel.font = [UIFont systemFontOfSize:12];
    self.nextButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.nextButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.nextButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.nextButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#2e408a")] forState:UIControlStateNormal];
    [self.nextButton addTarget:self action:@selector(nextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.footerView addSubview:_nextButton];
    
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.protocolLabel.mas_bottom).offset(20);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.height.equalTo(35);
    }];
    
}
- (void)nextButtonClick:(UIButton *)button
{
    SureBindingBankCardVC *sure = [SureBindingBankCardVC new];
    [self.navigationController pushViewController:sure animated:YES];
}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    AddBankCardCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[AddBankCardCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    NSArray *titleArray = @[@"卡号",@"银行",@"姓名"];
    NSArray *textAarray = @[@"请输入卡号",@"请输入银行",@"请输入姓名"];
    cell.titleLabel.text = titleArray[indexPath.row];
    cell.textField.placeholder = textAarray[indexPath.row];
    if (indexPath.row == 1) {
        cell.arrowImage.image = [UIImage imageNamed:@"arrows"];
    }
    return cell;
}


@end
