//
//  ZTView.m
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-13.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import "ZTView.h"

@implementation ZTView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSkyboxZT];
    }
    return self;
}

- (void)loadSkyboxZT
{
    PLView* retainPlview = [[PLView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    retainPlview.isScrollingEnabled = YES;
    retainPlview.isInertiaEnabled = NO;
    plView =retainPlview;
    [self insertSubview:plView atIndex:0];
    //[retainPlview release];
    
    PLCubicPanorama *cubicPanorama = [PLCubicPanorama panorama];
    [cubicPanorama setTexture:[PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"ZT_0" ofType:@"jpg"]]] face:PLCubeFaceOrientationFront];
    [cubicPanorama setTexture:[PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"ZT_2" ofType:@"jpg"]]] face:PLCubeFaceOrientationBack];
    [cubicPanorama setTexture:[PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"ZT_3" ofType:@"jpg"]]] face:PLCubeFaceOrientationLeft];
    [cubicPanorama setTexture:[PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"ZT_1" ofType:@"jpg"]]] face:PLCubeFaceOrientationRight];
    [cubicPanorama setTexture:[PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"ZT_4" ofType:@"jpg"]]] face:PLCubeFaceOrientationUp];
    [cubicPanorama setTexture:[PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:@"ZT_5" ofType:@"jpg"]]] face:PLCubeFaceOrientationDown];
    [plView setPanorama:cubicPanorama];
}

@end
