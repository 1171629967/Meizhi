//
//  WLXAppDelegate.h
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface WLXAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AVAudioPlayer *player;

- (void)playSound:(NSString *)fileName;
- (void)startSound;
- (void)stopSound;
//syj的注释
//吊袜的注释
@end
