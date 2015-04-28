//
//  ZTView.h
//  Meizhi
//
//  Created by 王 李鑫 on 14-10-13.
//  Copyright (c) 2014年 wlx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTDoorBaseView.h"
#import "PanoramaGL/PLView.h"


@interface CustSkyBoxView : FTDoorBaseView
{
    PLView *plView;
}

- (id)initWithFrame:(CGRect)frame andType:(NSString *)type;

@end
