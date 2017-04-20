//
//  PrivateCustomVC.m
//  YiFu
//
//  Created by Michael on 16/3/15.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------V-------------------------------------------*/
@interface PrivateCustomCustomCell : UICollectionViewCell

@property (nonatomic, strong) NSString *bgName;

@end



@interface PrivateCustomCustomCell ()

@property (nonatomic, strong) UIImageView *bgImage;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@end

@implementation PrivateCustomCustomCell


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        self.bgImage = [UIImageView new];
        self.bgImage.contentMode = UIViewContentModeScaleAspectFit;
        self.bgImage.image= [UIImage imageNamed:@"private_lan_online"];
        [self.contentView addSubview:_bgImage];
        
        
        self.titleLabel = [TTTAttributedLabel new];         ///开通亲情账户
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = KHexColor(@"#3657a4");//#b7b7b7
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgImage.mas_bottom).offset(5);
            make.centerX.equalTo(self.bgImage.mas_centerX).offset(0);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];

        
        [_bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(-10);
            make.width.equalTo(70);
            make.height.equalTo(70);
        }];
        
    }
    return self;
}

//背景图片
- (void)setBgName:(NSString *)bgName
{
    if (![bgName isValid]) {
        return;
    }
    self.bgImage.image = [UIImage imageNamed:bgName];
}

@end

#import "PrivateCustomVC.h"
#import "UICollectionViewWaterfallLayout.h"
static NSString *identifier = @"PrivateCustomCustomCell";
@interface PrivateCustomVC()<UICollectionViewDelegateWaterfallLayout,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView      *collectionView;

@end
@implementation PrivateCustomVC
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    NavigationBarBackgroundColor
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.tabBarController.tabBar.hidden = YES;
    
}
- (void)requestData
{
    [ASLoadingView showActivity:self.view];
    NSDictionary *jsonDic = @{@"auid":@1,
                              @"territory_id":@0};
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [sessionManager GET:YiFuUrl(@"yf/yf_main/list_my_service") parameters:jsonDic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [ASLoadingView hidenActivity:self.view];
        
        k_yjHUD(@"我的订制服务", self.view);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
    }];

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"私人定制";
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewWaterfallLayout *layout = [[UICollectionViewWaterfallLayout alloc] init];
    layout.itemWidth = 220/3;        //设置每个item 的宽度
    layout.columnCount = 3;                             //设置多少列
    layout.delegate = self;                             //设置delegate 通过协议获得每隔item的高度
    layout.sectionInset = UIEdgeInsetsMake(10, 5, 5, 5);//设置上左下右的间距
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.frame = CGRectMake(20, 0, CoreWidth-40, CoreHeight);
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    [self.collectionView registerClass:[PrivateCustomCustomCell class] forCellWithReuseIdentifier:identifier];
    
    //[self requestData];
}
//每个item 的高度
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterfallLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath

{
    return 100;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    PrivateCustomCustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSArray *arrayBgImage = @[@"private_lan_online",@"private_lan_guahao",@"private_lan_weizhang",@"private_lan_jiashi",@"private_lan_youji",@"private_lan_lingshi"];
    NSArray *titleArray = @[@"在线咨询",@"挂号就诊",@"违章提醒",@"驾驶证扣分",@"有机生鲜",@"零食天地"];
    cell.titleLabel.text = titleArray[indexPath.item];
    cell.bgName = arrayBgImage[indexPath.item];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [ASLoadingView showActivity:self.view];
    NSDictionary *jsonDic = @{@"auid":@1,
                              @"ids":[NSString stringWithFormat:@"11,12"]};
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [sessionManager GET:YiFuUrl(@"yf/yf_main/save_my_service") parameters:jsonDic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [ASLoadingView hidenActivity:self.view];
        
        k_yjHUD(@"保存订制服务", self.view);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
    }];

}
@end

