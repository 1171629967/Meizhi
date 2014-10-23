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

//加载片头视频数据
- (void)playMovie
{
    NSString *s = [[NSBundle mainBundle] pathForResource:@"zhanshi" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:s];
    theMovie= [[MPMoviePlayerController alloc] initWithContentURL:url];
    theMovie.
    
    theMovie.view.frame = CGRectMake(0, 0, 1024, 768);
    [self.viewMovie addSubview:theMovie.view];
    
    CGRect frame = CGRectMake(50, 50, 50, 50);
    UIButton *someAddButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [someAddButton setBackgroundImage:[UIImage imageNamed:@"zhanshi_back.png"] forState:UIControlStateNormal];
    someAddButton.frame = frame;
    [someAddButton addTarget:self action:@selector(movieBackClicked) forControlEvents:UIControlEventTouchUpInside];
    [theMovie.view addSubview:someAddButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myMovieFinishedCallback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:theMovie];
    [theMovie play];
}


-(void) movieBackClicked{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:@"您点击了动态按钮！"
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
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


@end
