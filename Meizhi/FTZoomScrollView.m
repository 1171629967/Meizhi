//
//  MyScrollView.m
//  JeepCMSS
//
//  Created by xf on 12-2-8.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "FTZoomScrollView.h"

@implementation FTZoomScrollView
@synthesize image,imgView;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.maximumZoomScale = 2;
        self.minimumZoomScale = 1;
        UIImageView *_imgView = [[UIImageView alloc] init];
        _imgView.userInteractionEnabled = YES;
        self.imgView = _imgView;
        [self addSubview:_imgView];
        [_imgView release];
    }
    
    return self;
}

-(void)setImage:(UIImage *)img{
    imgView.image = img;
    imgView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return imgView;
}
-(void)dealloc{
    [image release];
    [super dealloc];
}
@end
