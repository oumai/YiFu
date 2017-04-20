//
//  AccountNumberVC.m
//  YiFu
//
//  Created by Michael on 16/3/8.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface HelpModel: NSObject
@property (nonatomic, strong) NSString *app_help_content;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface HelpModel ()

@end


@implementation HelpModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        if ([dic objectForKey:@"app_help_content"] ) {
            self.app_help_content =[dic objectForKey:@"app_help_content"] ;
        }
    }
    return self;
}
@end


/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface HelpItemModel: NSObject

@property (nonatomic, strong) NSString *app_help_title;
- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end


@interface HelpItemModel ()

@end


@implementation HelpItemModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
        
        if ([dic objectForKey:@"app_help_title"]) {
            self.app_help_title =[dic objectForKey:@"app_help_title"] ;
        }
    }
    return self;
}
@end



/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
#define identifierItem @"HelpCustomItem"
@interface HelpCustomItem : UICollectionViewCell
@property (nonatomic, strong) HelpItemModel *itemModel;
@end

@interface HelpCustomItem ()
@property (nonatomic, strong) UIButton *helpButton;
@end

@implementation HelpCustomItem


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.helpButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.helpButton.layer.borderColor = LineColor.CGColor;
        self.helpButton.layer.borderWidth = 0.5;
        self.helpButton.titleLabel.font = KFontSize(14);
        [self.helpButton setTitle:@"全部问题" forState:UIControlStateNormal];
        [self.helpButton setTitleColor:DeepColor forState:UIControlStateNormal];
        [self.contentView addSubview:_helpButton];
        
        
        [_helpButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        }];
    }
    return self;
}
- (void)setItemModel:(HelpItemModel *)itemModel
{
    if (nil == itemModel) {
        return;
    }
    [self.helpButton setTitle:itemModel.app_help_title forState:UIControlStateNormal];
}
@end

@interface HelpCustomCell : UITableViewCell

@property (nonatomic, strong) HelpModel *model;
@end


@interface HelpCustomCell ()
@property (nonatomic, strong) UIView             *line;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel *remainMoneyLabel;
@property (nonatomic, strong) UIImageView        *arrowImage;
@end


@implementation HelpCustomCell
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
            make.width.equalTo(CoreWidth-50);
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
- (void)setModel:(HelpModel *)model
{
    if (nil == model) {
        return;
    }
    self.titleLabel.text = model.app_help_content;
}
@end



#import "HelpVC.h"
#import "HelpDetailVC.h"
@interface HelpVC ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray                *help1Array;
@property (nonatomic, strong) NSMutableArray                *help2Array;

@property (nonatomic, strong) UICollectionViewFlowLayout    *layout;
@property (nonatomic, strong) UICollectionView              *collectionView;
@property (nonatomic, strong) UITableView                   *tableView;
@property (nonatomic, strong) UIButton                      *helpButton;
@end

@implementation HelpVC

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
    self.title = @"我的客服——帮助";
    self.help1Array = [NSMutableArray array];
    self.help2Array = [NSMutableArray array];

    
    
    [self makeTableView];
    //[self requestData];
    
    
}
- (void)makeTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = KHexColor(@"#f2f2f2");
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-60);
    }];

}
- (void)makeCollectionView
{
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout.itemSize = CGSizeMake(CoreWidth/_help1Array.count, 45);
    [self.layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CoreHeight-45, CoreWidth, 45) collectionViewLayout:_layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    [self.collectionView registerClass:[HelpCustomItem class] forCellWithReuseIdentifier:identifierItem];
}
- (void)helpButtonClick:(UIButton *)button
{
    if (button.tag == 100) {
        
    }
    else if (button.tag == 101)
    {
        
    }
    else if (button.tag == 102)
    {
        
    }
}
#pragma mark ------------------------------------------------------------------UICollectionViewDelegateFlowLayout-------------------------------------------------
//设置每个cell上下左右相距
// 设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0f;
}

// 设置最小列间距，也就是左行与右一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0f;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _help1Array.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HelpCustomItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierItem forIndexPath:indexPath];
    cell.itemModel = _help1Array[indexPath.item];
    return cell;
}

- (void)setPasswordButtonClick
{
    
}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _help2Array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    HelpCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[HelpCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
  
    cell.model = _help2Array[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HelpDetailVC *detail = [HelpDetailVC new];
    [self.navigationController pushViewController:detail animated:YES];
}
#pragma mark ------------------------------------------------------------------AFNetworking-------------------------------------------------
- (void)requestData
{
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [sessionManager GET:YiFuUrl(@"yf/yf_main/help_level1") parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = responseObject;
        if ([[dic objectForKey:@"msg"] isEqualToString:@"ok"]) {
            
            NSArray *dataArr = [[responseObject objectForKey:@"result"] objectForKey:@"helps1"];
            
            for (int i = 0; i<dataArr.count; i ++) {
                
                HelpItemModel *moel = [[HelpItemModel alloc] initWithDictionary:dataArr[i]];
                [_help1Array addObject:moel];
            }
            [self makeCollectionView];

            [_collectionView reloadData];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
    
    
    AFHTTPSessionManager *sessionManager2 = [AFHTTPSessionManager manager];
    sessionManager2.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [sessionManager2 GET:YiFuUrl(@"yf/yf_main/help_level2?helpid=25") parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        
        NSArray *dataArr = [[responseObject objectForKey:@"result"] objectForKey:@"helps2"];
        
        for (int i = 0; i<dataArr.count; i ++) {
            
            HelpModel *moel = [[HelpModel alloc] initWithDictionary:dataArr[i]];
            [_help2Array addObject:moel];
        }
        [_tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}
@end
