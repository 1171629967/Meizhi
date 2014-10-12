//
//  XiangmushejiVC.m
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import "XiangmushejiVC.h"

@interface XiangmushejiVC ()

@end

@implementation XiangmushejiVC

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
    [self initViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)initViews
{
    //添加旋转模块
    circleView = [[FTCircleImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    circleView.userInteractionEnabled = YES;
    circleView.isSkipFrame = YES;
    circleView.path360 = [[NSBundle mainBundle] resourcePath];
    [self.view insertSubview:circleView atIndex:0];
    circleView.count = 41;
    circleView.curCount = 0;
    circleView.preName = @"c11_00";
    circleView.image = [UIImage imageNamed:@"c11_000.jpg"];
    
    //给旋转添加点击监听
    circleView.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap1 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideTanchukuang)];
    [circleView addGestureRecognizer:singleTap1];
}

- (void)hideTanchukuang
{
    //发出通知，把底部导航栏控件收起来
    [[NSNotificationCenter defaultCenter] postNotificationName:Notification_DownTabBarView object:nil];
}

@end
