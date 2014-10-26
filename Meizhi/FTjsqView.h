//
//  FTjsqView.h
//  LCMGYPro
//
//  Created by MacMini01 on 12-10-11.
//  Copyright (c) 2012年 MacMini01. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTjsqView : UIView<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView *table;
    NSArray *arr;
    NSInteger type;
    UIView *informationView;
}
@property (nonatomic,assign) UITableView *table;
@property (nonatomic,retain) NSArray *arr;
@property (nonatomic,assign) NSInteger type;

@end
