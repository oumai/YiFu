//
//  AboutYifuVC.m
//  YiFu
//
//  Created by Michael on 16/3/8.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface AboutYifuCustomCell : UITableViewCell

@end


@interface AboutYifuCustomCell ()
@property (nonatomic, strong) UIImageView *iconImage;
@end


@implementation AboutYifuCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.iconImage = [UIImageView new];
        self.iconImage.image = [UIImage imageNamed:@"iconImage"];
        self.iconImage.layer.cornerRadius = 25;
        self.iconImage.layer.masksToBounds = YES;
        self.iconImage.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_iconImage];
        
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(00);
            make.width.equalTo(CoreWidth);
            make.height.equalTo(CoreHeight-64);
        }];
    }
    return self;
}
@end




/*------------------------------------------------------------------------------C----------------------------------------------------------------------------*/
#import "AboutYifuVC.h"
@interface AboutYifuVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation AboutYifuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于亿付";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = CoreHeight-64;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CoreHeight/2;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CoreWidth, CoreHeight/2)];
    sectionView.backgroundColor = KHexColor(@"#f0f0f0");
    
    
    UILabel *yifuForIphone = [UILabel new];
    yifuForIphone.textColor = LightColor;
    yifuForIphone.font = KFontSize(14);
    yifuForIphone.frame = CGRectMake(20, 20, 100, 14);
    yifuForIphone.text = [NSString stringWithFormat:@"亿付 For   iphone"];
    [sectionView addSubview:yifuForIphone];
    
    
    UILabel *banBenLabel = [UILabel new];
    banBenLabel.frame = CGRectMake(20, 40, 100, 14);
    banBenLabel.textColor = LightColor;
    banBenLabel.font = KFontSize(14);
    banBenLabel.text = [NSString stringWithFormat:@"版本号:1.0"];
    [sectionView addSubview:banBenLabel];
    
    UILabel *guanFangQQ = [UILabel new];
    guanFangQQ.frame = CGRectMake(20, 65, 100, 14);
    guanFangQQ.textColor = KHexColor(@"#a7b8d4");
    guanFangQQ.font = KFontSize(14);
    guanFangQQ.text = [NSString stringWithFormat:@"官方QQ:"];
    [sectionView addSubview:guanFangQQ];
    
    UILabel *guanFangWeb = [UILabel new];
    guanFangWeb.frame = CGRectMake(20, 85, 100, 14);
    guanFangWeb.textColor = KHexColor(@"#a7b8d4");//#2e408a
    guanFangWeb.font = KFontSize(14);
    guanFangWeb.text = [NSString stringWithFormat:@"官方网站"];
    [sectionView addSubview:guanFangWeb];
    

    UIImageView *image = [UIImageView new];
    image.frame = CGRectMake(CoreWidth-150, 150, 105, 82);
    image.image = [UIImage imageNamed:@"about_logo"];
    [sectionView addSubview:image];
   
    return sectionView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    AboutYifuCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[AboutYifuCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    NSArray *imageArray = @[@"about_service",@"about_pay",@"about_home"];
    cell.iconImage.image = [UIImage imageNamed:imageArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
@end
