//
//  WLXAppDelegate.m
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import "WLXAppDelegate.h"
#import "HomeVC.h"

@implementation WLXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor clearColor];
    
    HomeVC *homeVC = [[HomeVC alloc] init];
    
    self.window.rootViewController = homeVC;
    [self.window makeKeyAndVisible];
    
     [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    return YES;
}






- (void)playSound:(NSString *)fileName{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"mp3"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    [self.player prepareToPlay];
    [self.player setNumberOfLoops:-1];   //循环
    [self.player play];
}

- (void)stopSound{
    [self.player pause];
}

- (void)startSound{
    [self.player play];
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self stopSound];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSDate *date = [NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYYMMddHHmm"];
    NSString  *nowTimeStr = [dateformatter stringFromDate:date];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *lasttime = [ud objectForKey:@"lastTimeKey"];
    if (lasttime == nil) {
        [ud setObject:nowTimeStr forKey:@"lastTimeKey"];
    }else{
        NSComparisonResult result = [nowTimeStr compare:lasttime];
        if (result == NSOrderedDescending) {
             [ud setObject:nowTimeStr forKey:@"lastTimeKey"];
        }else{
            //很明显改了时间，坚决反对，强制退出
            [self exitApplication];
        }
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    NSString *astringstart = @"201410261600";//26号8点
    NSString *astringend = @"201410272300";//27号11点
    
    NSDate *date = [NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYYMMddHHmm"];
    NSString  *nowTimeStr = [dateformatter stringFromDate:date];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *lasttime = [ud objectForKey:@"lastTimeKey"];
    if (lasttime == nil) {
        [ud setObject:nowTimeStr forKey:@"lastTimeKey"];
    }else{
        NSComparisonResult result = [nowTimeStr compare:lasttime];
        if (result) {
            //和开始时间对比
            NSComparisonResult resultStrat = [astringstart compare:nowTimeStr];
            NSComparisonResult resultEnd = [nowTimeStr compare:astringend];
            //如果现在时间小余规定开始时间或者大于结束时间，强退
            if (resultStrat == NSOrderedDescending ||  resultEnd == NSOrderedDescending) {
                [self exitApplication];
            }
        }else{
            //很明显改了时间，坚决反对，强制退出
            [self exitApplication];
        }
    }
    [self startSound];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



//-------------------------------- 退出程序 -----------------------------------------//

- (void)exitApplication {
    
    [UIView beginAnimations:@"exitApplication" context:nil];
    
    [UIView setAnimationDuration:0.5];
    
    [UIView setAnimationDelegate:self];
    
    // [UIView setAnimationTransition:UIViewAnimationCurveEaseOut forView:self.view.window cache:NO];
    
    [UIView setAnimationTransition:UIViewAnimationCurveEaseOut forView:self.window cache:NO];
    
    [UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
    
    //self.view.window.bounds = CGRectMake(0, 0, 0, 0);
    
   self.window.bounds = CGRectMake(0, 0, 0, 0);
    
    [UIView commitAnimations];
    
}



- (void)animationFinished:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
    if ([animationID compare:@"exitApplication"] == 0) {
        
        exit(0);
        }
    
}

@end
