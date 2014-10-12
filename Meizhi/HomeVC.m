//
//  HomeVC.m
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import "HomeVC.h"


@interface HomeVC ()

@end

@implementation HomeVC

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
    //[self loadPianTouData];
    //[self performSelector:@selector(playPiantou) withObject:self afterDelay:0.1];
    [self initViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


//加载片头视频数据
- (void)loadPianTouData
{
    NSString* s = [[NSBundle mainBundle] pathForResource:@"piantou" ofType:@"mp4"];
    NSURL* url = [NSURL fileURLWithPath:s];
    theMovie= [[MPMoviePlayerController alloc] initWithContentURL:url];
    theMovie.controlStyle = MPMovieControlStyleNone;
    
    theMovie.view.frame = CGRectMake(0, 0, 1024, 768);
    [self.view addSubview:theMovie.view];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myMovieFinishedCallback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:theMovie];
}

- (void)playPiantou
{
    [theMovie play];
}


//片头视频播放完毕后的回调
- (void)myMovieFinishedCallback:(NSNotification*)aNotification
{
    MPMoviePlayerController *theMovie=[aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:theMovie];
    
    [theMovie.view removeFromSuperview];
    
    
    
}



- (void)initViews
{
    self.bt_quweijiazhi.tag = 1;
    self.bt_xiangmusheji.tag = 2;
    self.bt_zanshisheji.tag = 3;
    self.bt_huxingjianshang.tag = 4;
    self.bt_360kanfang.tag = 5;
    self.bt_daikuanjisuan.tag = 6;
    
    quweijiazhiVC = [[QuweijiazhiVC alloc] init];
    xiangmushejiVC = [[XiangmushejiVC alloc] init];
    zhanshishejiVC = [[ZhanshishejiVC alloc] init];
    huxingjianshangVC = [[HuxingjianshangVC alloc] init];
    kanfangVC = [[KanfangVC alloc] init];
    daikuanjisuanVC = [[DaikuanjisuanVC alloc] init];
    
    //默认加载区位价值模块
    [self.myBackView addSubview:quweijiazhiVC.view];
    currentTag = 1;
}


//导航六个模块按钮监听
- (IBAction)daohangIconClick:(id)sender {
    UIButton *bt = (UIButton *)sender;
    int tag = (int)bt.tag;
    switch (tag) {
        case 1:
            if (currentTag != 1) {
                [self removeAllviewsOnMyBackView];
                [self.myBackView addSubview:quweijiazhiVC.view];
            }
            break;
        case 2:
            if (currentTag != 2) {
                [self removeAllviewsOnMyBackView];
                [self.myBackView addSubview:xiangmushejiVC.view];
            }
            break;
        case 3:
            if (currentTag != 3) {
                [self removeAllviewsOnMyBackView];
                [self.myBackView addSubview:zhanshishejiVC.view];
            }
            break;
        case 4:
            if (currentTag != 4) {
                [self removeAllviewsOnMyBackView];
                [self.myBackView addSubview:huxingjianshangVC.view];
            }
            break;
        case 5:
            if (currentTag != 5) {
                [self removeAllviewsOnMyBackView];
                [self.myBackView addSubview:kanfangVC.view];
            }
            break;
        case 6:
            if (currentTag != 6) {
                [self removeAllviewsOnMyBackView];
                [self.myBackView addSubview:daikuanjisuanVC.view];
            }
            break;
        default:
            break;
    }
    currentTag = tag;
}


//移除在myBackView上的所有子视图
- (void)removeAllviewsOnMyBackView
{
    for (UIView *view in [self.myBackView subviews]) {
        [view removeFromSuperview];
    }
}
@end
