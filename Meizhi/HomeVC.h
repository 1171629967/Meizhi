//
//  HomeVC.h
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

#import "QuweijiazhiVC.h"
#import "XiangmushejiVC.h"
#import "ZhanshishejiVC.h"
#import "HuxingjianshangVC.h"
#import "KanfangVC.h"
#import "DaikuanjisuanVC.h"

@interface HomeVC : UIViewController
{
    MPMoviePlayerController *theMovie;
    
    QuweijiazhiVC *quweijiazhiVC;
    XiangmushejiVC *xiangmushejiVC;
    ZhanshishejiVC *zhanshishejiVC;
    HuxingjianshangVC *huxingjianshangVC;
    KanfangVC *kanfangVC;
    DaikuanjisuanVC *daikuanjisuanVC;
    
    int currentTag;
    
    BOOL isDown;
}
@property (strong, nonatomic) IBOutlet UIView *myBackView;
@property (strong, nonatomic) IBOutlet UIView *tabBarView;



@property (strong, nonatomic) IBOutlet UIButton *bt_logo;
@property (strong, nonatomic) IBOutlet UIButton *bt_quweijiazhi;
@property (strong, nonatomic) IBOutlet UIButton *bt_xiangmusheji;
@property (strong, nonatomic) IBOutlet UIButton *bt_zanshisheji;
@property (strong, nonatomic) IBOutlet UIButton *bt_huxingjianshang;
@property (strong, nonatomic) IBOutlet UIButton *bt_360kanfang;
@property (strong, nonatomic) IBOutlet UIButton *bt_daikuanjisuan;

- (IBAction)daohangIconClick:(id)sender;


@end
