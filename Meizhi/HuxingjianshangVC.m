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
    
}
@end
