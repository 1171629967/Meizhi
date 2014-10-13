//
//  FThdjsq.h
//  LCMGYPro
//
//  Created by MacMini01 on 12-10-11.
//  Copyright (c) 2012年 MacMini01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FThdjsq : NSObject
{
    NSInteger qishu;
    NSInteger houxuqishu;
    double shiyonglv;
    double qichuyue;
    double guihuanbenxi;
    double guihuanlixi;
    double guihuanbenjin;
    double qimoyue;
}
@property (nonatomic, assign) NSInteger qishu;
@property (nonatomic, assign) NSInteger houxuqishu;
@property (nonatomic, assign) double shiyonglv;
@property (nonatomic, assign) double qichuyue;
@property (nonatomic, assign) double guihuanbenxi;
@property (nonatomic, assign) double guihuanlixi;
@property (nonatomic, assign) double guihuanbenjin;
@property (nonatomic, assign) double qimoyue;
+(double)numeber:(double)num cimi:(NSInteger)cimi;
+(NSArray *)dengEhk:(double)jinne qixian:(NSInteger)qi lilv:(double)ll;
+(NSArray *)dengBhk:(double)jinne qixian:(NSInteger)qi lilv:(double)ll;

//等额还款
+(double)dengeLjhklx:(double)jinne qixian:(NSInteger)qi lilv:(double)ll;
+(double)dengeLjhkzs:(double)jinne qixian:(NSInteger)qi lilv:(double)ll;
//等本还款
+(double)dengbLjhklx:(double)jinne qixian:(NSInteger)qi lilv:(double)ll;
+(double)dengbLjhkzs:(double)jinne qixian:(NSInteger)qi lilv:(double)ll;
@end
