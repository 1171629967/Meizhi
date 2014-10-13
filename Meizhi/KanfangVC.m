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
}


@end
