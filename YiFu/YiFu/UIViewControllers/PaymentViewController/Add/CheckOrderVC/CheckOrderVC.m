//
//  CheckOrderVC.m
//  YiFu
//
//  Created by Michael on 16/4/8.
//  Copyright © 2016年 jumper. All rights reserved.
//

/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface CheckOrderModel: NSObject
@property (nonatomic, strong) NSString *pay_name;
@property (nonatomic, strong) NSString *updated_at;
@property (nonatomic, strong) NSString *order_status;
@property (nonatomic, strong) NSString *order_money;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface CheckOrderModel ()

@end


@implementation CheckOrderModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        

        if ([dic objectForKey:@"pay_name"] ) {
            self.pay_name =[dic objectForKey:@"pay_name"] ;
        }
        if ([dic objectForKey:@"updated_at"] ) {
            self.updated_at =[dic objectForKey:@"updated_at"] ;
            
        }
        if ([dic objectForKey:@"order_status"] ) {
            self.order_status =[dic objectForKey:@"order_status"] ;
        }
        if ([dic objectForKey:@"order_money"] ) {
            self.order_money =[dic objectForKey:@"order_money"] ;
        }
    }
    return self;
}
@end


/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface CheckOrderCustomCell : UITableViewCell

@property (nonatomic, strong) NSString *priceLabelString;
@property (nonatomic, strong) CheckOrderModel *checkModel;
@end

@interface CheckOrderCustomCell ()

@property (nonatomic, strong) UIView             *cellView;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel *timeLabel;
@property (nonatomic, strong) TTTAttributedLabel *payStatusLabel;
@property (nonatomic, strong) TTTAttributedLabel *detailLabel;
@property (nonatomic, strong) TTTAttributedLabel *priceLabel;
@property (nonatomic, strong) UIView             *line;

@end


@implementation CheckOrderCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = BackgroundColor;//[UIColor colorWithWhite:0.f alpha:0];
        
        self.cellView = [UIView new];
        self.cellView.layer.cornerRadius = 5;
        self.cellView.layer.masksToBounds = YES;
        self.cellView.backgroundColor = KHexColor(@"#ffffff");
        [self.contentView addSubview:_cellView];
        
        
        self.line = [UIView new];
        self.line.backgroundColor = KHexColor(@"#c6c6c6");
        [self.contentView addSubview:_line];

        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(16);
        self.titleLabel.textColor = DeepColor;
        self.titleLabel.text = @"水费";
        [self.cellView addSubview:_titleLabel];
        
        
        self.timeLabel = [TTTAttributedLabel new];
        self.timeLabel.font = KFontSize(12);
        self.timeLabel.textColor = LightColor;
        self.timeLabel.text = @"2016";
        [self.cellView addSubview:_timeLabel];
        
        
        self.payStatusLabel = [TTTAttributedLabel new];
        self.payStatusLabel.font = KFontSize(16);
        self.payStatusLabel.textColor = LightColor;
        self.payStatusLabel.text = @"支付成功";
        [self.cellView addSubview:_payStatusLabel];
        
        
        
        self.detailLabel = [TTTAttributedLabel new];
        self.detailLabel.font = KFontSize(12);
        self.detailLabel.textColor = LightColor;
        self.detailLabel.text = @"详情";
        [self.cellView addSubview:_detailLabel];
        
        
              
        self.priceLabel = [TTTAttributedLabel new];
        self.priceLabel.font = KFontSize(14);
        self.priceLabel.textColor = KHexColor(@"#ff8f21");
        self.priceLabel.text = @"12";
        [self.cellView addSubview:_priceLabel];
        
        
        [self.priceLabel setText:@"12" afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
            
            NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"元"
                                                                       attributes:@{NSForegroundColorAttributeName : KHexColor(@"#2e408a"),
                                                                                    NSFontAttributeName:KFontSize(12)}];
            [mutableAttributedString appendAttributedString:yuan];
            return mutableAttributedString;
        }];

       
        
        
        [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(10);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            
        }];

        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.cellView.mas_bottom).offset(-40);
            make.left.equalTo(self.cellView.mas_left).offset(8);
            make.right.equalTo(self.cellView.mas_right).offset(-8);
            make.height.equalTo(1);
        }];
        

        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_top).offset(20);
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(16);
        }];
        
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_top).offset(20+40);
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.width.equalTo(self.timeLabel.mas_width);
            make.height.equalTo(12);
        }];
        [_payStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_top).offset(20+40*2);
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.width.equalTo(self.payStatusLabel.mas_width);
            make.height.equalTo(16);
        }];
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_top).offset(20+40*3);
            make.left.equalTo(self.cellView.mas_left).offset(10);
            make.width.equalTo(self.payStatusLabel.mas_width);
            make.height.equalTo(12);
        }];
        
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.payStatusLabel.mas_centerY).offset(0);
            make.right.equalTo(self.cellView.mas_right).offset(-20);
            make.width.equalTo(self.priceLabel.mas_width);
            make.height.equalTo(14);
        }];

    }
    return self;
}

- (void)setPriceLabelString:(NSString *)priceLabelString
{
    if (nil == priceLabelString) {
        [priceLabelString isValid];
        return;
    }
   
}
- (void)setCheckModel:(CheckOrderModel *)checkModel
{
    if (nil == checkModel) {
        return;
    }

    
    
    self.titleLabel.text = checkModel.pay_name;
    self.timeLabel.text = checkModel.updated_at;
    self.priceLabel.text = checkModel.order_money;
    [self.priceLabel setText:checkModel.order_money afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        
        NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"元"
                                                                   attributes:@{NSForegroundColorAttributeName : KHexColor(@"#2e408a"),
                                                                                NSFontAttributeName:KFontSize(12)}];
        [mutableAttributedString appendAttributedString:yuan];
        return mutableAttributedString;
    }];

    if ([checkModel.order_status intValue] == 1) {
        self.payStatusLabel.text = @"支付成功";
    }
}
@end

/*-----------------------------------------------------------------------------C----------------------------------------------------------------------------*/
#import "CheckOrderVC.h"
@interface CheckOrderVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView           *tableView;

@end

@implementation CheckOrderVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"查看订单";
    self.view.backgroundColor = BackgroundColor;
    self.dataArray = [NSMutableArray array];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 180;
    self.tableView.backgroundColor = BackgroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.frame = CGRectMake(0, 0, CoreWidth, CoreHeight);
    [self.view addSubview:_tableView];
    
    //[self requestData];
}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    CheckOrderCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[CheckOrderCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.checkModel = _dataArray[indexPath.row];
    return cell;
}

- (void)requestData
{    NSDictionary *jsonDic = @{@"auid":@1,
                              @"user_key":@"745d0f2263ccb8f3ea0fb93218772d5b"};
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [sessionManager GET:YiFuUrl(@"yf/yf_main/my_order_list") parameters:jsonDic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = responseObject;
        if ([[dic objectForKey:@"msg"] isEqualToString:@"ok"]) {
            
            NSArray *dataArr = [[responseObject objectForKey:@"result"] objectForKey:@"orderlist"];
            
            for (int i = 0; i<dataArr.count; i ++) {
                
                CheckOrderModel *moel = [[CheckOrderModel alloc] initWithDictionary:dataArr[i]];
                [_dataArray addObject:moel];
            }
            NSLog(@"dataArr == %@",dataArr);
            [_tableView reloadData];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
    
}
@end
