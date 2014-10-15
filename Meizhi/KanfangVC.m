//
//  360kanfangVC.m
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import "KanfangVC.h"
#import "CustSkyBoxView.h"

@interface KanfangVC ()

@end

@implementation KanfangVC

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
    
//    CustSkyBoxView *ztView = [[CustSkyBoxView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768) andType:@"客厅"];
//    [self.view addSubview:ztView];
    
    
   
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initViews
{
    currentTag = 1;
    
    self.bt_menuCloseOrOpen.tag = 0;
    self.bt_menu_pingming.tag = 1;
    self.bt_menu_kecanting.tag = 2;
    self.bt_menu_zhuwoshi.tag = 3;
    self.bt_menu_ciwoshi.tag = 4;
    self.bt_menu_weishengjian.tag = 5;
    self.bt_menu_chufang.tag = 6;
    self.bt_menu_shufang.tag = 7;
}


//控制条上下移动
- (void)leftOrRight{
    NSInteger leftOrRightDistance;
    if (isRight) {
        leftOrRightDistance = -202;
        self.iv_return.hidden = YES;
    }else {
        leftOrRightDistance = 202;
        self.iv_return.hidden = NO;
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3f];
    self.v_menu.frame = CGRectMake(self.v_menu.frame.origin.x+leftOrRightDistance, 170, 260, 428);
    [UIView commitAnimations];
    isRight = !isRight;
    
}



- (IBAction)menuClick:(id)sender
{
    
    
    UIButton *bt = (UIButton *)sender;
    int tag = (int)bt.tag;
    switch (tag) {
        case 0:
            [self leftOrRight];
            break;
        case 1:
            if (currentTag != 1) {
                [self removeAllViewOnMatherView];
                if ([currentFangType isEqualToString:@"30m"]) {
                    self.iv_back.image = [UIImage imageNamed:@"pingmiantu_30f"];
                }
                else if([currentFangType isEqualToString:@"50m"]){
                    self.iv_back.image = [UIImage imageNamed:@"pingmiantu_50f"];
                }
            }
            
            break;
        case 2:
            if (currentTag != 2) {
                if (isLoading) {
                    return;
                }
                [self removeAllViewOnMatherView];
                self.iv_back.image = [UIImage imageNamed:@"kanfang_bg.jpg"];
                if ([currentFangType isEqualToString:@"30m"]) {
                    [self performSelectorInBackground:@selector(add30mKeting) withObject:nil];
                }
                else if([currentFangType isEqualToString:@"50m"]){
                    //[self performSelectorInBackground:@selector(add50mKeting) withObject:nil];
                }
            }
            break;
        case 3:
            if (currentTag != 3) {
                if (isLoading) {
                    return;
                }
                [self removeAllViewOnMatherView];
                self.iv_back.image = [UIImage imageNamed:@"kanfang_bg.jpg"];
                if ([currentFangType isEqualToString:@"30m"]) {
                    [self performSelectorInBackground:@selector(add30mZhuwo) withObject:nil];
                }
                else if([currentFangType isEqualToString:@"50m"]){
                    //[self performSelectorInBackground:@selector(add50mZhuwo) withObject:nil];
                }
            }
            break;
        case 4:
            if (currentTag != 4) {
                if (isLoading) {
                    return;
                }
                [self removeAllViewOnMatherView];
                self.iv_back.image = [UIImage imageNamed:@"kanfang_bg.jpg"];
                if ([currentFangType isEqualToString:@"30m"]) {
                    [self performSelectorInBackground:@selector(add30mCiwo) withObject:nil];
                }
                else if([currentFangType isEqualToString:@"50m"]){
                    //[self performSelectorInBackground:@selector(add50mCiwo) withObject:nil];
                }
            }
            break;
        case 5:
            if (currentTag != 5) {
                if (isLoading) {
                    return;
                }
                [self removeAllViewOnMatherView];
                self.iv_back.image = [UIImage imageNamed:@"kanfang_bg.jpg"];
                if ([currentFangType isEqualToString:@"30m"]) {
                    [self performSelectorInBackground:@selector(add30mWeishengjian) withObject:nil];
                }
                else if([currentFangType isEqualToString:@"50m"]){
                   // [self performSelectorInBackground:@selector(add50mWeishengjian) withObject:nil];
                }
            }
            break;
        case 6:
            if (currentTag != 6) {
                if (isLoading) {
                    return;
                }
                [self removeAllViewOnMatherView];
                self.iv_back.image = [UIImage imageNamed:@"kanfang_bg.jpg"];
                if ([currentFangType isEqualToString:@"30m"]) {
                    [self performSelectorInBackground:@selector(add30mChufang) withObject:nil];
                }
                else if([currentFangType isEqualToString:@"50m"]){
                    //[self performSelectorInBackground:@selector(add50mChufang) withObject:nil];
                }
            }
            break;
        case 7:
            if (currentTag != 7) {
                if (isLoading) {
                    return;
                }
                [self removeAllViewOnMatherView];
                self.iv_back.image = [UIImage imageNamed:@"kanfang_bg.jpg"];
                if ([currentFangType isEqualToString:@"30m"]) {
                    [self performSelectorInBackground:@selector(add30mErtongfang) withObject:nil];
                }
                else if([currentFangType isEqualToString:@"50m"]){
                    //[self performSelectorInBackground:@selector(add50mErtongfang) withObject:nil];
                }
            }
            break;
        default:
            break;
    }
    if (tag != 0) {
        currentTag = tag;
    }
}

- (IBAction)bt_click30m:(id)sender
{
    currentFangType = @"30m";
    self.bt_30m.hidden = YES;
    self.bt_50m.hidden = YES;
    self.v_menu.hidden = NO;
    self.bt_back.hidden = NO;
    
    self.iv_back.image = [UIImage imageNamed:@"pingmiantu_30f"];
    
}

- (IBAction)bt_click50m:(id)sender
{
    currentFangType = @"50m";
    self.bt_30m.hidden = YES;
    self.bt_50m.hidden = YES;
    self.v_menu.hidden = NO;
    self.bt_back.hidden = NO;
    
    self.iv_back.image = [UIImage imageNamed:@"pingmiantu_50f"];
    
}

- (IBAction)back:(id)sender
{
    self.bt_30m.hidden = NO;
    self.bt_50m.hidden = NO;
    self.v_menu.hidden = YES;
    self.bt_back.hidden = YES;
    
    self.iv_back.image = [UIImage imageNamed:@"kanfang_bg.jpg"];
    [self removeAllViewOnMatherView];
    
}


//移除加载在这里的一些控件
-(void)removeAllViewOnMatherView
{
    for (UIView *view in [self.v_matherView subviews]) {
        [view removeFromSuperview];
    }
}



-(void)add30mKeting
{
    [self loadSkybox:@"30m客厅"];
}
-(void)add50mKeting
{
    [self loadSkybox:@"50m客厅"];
}
-(void)add30mZhuwo
{
    [self loadSkybox:@"30m主卧"];
}
-(void)add50mZhuwo
{
    [self loadSkybox:@"50m主卧"];
}
-(void)add30mCiwo
{
    [self loadSkybox:@"30m次卧"];
}
-(void)add50mCiwo
{
    [self loadSkybox:@"50m次卧"];
}
-(void)add30mWeishengjian
{
    [self loadSkybox:@"30m卫生间"];
}
-(void)add50mWeishengjian
{
    [self loadSkybox:@"50m卫生间"];
}
-(void)add30mChufang
{
    [self loadSkybox:@"30m厨房"];
}
-(void)add50mChufang
{
    [self loadSkybox:@"50m厨房"];
}
-(void)add30mErtongfang
{
    [self loadSkybox:@"30m儿童房"];
}
-(void)add50mErtongfang
{
    [self loadSkybox:@"50m儿童房"];
}

//加载skybox
- (void)loadSkybox:(NSString *)type
{
    isLoading = YES;
    skyboxView = [[CustSkyBoxView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768) andType:type];
    [self.v_matherView addSubview:skyboxView];
    
    isLoading = NO;
}



@end
