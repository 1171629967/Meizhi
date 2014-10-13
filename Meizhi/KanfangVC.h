//
//  360kanfangVC.h
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KanfangVC : UIViewController
{
    int currentTag;
    
    NSString *currentFangType;
    
    BOOL isRight;
}
@property (strong, nonatomic) IBOutlet UIView *v_menu;
@property (strong, nonatomic) IBOutlet UIButton *bt_menuCloseOrOpen;
@property (strong, nonatomic) IBOutlet UIButton *bt_menu_pingming;
@property (strong, nonatomic) IBOutlet UIButton *bt_menu_kecanting;
@property (strong, nonatomic) IBOutlet UIButton *bt_menu_zhuwoshi;
@property (strong, nonatomic) IBOutlet UIButton *bt_menu_ciwoshi;
@property (strong, nonatomic) IBOutlet UIButton *bt_menu_weishengjian;
@property (strong, nonatomic) IBOutlet UIButton *bt_menu_chufang;
@property (strong, nonatomic) IBOutlet UIButton *bt_menu_shufang;
@property (strong, nonatomic) IBOutlet UIImageView *iv_return;
@property (strong, nonatomic) IBOutlet UIButton *bt_30m;
@property (strong, nonatomic) IBOutlet UIButton *bt_50m;
@property (strong, nonatomic) IBOutlet UIButton *bt_back;
@property (strong, nonatomic) IBOutlet UIImageView *iv_back;

@property (strong, nonatomic) NSString *fangType;

- (IBAction)menuClick:(id)sender;
- (IBAction)bt_click30m:(id)sender;
- (IBAction)bt_click50m:(id)sender;
- (IBAction)back:(id)sender;


@end
