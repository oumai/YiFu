//
//  LocationCityVC.m
//  YiFu
//
//  Created by Michael on 16/3/26.
//  Copyright © 2016年 jumper. All rights reserved.
//

/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface LocationCityModel: NSObject
@property (nonatomic, strong) NSString *territoryname;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface LocationCityModel ()

@end


@implementation LocationCityModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        if ([dic objectForKey:@"territoryname"] ) {
            self.territoryname =[dic objectForKey:@"territoryname"] ;
        }
    }
    return self;
}
@end

/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface LocationCityCustomCell : UITableViewCell
@property (nonatomic, strong) LocationCityModel *localtionModel;
@end


@interface LocationCityCustomCell ()
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel *detailLabel;
@property (nonatomic, strong) TTTAttributedLabel *timeLabel;
@property (nonatomic, strong) UIImageView *iconImage;
@end

@implementation LocationCityCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.textColor = KHexColor(@"#333333");
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.text = @"深圳市";
        [self.contentView addSubview:_titleLabel];
        
        
        
        self.line = [UIView new];
        self.line.backgroundColor = KHexColor(@"#999999");
        [self.contentView addSubview:_line];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.left.equalTo(self.titleLabel.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
    }
    return self;
}
- (void)setLocaltionModel:(LocationCityModel *)localtionModel
{
    if (nil == localtionModel) {
        return;
    }
    self.titleLabel.text = localtionModel.territoryname;
}

@end



/*------------------------------------------------------------------------------C----------------------------------------------------------------------------*/
#import "LocationCityVC.h"

@interface LocationCityVC ()<UITableViewDelegate,UITableViewDataSource>
{
    LocationCityCustomCell *cell;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation LocationCityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"城市";
    self.view.backgroundColor = KHexColor(@"#f2f2f2");
    self.dataArray = [NSMutableArray array];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 45;
    self.tableView.backgroundColor = KHexColor(@"#f2f2f2");
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    //[self requestData];
}
- (void)requestData
{
    [ASLoadingView showActivity:self.view];
      AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [sessionManager GET:YiFuUrl(@"yf/yf_main/app_support_city") parameters:@{@"territory_id":@0} progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = responseObject;
        if ([[dic objectForKey:@"msg"] isEqualToString:@"ok"]) {
            
            NSArray *dataArr = [[responseObject objectForKey:@"result"] objectForKey:@"citys"];
            
            for (int i = 0; i<dataArr.count; i ++) {
                
                LocationCityModel *moel = [[LocationCityModel alloc] initWithDictionary:dataArr[i]];
                [_dataArray addObject:moel];
            }
            
            [_tableView reloadData];
        }

        [ASLoadingView hidenActivity:self.view];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
    }];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"basicCell";
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[LocationCityCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.localtionModel = _dataArray[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LocationCityModel *model = _dataArray[indexPath.row];
    NSLog(@" model.territoryname == %@",model.territoryname);
    if (self.popBackBlock) {
        self.popBackBlock(model.territoryname);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
