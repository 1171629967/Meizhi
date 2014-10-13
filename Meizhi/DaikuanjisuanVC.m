//
//  DaikuanjisuanVC.m
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import "DaikuanjisuanVC.h"
#import "FThdjsq.h"
#import "FTjsqView.h"

@interface DaikuanjisuanVC ()

@end

@implementation DaikuanjisuanVC

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    FTjsqView * ftjsview = [[FTjsqView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [self.view addSubview:ftjsview];
    
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

@end
