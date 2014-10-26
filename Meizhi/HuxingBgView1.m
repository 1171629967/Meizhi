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
        UIButton *bt_back = [[UIButton alloc] initWithFrame:CGRectMake(29, 39, 60, 60)];
        [bt_back setImage:[UIImage imageNamed:@"pingmianhuxing_return.png"] forState:UIControlStateNormal];
        [bt_back addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bt_back];
        
    }
    return self;
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




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
