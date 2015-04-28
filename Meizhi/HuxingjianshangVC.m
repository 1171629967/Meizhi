//
//  HuxingjianshangVC.m
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import "HuxingjianshangVC.h"


@interface HuxingjianshangVC ()

@end

@implementation HuxingjianshangVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //给背景添加点击监听
    self.iv_bg.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap2 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideTanchukuang)];
    [self.iv_bg addGestureRecognizer:singleTap2];
    
}

- (void)hideTanchukuang
{
    //发出通知，把底部导航栏控件收起来
    [[NSNotificationCenter defaultCenter] postNotificationName:Notification_DownTabBarView object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)iconClick:(id)sender
{
    UIButton *bt = (UIButton *)sender;
    int tag = (int)bt.tag;
    switch (tag) {
        case 1:
            bg1 = [[HuxingBgView1 alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
            [self.view addSubview:bg1];
            break;
        case 2:
            bg2 = [[HuxingBgView2 alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
            [self.view addSubview:bg2];
            break;
        case 3:
            bg3 = [[HuxingBgView3 alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
            [self.view addSubview:bg3];
            break;
        case 4:
            bg4 = [[HuxingBgView4 alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
            [self.view addSubview:bg4];
            break;
            
        default:
            break;
    }
}
@end
