//
//  HelpDetailVC.m
//  YiFu
//
//  Created by Michael on 16/4/7.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface HelpDetailCustomCell: UITableViewCell

@end


@interface HelpDetailCustomCell ()
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel *detailLabel;
@property (nonatomic, strong) UIImageView *iconImage;
@end

@implementation HelpDetailCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        self.iconImage = [UIImageView new];
        self.iconImage.image = [UIImage imageNamed:@"help_duigou"];
        self.iconImage.layer.cornerRadius = 10;
        self.iconImage.layer.masksToBounds = YES;
        [self.contentView addSubview:_iconImage];
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.textColor = KHexColor(@"#333333");
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.text = @"亲密付介绍";
        [self.contentView addSubview:_titleLabel];
        
        
        
        
        self.detailLabel = [TTTAttributedLabel new];
        self.detailLabel.textColor = KHexColor(@"#666666");
        self.detailLabel.font = KFontSize(12);
        self.detailLabel.lineSpacing = 5;
        self.detailLabel.numberOfLines = 0;
        self.detailLabel.text = @"缴费卡健身房靠接口老师讲风口浪尖的讲风口浪尖的萨克拉房间看鹿鼎记是分开了骄傲的顺口溜房间爱打瞌睡缴费卡拉丁就是咖啡骄傲的萨克拉房间看鹿鼎记是分开了骄傲的顺口溜房间爱打瞌睡缴费卡拉丁就是咖啡骄傲的克里斯就付款";
        [self.contentView addSubview:_detailLabel];
        
        
        
        self.line = [UIView new];
        self.line.backgroundColor = KHexColor(@"#999999");
        [self.contentView addSubview:_line];
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.top.equalTo(self.contentView.mas_top).offset(10);
            make.width.equalTo(20);
            make.height.equalTo(20);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.iconImage.mas_centerY).offset(0);
            make.left.equalTo(self.iconImage.mas_right).offset(10);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(40);
            make.left.equalTo(self.titleLabel.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];

        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.line.mas_bottom).offset(15);
            make.left.equalTo(self.iconImage.mas_right).offset(10);
            make.width.equalTo(CoreWidth-70);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        }];
        
    }
    return self;
}
@end




/*------------------------------------------------------------------------------C----------------------------------------------------------------------------*/
#import "HelpDetailVC.h"

@interface HelpDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HelpDetailVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KHexColor(@"#f2f2f2");
    self.title = @"我的客服——帮助";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 150;
    self.tableView.backgroundColor =  KHexColor(@"#f2f2f2");
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(10);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-10);

    }];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"basicCell";
    HelpDetailCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[HelpDetailCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
    
}



#pragma mark ------------------------------------------------------------------AFNetworking-------------------------------------------------
- (void)requestData
{
    
    
    AFHTTPSessionManager *sessionManagerC = [AFHTTPSessionManager manager];
    sessionManagerC.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [sessionManagerC GET:YiFuUrl(@"yf/yf_main/help_detail") parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        k_NSlogHUD(@"帮助详情");
        
        NSLog(@"responseObject === %@",responseObject);
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}

@end
