//
//  MyScrollView.h
//  JeepCMSS
//
//  Created by xf on 12-2-8.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface FTZoomScrollView : UIScrollView <UIScrollViewDelegate>
{
    UIImage *image;
    UIImageView *imgView;
}
@property (nonatomic,retain) UIImage *image;
@property (nonatomic,assign) UIImageView *imgView;
@end
