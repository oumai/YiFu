//
//  FeeAllVC.h
//  YiFu
//
//  Created by Michael on 16/3/12.
//  Copyright © 2016年 jumper. All rights reserved.
//
typedef enum
{
    nextVCTypeWeather = 0,
    nextVCTypeSearch ,
    nextVCTypeCity,
    nextVCTypeNews,
}NextVCType;
#import "BaseViewController.h"

@interface FeeAllVC : BaseViewController
@property (nonatomic, assign) NextVCType feeInsteger;
@end
