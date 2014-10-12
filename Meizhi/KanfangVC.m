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
    
    CustSkyBoxView *ztView = [[CustSkyBoxView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768) andType:@"客厅"];
    [self.view addSubview:ztView];
    
    
    //初始化一个底部的scrollview加入视图
    sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 548, 1024, 120)];
    [sv setTag:100];
    sv.scrollEnabled = YES;
    sv.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self.view addSubview:sv];
    
    //在滚动视图中加入所有图标icon控件
    [self addScrollIcon];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//给滚动栏添加图标
- (void)addScrollIcon
{
    NSString *formatStr = @"kanfang_icon_%d.png";
    
   
    for (int i = 0; i < 7; i++) {
        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(i*200+10*(i+1), 10, 200, 100)];
        [iv setTag:i+1];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:formatStr,i+1]];
        [iv setImage:image];
        [sv addSubview:iv];
        
        //给背景layer加白色
        iv.layer.borderColor = [UIColor whiteColor].CGColor;
        
        iv.userInteractionEnabled=YES;
        UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(iconClick:)];
        [iv addGestureRecognizer:singleTap];
    }
    //设置scrollview可滚动范围
    [sv setContentSize:CGSizeMake(200*7+10*(7+1), 120)];
}

- (void)iconClick:(id)sender
{    
    UITapGestureRecognizer *singleTap = (UITapGestureRecognizer *)sender;
    int tag = (int)[singleTap view].tag;

    //事先把所有底边边距恢复为0
    for (UIImageView *iv in [sv subviews]) {
        iv.layer.borderWidth = 0;
    }
    //设置选中的那个边距为4
    [singleTap view].layer.borderWidth = 4;
    
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
        case 6:
            
            break;
        case 7:
            
            break;
        default:
            break;
    }
}


@end
