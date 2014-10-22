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
    circleView.fileType = @"jpg";
    circleView.userInteractionEnabled = YES;
    circleView.isSkipFrame = YES;
    circleView.path360 = [[NSBundle mainBundle] resourcePath];
    [self.view insertSubview:circleView atIndex:0];
    circleView.count = 100;
    circleView.curCount = 0;
    circleView.preName = @"c11_00";
    circleView.image = [UIImage imageNamed:@"c11_000.jpg"];
    
    //动态添加进入内庭的按钮
    bt_neitingjingguan = [[UIButton alloc] initWithFrame:CGRectMake(467, 389, 91, 38)];
    UIImage *img = [UIImage imageNamed:@"内庭景观按钮.png"];
    [bt_neitingjingguan setImage:img forState:UIControlStateNormal];
    [circleView addSubview:bt_neitingjingguan];
    [bt_neitingjingguan addTarget:self action:@selector(gotoZT) forControlEvents:UIControlEventTouchUpInside];
    
    //设置代理，旋转到正面几帧的时候，显示进入中庭的按钮
    circleView.ztDelegate = self;
    
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

-(void)isShowButton:(BOOL)isShow
{
    if (isShow) {
        bt_neitingjingguan.hidden = NO;
    }
    else{
        bt_neitingjingguan.hidden = YES;
    }
    
}

//中庭按钮监听函数
- (void)gotoZT {
    //添加中庭
    [self performSelector:@selector(loadZT) withObject:nil];
}

//加载中庭
- (void)loadZT
{
    ztView = [[CustSkyBoxView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768) andType:@"中庭"];
    [self.view addSubview:ztView];

    //动态添加返回按钮
    UIButton *bt_back = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 70, 70)];
    UIImage *img = [UIImage imageNamed:@"返回按钮.png"];
    [bt_back setImage:img forState:UIControlStateNormal];
    [ztView addSubview:bt_back];
    [bt_back addTarget:self action:@selector(closeZT) forControlEvents:UIControlEventTouchUpInside];

    //移除掉旋转控件
    [circleView removeFromSuperview];
}

//关闭内庭
- (void)closeZT
{
    [ztView removeFromSuperview];
    [self.view addSubview:circleView];
}


@end
