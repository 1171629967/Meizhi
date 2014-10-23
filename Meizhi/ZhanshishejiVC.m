//
//  ZhanshishejiVC.m
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import "ZhanshishejiVC.h"
#import "PanoramaGL/PLView.h"

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
             [self hideMenu];
            break;
        case 3:
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

- (void)playMovie{
    NSString *s = [[NSBundle mainBundle] pathForResource:@"piantou" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:s];
    playerViewController = [[MPMoviePlayerViewController alloc]     initWithContentURL:url];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playVideoFinished:) name:MPMoviePlayerPlaybackDidFinishNotification object:[playerViewController moviePlayer]];
    playerViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:playerViewController animated:NO];
    MPMoviePlayerController *player = [playerViewController moviePlayer];
    [player play];
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
