//
//  PersonalVC.m
//  YiFu
//
//  Created by Michael on 16/3/8.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface PersonalModel  : NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface PersonalModel ()

@end


@implementation PersonalModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
    }
    return self;
}
@end





/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface PersonalCustomCell : UITableViewCell

@end


@interface PersonalCustomCell ()
@property (nonatomic, strong) UIView             *line;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel *detailLabel;
@property (nonatomic, strong) TTTAttributedLabel *shengFenLabel;
@property (nonatomic, strong) TTTAttributedLabel *modifyLabel;
@property (nonatomic, strong) UIImageView        *iconImage;
@property (nonatomic, strong) UIImageView        *arrowImage;
@end


@implementation PersonalCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        

        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.textColor = KHexColor(@"#969696");
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.text = @"Michael Jackson";
        [self.contentView addSubview:_titleLabel];
        
        
        
        self.modifyLabel = [TTTAttributedLabel new];
        self.modifyLabel.textColor = KHexColor(@"#969696");
        self.modifyLabel.font = KFontSize(14);
        [self.contentView addSubview:_modifyLabel];
        
        self.detailLabel = [TTTAttributedLabel new];
        self.detailLabel.textColor = KHexColor(@"#969696");
        self.detailLabel.font = KFontSize(14);
        [self.contentView addSubview:_detailLabel];
        
        self.shengFenLabel = [TTTAttributedLabel new];
        self.shengFenLabel.textColor = KHexColor(@"#969696");
        self.shengFenLabel.font = KFontSize(14);
        [self.contentView addSubview:_shengFenLabel];

        
      
        self.line = [UIView new];
        self.line.backgroundColor = KHexColor(@"#c6c6c6");
        [self.contentView addSubview:_line];
        
        self.arrowImage = [UIImageView new];
        [self.contentView addSubview:_arrowImage];
        
        
        [_arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
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
            make.left.equalTo(self.contentView.left).offset(30);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        [_modifyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(80);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_top).offset(0);
            make.right.equalTo(self.arrowImage.mas_left).offset(-5);
            make.width.equalTo(self.detailLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        [_shengFenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_top).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.width.equalTo(self.shengFenLabel.mas_width);
            make.height.equalTo(14);
        }];

        
        
      
    }
    return self;
}
@end





/*-----------------------------------------------------------------------------C----------------------------------------------------------------------------*/
#import "PersonalVC.h"
#import "SheetActionView.h"
@interface PersonalVC ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    PersonalCustomCell *cell;
}
@property (nonatomic, assign) BOOL              isPresented;
@property (nonatomic, strong) UIButton          *leftButton;
@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) UIView            *footerView;
@property (nonatomic, strong) UILabel           *titleJiFenLabel;
@property (nonatomic, strong) UILabel           *jiFenLabel;
@property (nonatomic, strong) UILabel           *historyLabel;
@property (nonatomic, strong) SheetActionView   *sheetView;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, strong) UIImageView *iconImage;
@end

@implementation PersonalVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人资料";
    self.view.backgroundColor = [UIColor redColor];
    self.isPresented = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = KHexColor(@"#f2f2f2");
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
    [self makeFooterViewUI];

    
    
    __weak PersonalVC *per = self;
    self.sheetView = [SheetActionView new];
    self.sheetView.frame = CGRectMake(0, CoreHeight, CoreWidth, 160);
    [self.sheetView setSheetViewBlock:^(NSInteger sheet) {
        
        if (sheet == 100) {
            [per cameraButttonClick];
            [per animationedDown];

        }
        else if (sheet == 101)
        {
            [per photoesButttonClick];
            [per animationedDown];

        }
        else if (sheet == 102)
        {
            [per animationedDown];
        }
    }];
    [self.view addSubview:_sheetView];
    
}
- (void)animationUp
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];
    self.sheetView.frame = CGRectMake(0, CoreHeight-160, CoreWidth, 160);
    [UIView commitAnimations];
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:_tap];
    _isPresented = YES;
    
}
- (void)animationedDown
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.sheetView.frame = CGRectMake(0, CoreHeight, CoreWidth, 160);
    [UIView commitAnimations];
    [self.view removeGestureRecognizer:_tap];
    _isPresented = NO;
    
}
- (void)tapClick
{
    [self animationedDown];
}
#pragma mark ------------------------------------------------------------------相机 选照片-------------------------------------------------
//打开相机
- (void)cameraButttonClick
{
    BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    if (!isCamera) {
        NSLog(@"没有摄像头");
        return ;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.delegate = self;
    // 编辑模式
    imagePicker.allowsEditing = YES;
    
    [self  presentViewController:imagePicker animated:YES completion:^{
    }];
}
//打开相册
- (void)photoesButttonClick
{
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    [self  presentViewController:imagePicker animated:YES completion:^{
    }];
    
}

//取消
- (void)cancelButttonClick
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}


// 选中照片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //imageView.image = image;
    // UIImagePickerControllerOriginalImage 原始图片
    // UIImagePickerControllerEditedImage 编辑后图片
    UIImageView  *imageView = (UIImageView *)[self.view viewWithTag:101];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.iconImage.image = image;
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
}



#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 70;
    }
    else if(indexPath.row == 4)
    {
        return 70;
    }
    else
    {
        return 50;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[PersonalCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    NSArray *titleArr    = @[@"",@"昵称",@"性别",@"常住地",@"个性签名"];
    cell.titleLabel.text = titleArr[indexPath.row];
    
    if (indexPath.row == 0)
    {
        
        self.iconImage = [UIImageView new];
        self.iconImage.layer.cornerRadius = 25;
        self.iconImage.layer.masksToBounds = YES;
        self.iconImage.userInteractionEnabled = YES;
        self.iconImage.image = [UIImage imageNamed:@"header"];
        [cell addSubview:_iconImage];
        
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.mas_centerY).offset(0);
            make.left.equalTo(cell.mas_left).offset(20);
            make.width.equalTo(50);
            make.height.equalTo(50);
        }];
        cell.modifyLabel.text = @"修改头像";
    }
    
    if (indexPath.row ==  2) {
        cell.detailLabel.text = @"男";
        cell.arrowImage.image = [UIImage imageNamed:@"arrows"];
    }
    if (indexPath.row == 3) {
        cell.shengFenLabel.text = @"山西太原";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
      
    
    if (indexPath.row == 0) {
        if (_isPresented == NO) {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.1];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDidStopSelector:@selector(animationUp)];
            [UIView commitAnimations];
        }
        else
        {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.1];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDidStopSelector:@selector(animationedDown)];
            [UIView commitAnimations];
        }
    }
}
#pragma mark ------------------------------------------------------------------makeFooterViewUI-----------------------------------------------------------------
- (void)makeFooterViewUI
{
    self.footerView = [UIView new];
    self.footerView.backgroundColor = [UIColor whiteColor];
    self.footerView.frame = CGRectMake(0, 330, CoreWidth, 50);
    [self.tableView addSubview:_footerView];
    
    
    self.titleJiFenLabel = [UILabel new];
    self.titleJiFenLabel.textColor = KHexColor(@"#969696");
    self.titleJiFenLabel.font = KFontSize(14);
    self.titleJiFenLabel.text = @"现在积分:";
    [self.footerView addSubview:_titleJiFenLabel];
    
    
    self.jiFenLabel = [UILabel new];
    self.jiFenLabel.textColor = KHexColor(@"#fe0100");
    self.jiFenLabel.font = KFontSize(14);
    self.jiFenLabel.text = @"100";
    [self.footerView addSubview:_jiFenLabel];
    
    
    
    self.historyLabel = [UILabel new];
    self.historyLabel.textColor = KHexColor(@"#bfbfbf");
    self.historyLabel.font = KFontSize(14);
    self.historyLabel.text = @"历史积分:0";
    [self.footerView addSubview:_historyLabel];
    
    
    [_titleJiFenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.footerView.mas_centerY).offset(0);
        make.left.equalTo(self.footerView.left).offset(30);
        make.width.equalTo(self.titleJiFenLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    [_jiFenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.footerView.mas_centerY).offset(0);
        make.left.equalTo(self.titleJiFenLabel.right).offset(10);
        make.width.equalTo(self.jiFenLabel.mas_width);
        make.height.equalTo(14);
    }];
    
    [_historyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.footerView.mas_centerY).offset(0);
        make.left.equalTo(self.jiFenLabel.right).offset(10);
        make.width.equalTo(self.historyLabel.mas_width);
        make.height.equalTo(14);
    }];
}
@end
