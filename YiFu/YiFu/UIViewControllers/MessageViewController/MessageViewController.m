//
//  MessageViewController.m
//  YiFu
//
//  Created by Michael on 16/3/7.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface MessageViewModel: NSObject
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *message_type_id;
@property (nonatomic, strong) NSString *message_title;
@property (nonatomic, strong) NSString *message_content;
@property (nonatomic, strong) NSString *auid;
@property (nonatomic, strong) NSString *territory_id;
@property (nonatomic, strong) NSString *operator;
@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) NSString *message_status;
@property (nonatomic, strong) NSString *icon_path;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *updated_at;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface MessageViewModel ()

@end


@implementation MessageViewModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        if ([dic objectForKey:@"icon_path"] ) {
            self.icon_path =[dic objectForKey:@"icon_path"] ;
        }
        if ([dic objectForKey:@"updated_at"] ) {
            self.updated_at =[dic objectForKey:@"updated_at"] ;
        }
        if ([dic objectForKey:@"message_title"] ) {
            self.message_title =[dic objectForKey:@"message_title"] ;
        }
        if ([dic objectForKey:@"message_content"] ) {
            self.message_content =[dic objectForKey:@"message_content"] ;
        }
    }
    return self;
}
@end



@interface MessageViewCustomCell : UITableViewCell
@property (nonatomic, strong) MessageViewModel *messageModel;
@end
/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface MessageViewCustomCell ()
@property (nonatomic, strong) UIView               *cellView;
@property (nonatomic, strong) UIImageView          *iconImage;
@property (nonatomic, strong) TTTAttributedLabel   *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel   *detailLabel;
@property (nonatomic, strong) TTTAttributedLabel   *dateLabel;

@end

@implementation MessageViewCustomCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.cellView = [UIView new];
        self.cellView.backgroundColor = KHexColor(@"#30293c");
//        self.cellView.alpha = 0.5;
        self.cellView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.5];
        [self.contentView addSubview:_cellView];
        
        
        
        self.iconImage = [UIImageView new];
        [self.cellView addSubview:_iconImage];
        
      
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = KHexColor(@"#ffffff");
        self.titleLabel.text = @"交易信息";
        [self.cellView addSubview:_titleLabel];
        
        
        self.detailLabel = [TTTAttributedLabel new];
        self.detailLabel.font = [UIFont systemFontOfSize:14];
        self.detailLabel.textColor = KHexColor(@"#ffffff");
        self.detailLabel.text = @"85元会在2016.8.8号之前退换到您的手机";
        [self.cellView addSubview:_detailLabel];
        
             
        
        self.dateLabel = [TTTAttributedLabel new];
        self.dateLabel.font = [UIFont systemFontOfSize:12];
        self.dateLabel.textColor = KHexColor(@"#c9c8c6a");
        self.dateLabel.text = @"2015/6/6";
        [self.cellView addSubview:_dateLabel];
        
      
        
        [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            
        }];
        
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY);
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.width.equalTo(81/2);
            make.height.equalTo(80/2);
        }];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY).offset(-15);
            make.left.equalTo(self.iconImage.mas_right).offset(20);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY).offset(15);
            make.left.equalTo(self.iconImage.mas_right).offset(20);
            make.width.equalTo(CoreWidth-100);
            make.height.equalTo(14);
        }];
        
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleLabel.mas_centerY).offset(0);
            make.right.equalTo(self.cellView.mas_right).offset(-15);
            make.width.equalTo(self.dateLabel.mas_width);
            make.height.equalTo(14);
        }];

    }
    return self;
}
- (void)setMessageModel:(MessageViewModel *)messageModel
{
    if (nil == messageModel) {
        return;
    }
    self.titleLabel.text = messageModel.message_title;
    self.detailLabel.text = messageModel.message_content;
    self.dateLabel.text = messageModel.updated_at;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:messageModel.icon_path] placeholderImage:[UIImage imageNamed:@"message_youse_zhushou"]];
}
@end

#import "MessageViewController.h"
#import "MessageServiceDetailVC.h"
#import "TanKuangView.h"
@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIImageView   *bgImage;
@property (nonatomic, strong) UIButton      *addButton;
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) TanKuangView  *tan;
@property (nonatomic, assign) BOOL          isOpen;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@end

@implementation MessageViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self == [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add_image"] style:(UIBarButtonItemStylePlain) target:self action:@selector(rightClick:)];
        self.navigationItem.rightBarButtonItem = right;
        right.tintColor = KHexColor(@"#ffffff");
    }
    return self;
}
- (void)rightClick
{
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"消息";
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:KHexColor(@"#ffffff")}];//导航条标题颜
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [NSMutableArray array];
    self.bgImage = [UIImageView new];
    self.bgImage.image = [UIImage imageNamed:@"my_bg"];
    self.bgImage.frame = self.view.frame;
    [self.view addSubview:_bgImage];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 80;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64);
        make.left.bottom.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);}];
    //[self requestData];
}
#pragma mark ------------------------------------------------------------------AFNetworking-------------------------------------------------
- (void)requestData
{
    [ASLoadingView showActivity:self.view];
    NSDictionary *jsonDic = @{@"auid":@1,
                              @"user_key":@"745d0f2263ccb8f3ea0fb93218772d5b",
                              @"territory_id":@"374b9cdb53ea5fb40153ea6cd19a0011"};
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [sessionManager GET:YiFuUrl(@"yf/yf_main/list_my_message") parameters:jsonDic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [ASLoadingView hidenActivity:self.view];
        
        NSDictionary *dic = responseObject;
        if ([[dic objectForKey:@"msg"] isEqualToString:@"ok"]) {
            
            NSArray *dataArr = [[responseObject objectForKey:@"result"] objectForKey:@"messagelist"];
            
            for (int i = 0; i<dataArr.count; i ++) {
                
                MessageViewModel *moel = [[MessageViewModel alloc] initWithDictionary:dataArr[i]];
                [_dataArray addObject:moel];
            }
            
            [_tableView reloadData];
        }
        
        NSLog(@"responseObject **************  %@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Message_cell";
    MessageViewCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[MessageViewCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.messageModel = _dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageServiceDetailVC *message = [MessageServiceDetailVC new];
    [self.navigationController pushViewController:message animated:YES];
}
#pragma mark -------------------------------------------------------------------TanKuangView-------------------------------------------------------------------
- (void)rightClick:(UIButton *)button
{
    if (_isOpen == NO) {
        self.tan = [[TanKuangView alloc] init];
        self.tan.navigation = self.navigationController;
        self.tan.frame = CGRectMake(CoreWidth-180-10, 64, 180, 164);
        [self.view addSubview:_tan];
       
        __weak MessageViewController *isOp = self;
        [_tan setTankuangDismissBlock:^(TanKuangView *tan) {
            [tan removeFromSuperview];
            isOp.isOpen = NO;
        }];
        self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClickTanRemoveFrom)];
        [self.view addGestureRecognizer:_tap];
        self.isOpen = YES;
        
    }
    else
    {
        [_tan removeFromSuperview];
        [self.view removeGestureRecognizer:_tap];
        self.isOpen = NO;
    }
    
}
- (void)tapClickTanRemoveFrom
{
    [_tan removeFromSuperview];
    [self.view removeGestureRecognizer:_tap];
    self.isOpen = NO;
}


@end
