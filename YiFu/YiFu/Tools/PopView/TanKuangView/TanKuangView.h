//
//  TanKuangView.h
//  YiFu
//
//  Created by Michael on 16/3/9.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TanKuangView : UIView
@property (nonatomic, strong) UINavigationController *navigation;
@property (nonatomic, strong) UIButton *buttonClick;
@property (nonatomic, strong) void(^tankuangDismissBlock)(TanKuangView *);
@end
