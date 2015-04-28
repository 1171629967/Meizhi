//
//  ZhanshishejiVC.h
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ZhanshishejiVC : UIViewController
{
    MPMoviePlayerViewController *playerViewController;
}
@property (strong, nonatomic) IBOutlet UIButton *bt1;
@property (strong, nonatomic) IBOutlet UIButton *bt2;
@property (strong, nonatomic) IBOutlet UIButton *bt3;

@property (strong, nonatomic) IBOutlet UIView *viewMovie;


- (IBAction)btClick:(id)sender;

@end
