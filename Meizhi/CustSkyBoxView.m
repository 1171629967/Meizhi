//
//  ZTView.m
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-13.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import "CustSkyBoxView.h"

@implementation CustSkyBoxView

- (id)initWithFrame:(CGRect)frame andType:(NSString *)type
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSkyboxZT:type];
    }
    return self;
}

- (void)loadSkyboxZT:(NSString *)type
{
    PLView* retainPlview = [[PLView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    retainPlview.isScrollingEnabled = YES;
    retainPlview.isInertiaEnabled = NO;
    plView =retainPlview;
    [self insertSubview:plView atIndex:0];
    
    NSString *string;
    if ([type isEqualToString:@"中庭"]) {
        string = @"ZT";
    }
    else if([type isEqualToString:@"30m客厅"]){
        string = @"KT_30m";
    }
    else if([type isEqualToString:@"50m客厅"]){
        string = @"KT_50m";
    }
    else if([type isEqualToString:@"30m主卧"]){
        string = @"zhuwo_30m";
    }
    else if([type isEqualToString:@"50m主卧"]){
        string = @"zhuwo_50m";
    }
    else if([type isEqualToString:@"30m次卧"]){
        string = @"ciwo_30m";
    }
    else if([type isEqualToString:@"50m次卧"]){
        string = @"ciwo_50m";
    }
    else if([type isEqualToString:@"30m卫生间"]){
        string = @"weishengjian_30m";
    }
    else if([type isEqualToString:@"50m卫生间"]){
        string = @"weishengjian_50m";
    }
    else if([type isEqualToString:@"30m厨房"]){
        string = @"chufang_30m";
    }
    else if([type isEqualToString:@"50m厨房"]){
        string = @"chufang_50m";
    }
    else if([type isEqualToString:@"30m书房"]){
        string = @"shufang_30m";
    }
    else if([type isEqualToString:@"50m书房"]){
        string = @"shufang_50m";
    }
    else if([type isEqualToString:@"50m小孩房"]){
        string = @"xiaohaifang_50m";
    }
    else if([type isEqualToString:@"50m衣帽间"]){
        string = @"yimaojian_50m";
    }
    
    PLCubicPanorama *cubicPanorama = [PLCubicPanorama panorama];
    
        
        [cubicPanorama setTexture:[PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_0",string] ofType:@"jpg"]]] face:PLCubeFaceOrientationFront];
        [cubicPanorama setTexture:[PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_2",string] ofType:@"jpg"]]] face:PLCubeFaceOrientationBack];
        [cubicPanorama setTexture:[PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_3",string] ofType:@"jpg"]]] face:PLCubeFaceOrientationLeft];
        [cubicPanorama setTexture:[PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_1",string] ofType:@"jpg"]]] face:PLCubeFaceOrientationRight];
        [cubicPanorama setTexture:[PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_4",string] ofType:@"jpg"]]] face:PLCubeFaceOrientationUp];
        [cubicPanorama setTexture:[PLTexture textureWithImage:[PLImage imageWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_5",string] ofType:@"jpg"]]] face:PLCubeFaceOrientationDown];
        
    
    [plView setPanorama:cubicPanorama];
}

@end
