//
//  FTCircleImageView.h
//  FrontopProject
//
//  Created by MacMini01 on 12-7-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTRoundEndProtal.h"
@interface FTCircleImageView : UIImageView
{
    NSInteger _count;   //图片总数
    NSInteger _curCount;//当前第x张图片
    CGPoint _curlocal;  //当前坐标
    CGPoint _latelocal; //上一次坐标
    NSString *_path360; //360图片的位置
    BOOL _isSkipFrame;  //是否跳帧
    BOOL _isRound;      //是否是circle替换
    NSString *preName;
    id<FTRoundEndProtal> delegate;
}
@property (nonatomic,assign) CGPoint curlocal;
@property (nonatomic,assign) CGPoint latelocal;
@property (nonatomic,assign) NSInteger count;
@property (nonatomic,assign) NSInteger curCount;
@property (nonatomic,retain) NSString *path360;
@property (nonatomic,assign) BOOL isSkipFrame;
@property (nonatomic,assign) BOOL isRound;
@property (nonatomic,retain) NSString *preName;
@property (nonatomic,assign) id<FTRoundEndProtal> delegate;

@end
