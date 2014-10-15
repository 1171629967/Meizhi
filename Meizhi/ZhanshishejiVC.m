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
//            [self hideMenu];
            break;
        case 2:
//             [self hideMenu];
            break;
        case 3:
//             [self hideMenu];
            break;
        default:
            break;
    }
}

- (void) hideMenu{
    self.bt1.hidden = YES;
    self.bt2.hidden = YES;
    self.bt2.hidden = YES;
}

//加载片头视频数据
//- (void)loadPianTouData
//{
//    NSString* s = [[NSBundle mainBundle] pathForResource:@"piantou" ofType:@"mp4"];
//    NSURL* url = [NSURL fileURLWithPath:s];
//    theMovie= [[MPMoviePlayerController alloc] initWithContentURL:url];
//    theMovie.controlStyle = MPMovieControlStyleNone;
//    
//    theMovie.view.frame = CGRectMake(0, 0, 1024, 768);
//    [self.view addSubview:theMovie.view];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(myMovieFinishedCallback:)
//                                                 name:MPMoviePlayerPlaybackDidFinishNotification
//                                               object:theMovie];
//}

@end
