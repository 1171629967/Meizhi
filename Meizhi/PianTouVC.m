//
//  WLXViewController.m
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import "PianTouVC.h"

@interface PianTouVC ()

@end

@implementation PianTouVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self loadPianTouData];
    [self performSelector:@selector(playPiantou) withObject:self afterDelay:0.1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//加载片头视频数据
- (void)loadPianTouData
{
    NSString* s = [[NSBundle mainBundle] pathForResource:@"piantou" ofType:@"mp4"];
    NSURL* url = [NSURL fileURLWithPath:s];
    theMovie= [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    
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
    MPMoviePlayerController* theMovie=[aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:theMovie];
    
    [theMovie.view removeFromSuperview];
    
}

@end
