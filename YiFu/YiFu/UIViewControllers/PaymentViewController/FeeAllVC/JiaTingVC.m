//
//  JiaTingVC.m
//  YiFu
//
//  Created by Michael on 16/3/30.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface JiaTingCustomCell : UITableViewCell

@end


@interface JiaTingCustomCell ()
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) UIImageView *chooseImage;
@end

@implementation JiaTingCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.chooseImage = [UIImageView new];
        self.chooseImage.image = [UIImage imageNamed:@"noChoose"];
        self.chooseImage.layer.cornerRadius = 25;
        self.chooseImage.layer.masksToBounds = YES;
        self.chooseImage.frame = CGRectMake(CoreWidth - 20-37 , 4,37, 37);
        [self.contentView addSubview:_chooseImage];
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.textColor = KHexColor(@"#333333");
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.frame = CGRectMake(10, 15.5, 28, 14);
        [self.contentView addSubview:_titleLabel];

        
        self.line = [UIView new];
        self.line.backgroundColor = KHexColor(@"#999999");
        [self.contentView addSubview:_line];
        
        
        
//        [_chooseImage mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
//            make.right.equalTo(self.contentView.mas_right).offset(-20);
//            make.width.equalTo(37);
//            make.height.equalTo(37);
//        }];
//        
//        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
//            make.left.equalTo(self.contentView.mas_left).offset(10);
//            make.width.equalTo(self.titleLabel.mas_width);
//            make.height.equalTo(14);
//        }];
        
        
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-1);
            make.left.equalTo(self.titleLabel.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
    }
    return self;
}
@end




/*------------------------------------------------------------------------------C----------------------------------------------------------------------------*/
#import "JiaTingVC.h"
@interface JiaTingVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, assign) NSInteger     selectedRow;
@property (nonatomic, strong) UIButton      *saveButton;
@property (nonatomic, strong) UIView        *cellBgView;
@end


@implementation JiaTingVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"家庭";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 45;
    self.tableView.backgroundColor = BackgroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
    
    self.cellBgView = [UIView new];
    self.cellBgView.backgroundColor = BackgroundColor;
    self.cellBgView.frame = CGRectMake(0, 180, CoreWidth, 25);
    [self.tableView addSubview:_cellBgView];

    
    self.saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.saveButton.layer.cornerRadius = 5;
    self.saveButton.layer.masksToBounds = YES;
    self.saveButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.saveButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [self.saveButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.saveButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#2e408a")] forState:UIControlStateNormal];
    [self.saveButton addTarget:self action:@selector(saveButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:_saveButton];
    
    [_saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.mas_top).offset(300);
        make.centerX.equalTo(self.tableView.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth*3/4);
        make.height.equalTo(40);
    }];

}
- (void)saveButtonClick:(UIButton *)button
{
    
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row == 4 ? 70 : 45;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"basicCell";
    JiaTingCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[JiaTingCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSArray *titleArray = @[@"我家",@"父母",@"房东",@"朋友",@"新增"];
    cell.titleLabel.text = titleArray[indexPath.row];
    
    if (indexPath.row == 4) {
        
        
        UITextField *textTF = [UITextField new];
        textTF.placeholder = @"自定义家庭名称";
        textTF.frame = CGRectMake(40, 37.5, 200, 20);
        textTF.font = KFontSize(14);
        [cell addSubview:textTF];
        
        cell.titleLabel.frame = CGRectMake(10, 37.5, 28, 14);
        cell.chooseImage.frame = CGRectMake(CoreWidth - 20-37 , 25+4,37, 37);
    }
    if (indexPath.row == _selectedRow) {
        cell.chooseImage.image = [UIImage imageNamed:@"choose"];
    }
    else
    {
        cell.chooseImage.image = [UIImage imageNamed:@"noChoose"];

    }
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedRow = indexPath.row;
    [_tableView reloadData];
}
@end
