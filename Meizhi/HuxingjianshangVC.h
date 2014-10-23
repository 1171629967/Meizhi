//
//  HuxingjianshangVC.h
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HuxingjianshangVC : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *iv_bg;


@property (strong, nonatomic) IBOutlet UIButton *bt_1;
@property (strong, nonatomic) IBOutlet UIButton *bt_2;
@property (strong, nonatomic) IBOutlet UIButton *bt_3;
@property (strong, nonatomic) IBOutlet UIButton *bt_4;
@property (strong, nonatomic) IBOutlet UIButton *bt_5;


- (IBAction)iconClick:(id)sender;

@end
