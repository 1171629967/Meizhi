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
    else if([type isEqualToString:@"客厅"]){
        string = @"KT_o";
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