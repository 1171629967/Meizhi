//
//  360kanfangVC.h
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustSkyBoxView.h"
#import "FTCircleImageView.h"

@interface KanfangVC : UIViewController
{
    //目前处在第几层 第一层是两个按钮 第二层是序列帧 第三层是skybox层
    int currentFloor;
    int currentTag;
    
    int startX;
    int endX;
    NSMutableArray *array;
    int currentImageNo;
    FTCircleImageView *circleView;
    
    NSString *currentFangType;
    CustSkyBoxView *skyboxView;
    
    BOOL isLoading;
    
    
    UIView *v_menu;
    UIImageView *iv_menuReturn;
}

@property (strong, nonatomic) IBOutlet UIButton *bt_30m;
@property (strong, nonatomic) IBOutlet UIButton *bt_50m;
@property (strong, nonatomic) IBOutlet UIButton *bt_back;
@property (strong, nonatomic) IBOutlet UIImageView *iv_back;


@property (strong, nonatomic) NSString *fangType;

- (void)menuClick:(id)sender;
- (IBAction)bt_click30m:(id)sender;
- (IBAction)bt_click50m:(id)sender;
- (IBAction)back:(id)sender;


@end
