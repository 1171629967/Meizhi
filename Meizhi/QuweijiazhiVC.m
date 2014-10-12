//
//  QuweijiazhiVC.m
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import "QuweijiazhiVC.h"
#import "FTTool.h"

@interface QuweijiazhiVC ()

@end

@implementation QuweijiazhiVC

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


- (void) initViews
{
    self.bt1.tag = 1;
    self.bt2.tag = 2;
    self.bt3.tag = 3;
    self.bt4.tag = 4;
    self.bt5.tag = 5;
    
    //给背景图添加点击监听
    self.iv_back.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap1 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideTanchukuang)];
    [self.iv_back addGestureRecognizer:singleTap1];
}



- (void)hideTanchukuang
{
    self.v_tanchukuang.hidden = YES;
    //发出通知，把底部导航栏控件收起来
    [[NSNotificationCenter defaultCenter] postNotificationName:Notification_DownTabBarView object:nil];
}

- (IBAction)btClick:(id)sender
{
    UIButton *bt = (UIButton *)sender;
    int tag = (int)bt.tag;
    switch (tag) {
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        default:
            break;
    }
    
    self.v_tanchukuang.hidden = NO;
    [FTTool alertView:self.v_tanchukuang];
}
@end
