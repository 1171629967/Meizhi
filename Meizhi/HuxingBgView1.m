//
//  HuxingBgView1.m
//  Meizhi
//
//  Created by 王 李鑫 on 14/10/26.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import "HuxingBgView1.h"

@implementation HuxingBgView1

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"pingmianhuxing1.jpg"];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideTanchukuang)];
        [self addGestureRecognizer:singleTap];
        //添加返回按钮
        UIButton *bt_back = [[UIButton alloc] initWithFrame:CGRectMake(29, 39, 50, 50)];
        [bt_back setImage:[UIImage imageNamed:@"pingmianhuxing_return.png"] forState:UIControlStateNormal];
        [bt_back addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bt_back];
        
        
        
        //---------------开始添加按钮----------------
        [self addButtonOnView:105 andY:271 andWidth:74 andHeight:73 andTag:101];
        [self addButtonOnView:182 andY:271 andWidth:67 andHeight:73 andTag:102];
        [self addButtonOnView:250 andY:271 andWidth:131 andHeight:73 andTag:103];
        [self addButtonOnView:382 andY:271 andWidth:66 andHeight:73 andTag:104];
        
        [self addButtonOnView:451 andY:271 andWidth:201 andHeight:73 andTag:105];
        [self addButtonOnView:655 andY:271 andWidth:134 andHeight:73 andTag:106];
        [self addButtonOnView:784 andY:271 andWidth:66 andHeight:73 andTag:107];
        [self addButtonOnView:853 andY:271 andWidth:74 andHeight:73 andTag:108];
        
        [self addButtonOnView:105 andY:365 andWidth:74 andHeight:73 andTag:109];
        [self addButtonOnView:178 andY:365 andWidth:672 andHeight:73 andTag:110];
        [self addButtonOnView:853 andY:365 andWidth:74 andHeight:73 andTag:111];
        //---------------结束添加按钮----------------
        
    }
    return self;
}


//给平面体添加按钮函数
-(void)addButtonOnView:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andTag:(int)tag
{
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
    bt.tag = tag;
    [bt addTarget:self action:@selector(btClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:bt];
}

//添加户型图
-(void)addHuxingtuByTag:(int)tag
{
    UIButton *bt_back = [[UIButton alloc] initWithFrame:CGRectMake(29, 39, 50, 50)];
    [bt_back setImage:[UIImage imageNamed:@"pingmianhuxing_return.png"] forState:UIControlStateNormal];
    [bt_back addTarget:self action:@selector(close2) forControlEvents:UIControlEventTouchUpInside];
    
    iv_huxingtu = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    iv_huxingtu.userInteractionEnabled = YES;
    NSString *picName;
    switch (tag) {
        case 101:
            //picName = @"D2.jpg";
            picName = @"A.jpg";
            break;
        case 102:
            picName = @"C2.jpg";
            break;
        case 103:
            picName = @"F1.jpg";
            break;
        case 104:
            picName = @"C2.jpg";
            break;            
        case 105:
            picName = @"E.jpg";
            break;
        case 106:
            picName = @"F3.jpg";
            break;
        case 107:
            picName = @"F2.jpg";
            break;
        case 108:
            //picName = @"D2.jpg";
            picName = @"A.jpg";
            break;
        case 109:
            //picName = @"D1.jpg";
            picName = @"A.jpg";
            break;
        case 110:
            picName = @"C.jpg";
            break;
        case 111:
            //picName = @"D1.jpg";
            picName = @"A.jpg";
            break;
        
        default:
            break;
    }
    iv_huxingtu.image = [UIImage imageNamed:picName];
    [iv_huxingtu addSubview:bt_back];
    [self addSubview:iv_huxingtu];
    
}

-(void)btClick:(id)sender
{
    UIButton *bt = (UIButton *)sender;
    int tag = (int)bt.tag;
    [self addHuxingtuByTag:tag];
}


- (void)hideTanchukuang
{
    //发出通知，把底部导航栏控件收起来
    [[NSNotificationCenter defaultCenter] postNotificationName:Notification_DownTabBarView object:nil];
}
-(void)close
{
    [self removeFromSuperview];
}
-(void)close2
{
    [iv_huxingtu removeFromSuperview];
    iv_huxingtu = nil;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
