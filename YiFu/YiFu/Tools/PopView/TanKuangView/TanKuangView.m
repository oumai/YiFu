//
//  TanKuangView.m
//  YiFu
//
//  Created by Michael on 16/3/9.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface TanKuangModel  : NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface TanKuangModel ()

@end


@implementation TanKuangModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
    }
    return self;
}
@end





/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface TanKuangCustomCell : UITableViewCell
@property (nonatomic, strong) void(^buttonClickBlock)(TanKuangCustomCell *);
@end


@interface TanKuangCustomCell ()
@property (nonatomic, strong) UIView                *line;
@property (nonatomic, strong) UIImageView           *iconImage;
@property (nonatomic, strong) TTTAttributedLabel    *titleLabel;
@property (nonatomic, strong) UIButton *buttonClick;
@end


@implementation TanKuangCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor colorWithWhite:0.f alpha:0];
        self.userInteractionEnabled = YES;
        self.iconImage = [UIImageView   new];
//        self.iconImage.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_iconImage];
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.textColor = KHexColor(@"#ffffff");
        self.titleLabel.font = KFontSize(14);
        [self.contentView addSubview:_titleLabel];
        
        
        self.line = [UIView new];
        self.line.backgroundColor = KHexColor(@"#31374f");
        [self.contentView addSubview:_line];
        
        self.buttonClick = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.buttonClick addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_buttonClick];
        
        
        [_buttonClick mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self.contentView);
        }];
        
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.width.equalTo(20);
            make.height.equalTo(21);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.iconImage.mas_right).offset(10);
            make.width.equalTo(CoreWidth-50);
            make.height.equalTo(14);
        }];
        
        
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-1);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(0.5);
        }];
        
        
        
    }
    return self;
}

- (void)buttonClick:(UIButton *)button
{
    if (self.buttonClickBlock) {
        self.buttonClickBlock(self);
    }
}
@end

/*-----------------------------------------------------------------------------C----------------------------------------------------------------------------*/
#import "TanKuangView.h"
#import "AffectionAccountVC.h"
#import "HelpVC.h"
#import "MyQrCodeVC.h"
#import "CheckOrderVC.h"
@interface TanKuangView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIImageView *bgImage;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@end


@implementation TanKuangView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        
        
        
        
        self.frame = frame;
        self.backgroundColor = [UIColor clearColor];
        self.bgImage = [UIImageView new];
        self.bgImage.image = [UIImage imageNamed:@"tanKuang"];
        self.bgImage.frame = CGRectMake(0, 0, 180, 164);
        [self addSubview:_bgImage];
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.showsVerticalScrollIndicator = NO;
        self.tableView.scrollEnabled = NO;
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgImage.mas_top).offset(5);
            make.left.equalTo(self.bgImage.mas_left).offset(5);
            make.bottom.equalTo(self.bgImage.mas_bottom).offset(-5);
            make.right.equalTo(self.bgImage.mas_right).offset(-5);

        }];
        
        
        
    }
    return self;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"tanCell";
    TanKuangCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[TanKuangCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    NSArray *array = @[@"查看订单",@"亲情账户",@"我的二维码",@"帮助"];
    NSArray *imageArray = @[@"tanKuang_chakandingdan",@"tankuang_kinship",@"tankuang_erweima",@"tankuang_help"];
    cell.titleLabel.text = array[indexPath.row];
    cell.iconImage.image = [UIImage imageNamed:imageArray[indexPath.row]];
    
    [cell setButtonClickBlock:^(TanKuangCustomCell *ce) {
        if (indexPath.row == 0) {
            CheckOrderVC *aff = [CheckOrderVC new];
            [self.navigation pushViewController:aff animated:YES];
        }
        else if (indexPath.row == 1)
        {
            AffectionAccountVC *aff = [AffectionAccountVC new];
            [self.navigation pushViewController:aff animated:YES];
        }
        else if (indexPath.row == 2)
        {
            MyQrCodeVC *aff = [MyQrCodeVC new];
            [self.navigation pushViewController:aff animated:YES];
        }
        else if (indexPath.row == 3)
        {
            HelpVC *aff = [HelpVC new];
            [self.navigation pushViewController:aff animated:YES];
        }
        
        if (self.tankuangDismissBlock) {
            self.tankuangDismissBlock(self);
        }
    }];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

@end
