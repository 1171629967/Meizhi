//
//  XiangmushejiVC.h
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-12.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTCircleImageView.h"
#import "CustSkyBoxView.h"


@interface XiangmushejiVC : UIViewController<ZTProtal>
{
    int startX;
    int endX;
    NSMutableArray *array;
    int currentImageNo;
    FTCircleImageView *circleView;
    CustSkyBoxView *ztView;
    
    
    UIButton *bt_neitingjingguan;
}





@end
