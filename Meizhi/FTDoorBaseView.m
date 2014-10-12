//
//  FTDoorBaseView.m
//  FTHaiNan
//
//  Created by MacMini01 on 12-8-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FTDoorBaseView.h"

@implementation FTDoorBaseView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)dealloc{
    [super dealloc];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    
    self.clipsToBounds = YES;
}


- (void)changeView:(id )sender{
}
@end
