//
//  AffectionAccountVC.m
//  YiFu
//
//  Created by Michael on 16/3/13.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------V-------------------------------------------*/
@interface AffectionAccountCustomCell : UICollectionViewCell

@property (nonatomic, strong) NSString *bgName;

@end



@interface AffectionAccountCustomCell ()

@property (nonatomic, strong) UIImageView *bgImage;
@end

@implementation AffectionAccountCustomCell


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        self.bgImage = [UIImageView new];
        self.bgImage.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_bgImage];
        
        
        [_bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self.contentView);
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

#import "AffectionAccountVC.h"
#import "UICollectionViewWaterfallLayout.h"
#import "ProductInstructionsVC.h"
#import "AddDuiFangAccountVC.h"
#import "AddYiFuAccountVC.h"
static NSString *identifier = @"AffectionAccountCustomCell";
@interface AffectionAccountVC()<UICollectionViewDelegateWaterfallLayout,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UIView                *headerView;
@property (nonatomic, strong) UIImageView           *headerImage;
@property (nonatomic, strong) UIImageView           *headerQuanImage;
@property (nonatomic, strong) UIImageView           *bgImage;
@property (nonatomic, strong) TTTAttributedLabel    *nickNameLabel;
@property (nonatomic, strong) UIView                *shadowView;
@property (nonatomic, strong) TTTAttributedLabel    *titleLabel;
@property (nonatomic, strong) UICollectionView      *collectionView;
@property (nonatomic, strong) UIButton              *instructionsButton;

@property (nonatomic, strong) NSArray               *arrayBgImage;
@end


@implementation AffectionAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setRightItem];
    self.title = @"亲情账户";
    self.navigationItem.rightBarButtonItem.title = @"开通";
    self.bgImage = [UIImageView new];
    self.bgImage.image = [UIImage imageNamed:@"my_bg"];
    self.bgImage.frame = self.view.frame;
    [self.view addSubview:_bgImage];
    
    self.arrayBgImage = @[@"shipping_add_mom",@"shipping_add_dadi",@"shipping_add_love",@"shipping_add_daughter",@"shipping_add_son",@"shipping_add_more"];
    [self makeHeaderView];

}
- (void)tap
{
    
}
- (void)rightBarButtonItemClick
{
    
}
- (void)instructionsButtonClick:(UIButton *)button
{
    ProductInstructionsVC *pro = [ProductInstructionsVC new];
    [self.navigationController pushViewController:pro animated:YES];
}
- (void)makeHeaderView
{
    self.headerView = [UIView new];
    self.headerView.frame = CGRectMake(0, 0, CoreWidth, 200);
    self.headerView.backgroundColor = [UIColor grayColor];
    [self.view addSubview: _headerView];
    
    
    self.shadowView = [UIView new];
    self.shadowView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.2];
    self.shadowView.frame = CGRectMake(0, 280, CoreWidth, CoreHeight-280);
    [self.view addSubview:_shadowView];

    self.headerQuanImage = [UIImageView new];      ///头像
    self.headerQuanImage.image = [UIImage imageNamed:@"headerQuan"];
    [self.headerView addSubview:_headerQuanImage];
    
    
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    self.headerImage = [UIImageView new];
    self.headerImage.image = [UIImage imageNamed:@"header"];
    self.headerImage.userInteractionEnabled = YES;
    [self.headerImage addGestureRecognizer:tapG];
    [self.headerView addSubview:_headerImage];
    
    
    self.nickNameLabel = [TTTAttributedLabel new];
    self.nickNameLabel.font = [UIFont systemFontOfSize:14];
    self.nickNameLabel.textColor = KHexColor(@"#ffffff");
    self.nickNameLabel.text = @"NickName";
    [self.headerView addSubview:_nickNameLabel];
    
    self.titleLabel = [TTTAttributedLabel new];         ///开通亲情账户
    self.titleLabel.layer.cornerRadius = 5;
    self.titleLabel.layer.masksToBounds = YES;
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = KHexColor(@"#ffffff");
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.backgroundColor = [UIColor colorWithRed:54/255 green:55/255 blue:60/255 alpha:0.3];
    self.titleLabel.text = @"开通亲情账户,可以为ta开通亲密付";
    [self.shadowView addSubview:_titleLabel];
    
    UICollectionViewWaterfallLayout *layout = [[UICollectionViewWaterfallLayout alloc] init];
    layout.itemWidth = 220/3;        //设置每个item 的宽度
    layout.columnCount = 3;                             //设置多少列
    layout.delegate = self;                             //设置delegate 通过协议获得每隔item的高度
    layout.sectionInset = UIEdgeInsetsMake(10, 5, 5, 5);//设置上左下右的间距
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.frame = CGRectMake(30, 80, CoreWidth-60, CoreHeight-280-80);
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.shadowView addSubview:_collectionView];
    [self.collectionView registerClass:[AffectionAccountCustomCell class] forCellWithReuseIdentifier:identifier];

    
    self.instructionsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.instructionsButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.instructionsButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.instructionsButton setTitle:@"产品说明" forState:UIControlStateNormal];
    [self.instructionsButton setTitleColor:KHexColor(@"#ffffff") forState:UIControlStateNormal];
    [self.instructionsButton addTarget:self action:@selector(instructionsButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_instructionsButton];
    
    [_instructionsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-10);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.equalTo(100);
        make.height.equalTo(40);
    }];

    
    
    [_headerQuanImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerView.mas_centerX).offset(0);
        make.centerY.equalTo(self.headerView.mas_bottom).offset(0);
        make.width.equalTo(70);
        make.height.equalTo(70);
    }];
    
    [_headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headerQuanImage.mas_centerY).offset(0);
        make.centerX.equalTo(self.headerQuanImage.mas_centerX).offset(0);
        make.width.equalTo(127/2);
        make.height.equalTo(127/2);
    }];
    
    
    [_nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerQuanImage.mas_centerX).offset(0);
        make.top.equalTo(self.headerQuanImage.mas_bottom).offset(10);
        make.width.equalTo(self.nickNameLabel.mas_width);
        make.height.equalTo(14);
    }];

    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shadowView.mas_top).offset(15);
        make.left.equalTo(self.shadowView.mas_left).offset(30);
        make.right.equalTo(self.shadowView.mas_right).offset(-30);
        make.height.equalTo(40);
    }];
}
//每个item 的高度
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterfallLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    AffectionAccountCustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.bgName = _arrayBgImage[indexPath.item];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    AddDuiFangAccountVC *add = [AddDuiFangAccountVC new];
    [self.navigationController pushViewController:add animated:YES];
}
@end
