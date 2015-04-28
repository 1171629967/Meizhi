//
//  Quweijiazhi.m
//  Meizhi
//
//  Created by 王 李鑫 on 14/10/23.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import "Quweijiazhi.h"

@implementation Quweijiazhi

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        int width = 4000;
        int height = 3078;
        
        self.delegate = self;
        //self.maximumZoomScale = 1.5;
        self.maximumZoomScale = (float)height/768;
        self.minimumZoomScale = 1.0;
        self.bounces = NO;
        self.zoomScale = (float)height/768;
        //self.zoomScale = 1.0;
        self.contentOffset = CGPointMake(200, height/2);
        self.contentSize = CGSizeMake((float)768/height*width, 768);
        //self.contentSize = CGSizeMake(1024,768);
        self.backgroundColor = [UIColor clearColor];
        
        imgView = [[UIImageView alloc] init];
        imgView.userInteractionEnabled = YES;
        imgView.image = [UIImage imageNamed:@"quwei_bg.jpg"];
        //imgView.frame = CGRectMake(0, 0, 1024, 768);
        
        imgView.frame = CGRectMake(0, 0, (float)768/height*width, 768);
        
        [self addSubview:imgView];
        
        
        //给旋转添加点击监听
        UITapGestureRecognizer *singleTap1 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideTanchukuang)];
        [self addGestureRecognizer:singleTap1];

    }
    return self;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return imgView;
}

- (void)hideTanchukuang
{
    //发出通知，把底部导航栏控件收起来
    [[NSNotificationCenter defaultCenter] postNotificationName:Notification_DownTabBarView object:nil];
}

@end
