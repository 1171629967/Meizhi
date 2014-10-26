//
//  ZhanshishejiVC.m
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import "ZhanshishejiVC.h"
#import "PanoramaGL/PLView.h"
#import "FTThreePageScrollView.h"

@interface ZhanshishejiVC ()

@end

@implementation ZhanshishejiVC

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
- (void) initViews
{
    self.bt1.tag = 1;
    self.bt2.tag = 2;
    self.bt3.tag = 3;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btClick:(id)sender
{
    UIButton *bt = (UIButton *)sender;
    int tag = (int)bt.tag;
    switch (tag) {
            
        case 1:
            [self hideMenu];
            self.viewMovie.hidden = NO;
            [self performSelector:@selector(playMovie) withObject:self afterDelay:0.1];
            break;
        case 2:
            self.viewMovie.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"xiaoguotu_bg.jpg"] ];
            self.viewMovie.hidden = NO;
            [self xiaoguotu];
            [self hideMenu];
            break;
        case 3:
            self.viewMovie.backgroundColor=[UIColor clearColor];
            self.viewMovie.hidden = NO;
            [self xuanchuanye];
            [self hideMenu];
            break;
            
        default:
            break;
    }
}

- (void) hideMenu{
    self.bt3.hidden = YES;
    self.bt1.hidden = YES;
    self.bt2.hidden = YES;
}
- (void) showMenu{
    self.bt3.hidden = NO;
    self.bt1.hidden = NO;
    self.bt2.hidden = NO;
}

-(void)xuanchuanye{
    NSMutableDictionary *dictionary;
    dictionary = [[NSMutableDictionary alloc] init];
    for (int i = 0 ; i < 2; i++) {
        [dictionary setObject:[NSString stringWithFormat:@"xuanchuanye_%d.png",i+1] forKey:[NSString stringWithFormat:@"%d",i]];
    }
    FTThreePageScrollView *threePage = [[FTThreePageScrollView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    threePage.dictionar = dictionary;
    [self.viewMovie addSubview:threePage];
    //动态添加button,并放在最前面
    UIButton *btnBack = [[UIButton alloc]initWithFrame:CGRectMake(50, 30, 50, 50)];
    [btnBack setTitle:@"" forState:UIControlStateNormal];
    [btnBack setBackgroundImage:[UIImage imageNamed:@"zhanshi_back.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(backIsPressed:) forControlEvents:UIControlEventTouchDown];
    [self.viewMovie addSubview:btnBack];
    [self.viewMovie bringSubviewToFront:btnBack];
    [threePage setBackgroundColor:[UIColor clearColor]];
    [threePage.scrollView setContentOffset:CGPointMake(0, 0)];
}

-(void)xiaoguotu{
    NSMutableDictionary *dictionary;
    dictionary = [[NSMutableDictionary alloc] init];
    for (int i = 0 ; i < 14; i++) {
        [dictionary setObject:[NSString stringWithFormat:@"xiaoguotu_%d.png",i+1] forKey:[NSString stringWithFormat:@"%d",i]];
    }
    FTThreePageScrollView *threePage = [[FTThreePageScrollView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    threePage.dictionar = dictionary;
    [self.viewMovie addSubview:threePage];
    //动态添加button,并放在最前面
    UIButton *btnBack = [[UIButton alloc]initWithFrame:CGRectMake(50, 30, 50, 50)];
    [btnBack setTitle:@"" forState:UIControlStateNormal];
    [btnBack setBackgroundImage:[UIImage imageNamed:@"zhanshi_back.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(backIsPressed:) forControlEvents:UIControlEventTouchDown];
    [self.viewMovie addSubview:btnBack];
    [self.viewMovie bringSubviewToFront:btnBack];
    
    [threePage setBackgroundColor:[UIColor clearColor]];
    [threePage.scrollView setContentOffset:CGPointMake(0, 0)];
}

-(void)backIsPressed:(UIButton *)paramSender{
    self.viewMovie.backgroundColor=[UIColor clearColor];
    self.viewMovie.hidden = YES;
    //将view中的所有view清空并隐藏，然后显示菜单
    for (UIView *view in [self.viewMovie subviews]) {
        [view removeFromSuperview];
    }
    [self showMenu];
}

- (void)playMovie{
    NSString *s = [[NSBundle mainBundle] pathForResource:@"piantou" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:s];
    playerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    //设置视频的播放模式
    playerViewController.moviePlayer.controlStyle=MPMovieControlStyleFullscreen;
    //设置视频屏幕模式
    playerViewController.moviePlayer.scalingMode=MPMovieScalingModeAspectFit;
    [self presentMoviePlayerViewControllerAnimated:playerViewController];
    [self.viewMovie addSubview:playerViewController.view];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playVideoFinished:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:playerViewController.moviePlayer];
    [playerViewController.moviePlayer play];
}

- (void) playVideoFinished:(NSNotification *)theNotification//当点击Done按键或者播放完毕时调用此函数
{
    MPMoviePlayerController *player = [theNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:player];
    [player stop];
    [playerViewController dismissModalViewControllerAnimated:NO];
    self.viewMovie.hidden = YES;
    //将菜单再次显示出来
    [self showMenu];
    
}

@end
