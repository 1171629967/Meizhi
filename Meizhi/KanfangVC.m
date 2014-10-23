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
    currentFloor = 1;
    currentTag = -1;
    
    
    //给背景添加点击监听
    self.iv_back.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap1 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideTanchukuang)];
    [self.iv_back addGestureRecognizer:singleTap1];
    
    
    
    
    //初始化右侧菜单
    v_menu = [[UIView alloc] initWithFrame:CGRectMake(966, 170, 260, 428)];
    [self.view addSubview:v_menu];
    v_menu.hidden = YES;
    //初始化菜单背景并加入菜单
    UIImageView *iv_menuBack = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 260, 428)];
    [iv_menuBack setImage:[UIImage imageNamed:@"sidebar_bg.png"]];
    [v_menu addSubview:iv_menuBack];
    
    iv_menuReturn = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 46, 46)];
    [iv_menuReturn setImage:[UIImage imageNamed:@"sidebar_return.png"]];
    [v_menu addSubview:iv_menuReturn];
    //添加菜单移进移出按钮
    UIButton *bt_menuCloseOrOpen = [[UIButton alloc] initWithFrame:CGRectMake(9, 9, 46, 46)];
    bt_menuCloseOrOpen.tag = 0;
    [bt_menuCloseOrOpen addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    [v_menu addSubview:bt_menuCloseOrOpen];
    //平面按钮
    UIButton *bt_menu_pingming = [[UIButton alloc] initWithFrame:CGRectMake(68, 5, 179, 55)];
    [bt_menu_pingming setImage:[UIImage imageNamed:@"sidebar_pingmian.png"] forState:UIControlStateNormal];
    bt_menu_pingming.tag = 1;
    [bt_menu_pingming addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    [v_menu addSubview:bt_menu_pingming];
    //客餐厅按钮
    UIButton *bt_menu_kecanting = [[UIButton alloc] initWithFrame:CGRectMake(68, 63, 179, 55)];
    [bt_menu_kecanting setImage:[UIImage imageNamed:@"sidebar_kecanting.png"] forState:UIControlStateNormal];
    bt_menu_kecanting.tag = 2;
    [bt_menu_kecanting addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    [v_menu addSubview:bt_menu_kecanting];
    //主卧室按钮
    UIButton *bt_menu_zhuwoshi = [[UIButton alloc] initWithFrame:CGRectMake(68, 127, 179, 55)];
    [bt_menu_zhuwoshi setImage:[UIImage imageNamed:@"sidebar_zhuwoshi.png"] forState:UIControlStateNormal];
    bt_menu_zhuwoshi.tag = 3;
    [bt_menu_zhuwoshi addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    [v_menu addSubview:bt_menu_zhuwoshi];
    //次卧室按钮
    UIButton *bt_menu_ciwoshi = [[UIButton alloc] initWithFrame:CGRectMake(68, 185, 179, 55)];
    [bt_menu_ciwoshi setImage:[UIImage imageNamed:@"sidebar_ciwoshi.png"] forState:UIControlStateNormal];
    bt_menu_ciwoshi.tag = 4;
    [bt_menu_ciwoshi addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    [v_menu addSubview:bt_menu_ciwoshi];
    //卫生间按钮
    UIButton *bt_menu_weishengjian = [[UIButton alloc] initWithFrame:CGRectMake(68, 248, 179, 55)];
    [bt_menu_weishengjian setImage:[UIImage imageNamed:@"sidebar_weishengjian.png"] forState:UIControlStateNormal];
    bt_menu_weishengjian.tag = 5;
    [bt_menu_weishengjian addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    [v_menu addSubview:bt_menu_weishengjian];
    //厨房按钮
    UIButton *bt_menu_chufang = [[UIButton alloc] initWithFrame:CGRectMake(68, 306, 179, 55)];
    [bt_menu_chufang setImage:[UIImage imageNamed:@"sidebar_chufang.png"] forState:UIControlStateNormal];
    bt_menu_chufang.tag = 6;
    [bt_menu_chufang addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    [v_menu addSubview:bt_menu_chufang];
    //书房按钮
    UIButton *bt_menu_shufang = [[UIButton alloc] initWithFrame:CGRectMake(68, 368, 179, 55)];
    [bt_menu_shufang setImage:[UIImage imageNamed:@"sidebar_shufang.png"] forState:UIControlStateNormal];
    bt_menu_shufang.tag = 7;
    [bt_menu_shufang addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    [v_menu addSubview:bt_menu_shufang];
    
    
   
    
    

}


//控制条左右移动
- (void)leftOrRight{
    NSInteger leftOrRightDistance;
    int x = v_menu.frame.origin.x;
    if (x == 966) {
        leftOrRightDistance = -202;
        iv_menuReturn.hidden = YES;
    }else if(x == 764){
        leftOrRightDistance = 202;
        iv_menuReturn.hidden = NO;
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3f];
    v_menu.frame = CGRectMake(v_menu.frame.origin.x+leftOrRightDistance, 170, 260, 428);
    [UIView commitAnimations];
    
}



- (void)hideTanchukuang
{
    //发出通知，把底部导航栏控件收起来
    [[NSNotificationCenter defaultCenter] postNotificationName:Notification_DownTabBarView object:nil];
}


- (void)menuClick:(id)sender
{
    UIButton *bt = (UIButton *)sender;
    int tag = (int)bt.tag;
    switch (tag) {
        case 0:
            [self leftOrRight];
            break;
        case 1:
            
                [self removeAllViewOnMatherView];
                if ([currentFangType isEqualToString:@"30m"]) {
                    self.iv_back.image = [UIImage imageNamed:@"pingmiantu_30f"];
                }
                else if([currentFangType isEqualToString:@"50m"]){
                    self.iv_back.image = [UIImage imageNamed:@"pingmiantu_50f"];
                }
            
            
            break;
        case 2:
            
                if (isLoading) {
                    return;
                }
                [self removeAllViewOnMatherView];
                if ([currentFangType isEqualToString:@"30m"]) {
                    [self performSelector:@selector(add30mKeting) withObject:nil];
                }
                else if([currentFangType isEqualToString:@"50m"]){
                    //[self performSelectorInBackground:@selector(add50mKeting) withObject:nil];
                }
            
            break;
        case 3:
            
                if (isLoading) {
                    return;
                }
                [self removeAllViewOnMatherView];
                if ([currentFangType isEqualToString:@"30m"]) {
                    [self performSelector:@selector(add30mZhuwo) withObject:nil];
                }
                else if([currentFangType isEqualToString:@"50m"]){
                    //[self performSelectorInBackground:@selector(add50mZhuwo) withObject:nil];
                }
            
            break;
        case 4:
            
                if (isLoading) {
                    return;
                }
                [self removeAllViewOnMatherView];
                if ([currentFangType isEqualToString:@"30m"]) {
                    [self performSelector:@selector(add30mCiwo) withObject:nil];
                }
                else if([currentFangType isEqualToString:@"50m"]){
                    //[self performSelectorInBackground:@selector(add50mCiwo) withObject:nil];
                }
            
            break;
        case 5:

                if (isLoading) {
                    return;
                }
                [self removeAllViewOnMatherView];
                if ([currentFangType isEqualToString:@"30m"]) {
                    [self performSelector:@selector(add30mWeishengjian) withObject:nil];
                }
                else if([currentFangType isEqualToString:@"50m"]){
                   // [self performSelectorInBackground:@selector(add50mWeishengjian) withObject:nil];
                }
            
            break;
        case 6:
            
                if (isLoading) {
                    return;
                }
                [self removeAllViewOnMatherView];
                if ([currentFangType isEqualToString:@"30m"]) {
                    [self performSelector:@selector(add30mChufang) withObject:nil];
                }
                else if([currentFangType isEqualToString:@"50m"]){
                    [self performSelector:@selector(add50mChufang) withObject:nil];
                }
            
            break;
        case 7:
                if (isLoading) {
                    return;
                }
                [self removeAllViewOnMatherView];
                if ([currentFangType isEqualToString:@"30m"]) {
                    [self performSelector:@selector(add30mShufang) withObject:nil];
                }
                else if([currentFangType isEqualToString:@"50m"]){
                    //[self performSelectorInBackground:@selector(add50mShufang) withObject:nil];
                }
            
            break;
        default:
            break;
    }
    if (tag != 0) {
        currentTag = tag;
        currentFloor = 3;
        v_menu.hidden = YES;
    }
}

- (IBAction)bt_click30m:(id)sender
{
    currentFloor = 2;
    currentFangType = @"30m";
    self.bt_30m.hidden = YES;
    self.bt_50m.hidden = YES;
    v_menu.hidden = NO;
    self.bt_back.hidden = YES;
    
    [self loadXuliezhen];
    v_menu.frame = CGRectMake(966, 170, 260, 428);
}

- (IBAction)bt_click50m:(id)sender
{
    currentFloor = 2;
    currentFangType = @"50m";
    self.bt_30m.hidden = YES;
    self.bt_50m.hidden = YES;
    v_menu.hidden = NO;
    self.bt_back.hidden = YES;
    
    [self loadXuliezhen];
    v_menu.frame = CGRectMake(966, 170, 260, 428);
}


//加载30F和50F的序列帧
-(void)loadXuliezhen
{
    [self removeAllViewOnMatherView];
    //添加旋转模块
    circleView = [[FTCircleImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    circleView.fileType = @"png";
    circleView.userInteractionEnabled = YES;
    circleView.isSkipFrame = YES;
    circleView.isRound = YES;
    circleView.path360 = [[NSBundle mainBundle] resourcePath];
    [self.view insertSubview:circleView aboveSubview:self.iv_back];
    circleView.count = 150;
    circleView.curCount = 0;
    
    if ([currentFangType isEqualToString:@"30m"]) {
        circleView.preName = @"30F_00";
        circleView.image = [UIImage imageNamed:@"30F_000.png"];
    }
    else if([currentFangType isEqualToString:@"50m"]){
        circleView.preName = @"50F_00";
        circleView.image = [UIImage imageNamed:@"50F_000.png"];
    }
    
    
    //给序列帧添加点击监听
    circleView.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap2 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideTanchukuang)];
    [circleView addGestureRecognizer:singleTap2];
    
}


- (IBAction)back:(id)sender
{
    if (currentFloor == 3) {
        v_menu.hidden = NO;
        [self loadXuliezhen];
        self.iv_back.image = [UIImage imageNamed:@"kanfang_bg.jpg"];
        currentFloor = 2;
    }
    else if(currentFloor == 2){
        self.bt_30m.hidden = NO;
        self.bt_50m.hidden = NO;
        v_menu.hidden = YES;
        self.bt_back.hidden = YES;
        self.iv_back.image = [UIImage imageNamed:@"kanfang_bg.jpg"];
        [self removeAllViewOnMatherView];
    }
    
}


//移除加载在这里的一些控件
-(void)removeAllViewOnMatherView
{
    if (circleView!=nil) {
        [circleView removeFromSuperview];
        circleView = nil;
    }
    if (skyboxView!=nil) {
        [skyboxView removeFromSuperview];
        skyboxView = nil;
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
-(void)add30mShufang
{
    [self loadSkybox:@"30m书房"];
}
-(void)add50mShufang
{
    [self loadSkybox:@"50m书房"];
}

//加载skybox
- (void)loadSkybox:(NSString *)type
{
    isLoading = YES;
    skyboxView = [[CustSkyBoxView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768) andType:type];
    [self.view insertSubview:skyboxView aboveSubview:self.iv_back];
    isLoading = NO;
    
    //给skybox添加点击监听
    skyboxView.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap3 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideTanchukuang)];
    [skyboxView addGestureRecognizer:singleTap3];
}



@end
