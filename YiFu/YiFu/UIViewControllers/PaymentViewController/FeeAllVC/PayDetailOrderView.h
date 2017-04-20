//
//  PayDetailView.h
//  YiFu
//
//  Created by Michael on 16/4/6.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayDetailOrderView : UIView
@property (nonatomic, strong) void(^downBlock)();
@property (nonatomic, strong) void(^chooseBankCardBlock)();
@end
