//
//  HuxingjianshangVC.h
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HuxingBgView1.h"
#import "HuxingBgView2.h"
#import "HuxingBgView3.h"
#import "HuxingBgView4.h"

@interface HuxingjianshangVC : UIViewController
{
    HuxingBgView1 *bg1;
    HuxingBgView2 *bg2;
    HuxingBgView3 *bg3;
    HuxingBgView4 *bg4;
}

@property (strong, nonatomic) IBOutlet UIImageView *iv_bg;


@property (strong, nonatomic) IBOutlet UIButton *bt_1;
@property (strong, nonatomic) IBOutlet UIButton *bt_2;
@property (strong, nonatomic) IBOutlet UIButton *bt_3;
@property (strong, nonatomic) IBOutlet UIButton *bt_4;
@property (strong, nonatomic) IBOutlet UIView *v_mother;



- (IBAction)iconClick:(id)sender;

@end
