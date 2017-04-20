//
//  ServiceViewController.m
//  YiFu
//
//  Created by Michael on 16/3/7.
//  Copyright © 2016年 jumper. All rights reserved.
//


/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
#import <UIKit/UIKit.h>
@interface ServiceModel : NSObject

@property(nonatomic,strong)NSString *iconName;
@property(nonatomic,strong)NSString *titleName;
@property(nonatomic,strong)Class cls;
@end


@interface ServiceModel ()

@end


@implementation ServiceModel



@end

/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface ServiceCustomCell : UITableViewCell

@property(nonatomic,strong)ServiceCustomCell *allData;
@property (nonatomic, strong) void(^leftButtonBlock)(ServiceCustomCell *);
@property (nonatomic, strong) void(^rightButtonBlock)(ServiceCustomCell *);

@end


@interface ServiceCustomCell ()
@property (nonatomic, strong) UIImageView  *titleImage;
@property (nonatomic, strong) UIButton     *leftButton;
@property (nonatomic, strong) UIButton     *rightButon;
@end

@implementation ServiceCustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ( self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        self.titleImage = [UIImageView new];
        self.titleImage.image = [UIImage imageNamed:@"service_yiliao"];
        [self.contentView addSubview:_titleImage];
        
        
        self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftButton.layer.cornerRadius = 3;
        self.leftButton.layer.masksToBounds = YES;
        self.leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
        self.leftButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.leftButton setImage:[UIImage imageNamed:@"service_guahao"] forState:UIControlStateNormal];
        [self.leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
        [self.leftButton setTitle:@"挂号就诊" forState:UIControlStateNormal];
        [self.leftButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
        [self.leftButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithWhite:0.f alpha:0.3]] forState:UIControlStateNormal];
        [self.leftButton addTarget:self action:@selector(leftnButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_leftButton];
        
    
        
        self.rightButon = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightButon.layer.cornerRadius = 3;
        self.rightButon.layer.masksToBounds = YES;
        self.rightButon.titleLabel.font = [UIFont systemFontOfSize:14];
        self.rightButon.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.rightButon setImage:[UIImage imageNamed:@"service_guahao"] forState:UIControlStateNormal];
        [self.rightButon setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
        [self.rightButon setTitle:@"挂号就诊" forState:UIControlStateNormal];
        [self.rightButon setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
        [self.rightButon setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithWhite:0.f alpha:0.3]] forState:UIControlStateNormal];
        [self.rightButon addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_rightButon];
        
        [_titleImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(121);
        }];
        [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleImage.mas_bottom).offset(10);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.right.equalTo(self.contentView.mas_centerX).offset(-2.5);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        }];
        [_rightButon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleImage.mas_bottom).offset(10);
            make.left.equalTo(self.contentView.mas_centerX).offset(2.5);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        }];
        
       
    }
    return self;
}


- (void)setAllData:(ServiceModel *)allData
{
    if (nil == allData) {
        return;
    }
}
- (void)leftnButtonClick:(UIButton *)button
{
    if (self.leftButtonBlock) {
        self.leftButtonBlock(self);
    }
}
- (void)rightButtonClick:(UIButton *)button
{
    if (self.rightButtonBlock) {
        self.rightButtonBlock(self);
    }
}
@end


/*-----------------------------------------------------------------------------C----------------------------------------------------------------------------*/
#import "ServiceViewController.h"
#import "MyCustomVC.h"
#import "PrivateCustomVC.h"
#import "DoctorConsultVC.h"
#import "GuaHaoJiuZhenVC.h"
@interface ServiceViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIImageView  *bgImage;
@property (nonatomic, strong) UITableView  *tableView;
@property (nonatomic, strong) NSDictionary *infoDic;
@property (nonatomic, strong) UIView       *headerView;
@property (nonatomic, strong) UIImageView  *headerImage;
@property (nonatomic, strong) UIImageView  *professionalImage;
@property (nonatomic, strong) UIButton     *noToMakeCustomButton;
@property (nonatomic, strong) UIButton     *nomalFunctionButton;
@property (nonatomic, strong) UILabel      *titleLabel;
@property (nonatomic, strong) UIButton     *addButotn;
@end

@implementation ServiceViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.bgImage = [UIImageView new];
    self.bgImage.image = [UIImage imageNamed:@"my_bg"];
    self.bgImage.frame = self.view.frame;
    [self.view addSubview:_bgImage];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 210;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];

   
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
    }];
    [self makeHeaderView];

}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
       return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ServiceCustomCell_cell";
    ServiceCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[ServiceCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSArray *titleImageArr = @[@"service_yiliao",@"service_chezhu",@"service_shicai"];
    NSArray *leftImageArr  = @[@"service_guahao",@"service_weizhang",@"service_youji"];
    NSArray *rightImageArr = @[@"service_consult",@"service_jiashizheng",@"service_lingshi"];
    NSArray *leftTitleArr  = @[@"挂号就诊",@"违章提醒",@"有机生鲜"];
    NSArray *rightTitleArr = @[@"医生咨询",@"驾驶证扣分",@"零食天地"];
    cell.titleImage.image  = [UIImage imageNamed:titleImageArr[indexPath.row]];
    [cell.leftButton setTitle:leftTitleArr[indexPath.row] forState:UIControlStateNormal];
    [cell.rightButon setTitle:rightTitleArr[indexPath.row] forState:UIControlStateNormal];
    [cell.leftButton setImage:[UIImage imageNamed:leftImageArr[indexPath.row]] forState:UIControlStateNormal];
    [cell.rightButon setImage:[UIImage imageNamed:rightImageArr[indexPath.row]] forState:UIControlStateNormal];
    [cell setLeftButtonBlock:^(ServiceCustomCell *leftBlock) {
        GuaHaoJiuZhenVC *gua = [GuaHaoJiuZhenVC new];
        [self.navigationController pushViewController:gua animated:YES];
    }];
    [cell setRightButtonBlock:^(ServiceCustomCell *rightBlock) {
        DoctorConsultVC *doctor = [DoctorConsultVC new];
        [self.navigationController pushViewController:doctor animated:YES];
    }];
    return cell;
}

#pragma mark ------------------------------------------------------------------makeHeaderView---------------------------------------------------------------
- (void)makeHeaderView
{
    self.headerView = [UIView new];
    self.headerView.backgroundColor = [UIColor clearColor];
    self.headerView.frame = CGRectMake(0, 0, CoreWidth, 560);
    self.tableView.tableHeaderView = _headerView;
    
    self.headerImage = [UIImageView new];
    self.headerImage.frame = CGRectMake(0, 0, CoreWidth, 833/2);
    self.headerImage.image = [UIImage imageNamed:@"service_bg_header"];
    [self.headerView addSubview:_headerImage];
    
    self.professionalImage = [UIImageView new];
    self.professionalImage.frame = CGRectMake((CoreWidth-170)/2, 385, 170, 61);
    self.professionalImage.image = [UIImage imageNamed:@"service_professional"];
    [self.headerView addSubview:_professionalImage];
    
    self.noToMakeCustomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.noToMakeCustomButton.layer.cornerRadius = 3;
    self.noToMakeCustomButton.layer.masksToBounds = YES;
    self.noToMakeCustomButton.layer.borderWidth = 1;
    self.noToMakeCustomButton.layer.borderColor = KHexColor(@"#ffffff").CGColor;
    self.noToMakeCustomButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    self.noToMakeCustomButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.noToMakeCustomButton setTitle:@"暂无定制,选择定制" forState:UIControlStateNormal];
    [self.noToMakeCustomButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.noToMakeCustomButton addTarget:self action:@selector(noToMakeCustomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:_noToMakeCustomButton];
    
    
    self.nomalFunctionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nomalFunctionButton.layer.cornerRadius = 3;
    self.nomalFunctionButton.layer.masksToBounds = YES;
    self.nomalFunctionButton.layer.borderWidth = 1;
    self.nomalFunctionButton.layer.borderColor = KHexColor(@"#ffffff").CGColor;
    self.nomalFunctionButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    self.nomalFunctionButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.nomalFunctionButton setTitle:@"常用功能" forState:UIControlStateNormal];
    [self.nomalFunctionButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.nomalFunctionButton addTarget:self action:@selector(nomalFunctionButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:_nomalFunctionButton];
    
  
    
    self.titleLabel = [TTTAttributedLabel new];
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.textColor = KHexColor(@"#b3b3b5");
    self.titleLabel.text = @"定制·精选频道";
    [self.headerView addSubview:_titleLabel];
    
    self.addButotn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addButotn setImage:[UIImage imageNamed:@"service_add"] forState:UIControlStateNormal];
    [self.addButotn addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_addButotn];
    
    [_addButotn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.width.equalTo(60);
        make.height.equalTo(60);
    }];

    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerView.mas_centerX).offset(0);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(-10);
        make.width.equalTo(self.titleLabel.mas_width);
        make.height.equalTo(14);
    }];

    
    [_noToMakeCustomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.professionalImage.mas_bottom).offset(30);
        make.left.equalTo(self.headerView.mas_left).offset(30);
        make.right.equalTo(self.headerView.mas_centerX).offset(20);
        make.height.equalTo(40);
    }];

    
    [_nomalFunctionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.professionalImage.mas_bottom).offset(30);
        make.left.equalTo(self.noToMakeCustomButton.mas_right).offset(15);
        make.right.equalTo(self.headerView.mas_right).offset(-30);
        make.height.equalTo(40);
    }];
}
#pragma mark ------------------------------------------------------------------ActionsButton---------------------------------------------------------------
- (void)noToMakeCustomButtonClick:(UIButton *)button
{
    PrivateCustomVC *private = [PrivateCustomVC new];
    [self.navigationController pushViewController:private animated:YES];
}
- (void)nomalFunctionButtonClick:(UIButton *)button
{
    MyCustomVC *my = [MyCustomVC new];
    [self.navigationController pushViewController:my animated:YES];
}
- (void)addButtonClick:(UIButton *)button
{
    PrivateCustomVC *private = [PrivateCustomVC new];
    [self.navigationController pushViewController:private animated:YES];
}

@end


