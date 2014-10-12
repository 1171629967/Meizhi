//
//  FTTool.m
//  FTHaiNan
//
//  Created by MacMini01 on 12-8-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FTTool.h"

@implementation FTTool
+(void)alertView:(UIView *)_view {
    CAKeyframeAnimation * animation; 
    
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"]; 
    
    animation.duration = 0.7; 
    
    animation.delegate = self;
    
    animation.removedOnCompletion = YES;
    
    animation.fillMode = kCAFillModeForwards;
    
    
    
    NSMutableArray *values = [NSMutableArray array];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]]; 
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]]; 
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]]; 
    
    
    
    animation.values = values;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    
    [_view.layer addAnimation:animation forKey:nil];
}


@end
