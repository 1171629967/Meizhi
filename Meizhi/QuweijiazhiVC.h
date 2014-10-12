//
//  QuweijiazhiVC.h
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuweijiazhiVC : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *bt1;
@property (strong, nonatomic) IBOutlet UIButton *bt2;
@property (strong, nonatomic) IBOutlet UIButton *bt3;
@property (strong, nonatomic) IBOutlet UIButton *bt4;
@property (strong, nonatomic) IBOutlet UIButton *bt5;
@property (strong, nonatomic) IBOutlet UIView *v_tanchukuang;
@property (strong, nonatomic) IBOutlet UIImageView *iv_back;

- (IBAction)btClick:(id)sender;

@end
