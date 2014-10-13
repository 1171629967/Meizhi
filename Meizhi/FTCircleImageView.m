//
//  FTCircleImageView.m
//  FrontopProject
//
//  Created by MacMini01 on 12-7-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FTCircleImageView.h"
@implementation FTCircleImageView
@synthesize curlocal = _curlocal;
@synthesize latelocal=_latelocal;
@synthesize count = _count;
@synthesize curCount = _curCount;
@synthesize path360 = _path360;
@synthesize isSkipFrame = _isSkipFrame;
@synthesize isRound = _isRound;
@synthesize preName;
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.curCount = 1;
    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.curlocal = [[touches anyObject] locationInView:self];
    self.latelocal = _curlocal;
    if ([[event allTouches] count]>=2) {
        [self.nextResponder.nextResponder.nextResponder touchesMoved:touches withEvent:event];
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    self.curlocal = [[touches anyObject] locationInView:self];
    if ([[event allTouches] count]>=2) {
        [self.nextResponder.nextResponder.nextResponder touchesMoved:touches withEvent:event];
        return;
    }
    NSInteger a;
    if (_isSkipFrame) {
        a = (NSInteger)fabs((_curlocal.x - _latelocal.x))/25+1;
    }else {
        a = 1;
    }
    if ((_curlocal.x - _latelocal.x)<-2) {
        if (_isRound) {
            self.curCount = (_curCount-=a)<1?_count:_curCount;
        }else {
            self.curCount = (_curCount-=a)<1?1:_curCount;
        }
        
    }else if((_curlocal.x - _latelocal.x)>2){
        if (_isRound) {
            self.curCount = (_curCount+=a)>_count?1:_curCount;

        }else {
            self.curCount = (_curCount+=a)>_count?_count:_curCount;
        }
    }else{
        return;
    }
    self.latelocal =_curlocal;
    self.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@%d.jpg",_path360,preName,_curCount]];
    
    
    //当旋转到前10帧的时候，显示特定按钮，进入中庭
    if (_curCount < 2) {
        [self.ztDelegate isShowButton:YES];
    }
    else
    {
        [self.ztDelegate isShowButton:NO];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([[event allTouches] count]>=2) {
        [self.nextResponder.nextResponder touchesMoved:touches withEvent:event];
    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([[event allTouches] count]>=2) {
        [self.nextResponder.nextResponder touchesMoved:touches withEvent:event];
    }
}

//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    NSInteger count = [[event allTouches] count];
//    if ([self pointInside:point withEvent:event]&&count>=2) {
//        return self.superview.superview.superview;
//    }else{
//        return [super hitTest:point withEvent:event];
//    }
//}

- (void)dealloc {
    [_path360 release];
    [super dealloc];
}
@end
