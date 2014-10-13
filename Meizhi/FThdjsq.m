//
//  FThdjsq.m
//  LCMGYPro
//
//  Created by MacMini01 on 12-10-11.
//  Copyright (c) 2012年 MacMini01. All rights reserved.
//

#import "FThdjsq.h"

@implementation FThdjsq
@synthesize guihuanbenjin,guihuanbenxi,guihuanlixi,houxuqishu,qichuyue,qimoyue,qishu,shiyonglv;
+(double)numeber:(double)num cimi:(NSInteger)cimi{
    if (cimi==0) {
        return 1;
    }else{
        double resNum = 1;
        for (int i =0; i<cimi; i++) {
            resNum *= num;
        }
        return (double)resNum;
    }
}

+(NSArray *)dengEhk:(double)jinne qixian:(NSInteger)qi lilv:(double)ll{
    NSInteger qixian = qi*12;
    NSMutableArray *arr = [NSMutableArray array];
    double dkje = jinne*10000;
    
    if (qi>=1) {
        for (int i = 1; i <= qixian; i++) {
            FThdjsq *hd = [[[FThdjsq alloc] init] autorelease];
            hd.qishu = i;
            hd.houxuqishu = qixian - i;
            hd.shiyonglv = ll;
            hd.qichuyue = dkje;
            double a = [FThdjsq numeber:(1+ll/1000) cimi:qixian];
            double b = [FThdjsq numeber:(1+ll/1000) cimi:qixian];
            hd.guihuanbenxi = (double)100*ll*a/(b-1)*(jinne/10);
            hd.guihuanlixi = (double)dkje*ll/1000;
            hd.guihuanbenjin = hd.guihuanbenxi - hd.guihuanlixi;
            dkje -= hd.guihuanbenjin;
            hd.qimoyue = dkje;
            [arr addObject:hd];
        }
    }
    return arr;
}

+(NSArray *)dengBhk:(double)jinne qixian:(NSInteger)qi lilv:(double)ll{
    NSInteger qixian = qi*12;
    NSMutableArray *arr = [NSMutableArray array];
    double dkje = jinne*10000;
    double sybx = (double)dkje/(qixian)+dkje*ll/1000;
    double a = dkje/qixian*(ll/1000);
    if (qi>=1) {
        for (int i = 1; i <= qixian; i++) {
            FThdjsq *hd = [[[FThdjsq alloc] init] autorelease];
            hd.qishu = i;
            hd.houxuqishu = qixian - i;
            hd.shiyonglv = ll;
            hd.qichuyue = dkje;
            hd.guihuanbenxi = sybx;
            hd.guihuanlixi = (double)dkje*ll/1000; 
            hd.guihuanbenjin = hd.guihuanbenxi - hd.guihuanlixi;
            dkje -= hd.guihuanbenjin;
            sybx-=a;
            hd.qimoyue = dkje;
            [arr addObject:hd];
        }
    }
    return arr;
}


//等额还款
+(double)dengeLjhklx:(double)jinne qixian:(NSInteger)qi lilv:(double)ll{
    double a = [FThdjsq numeber:(1+ll/1000) cimi:qi*12];
    double b = [FThdjsq numeber:(1+ll/1000) cimi:qi*12];
    return (double)100*ll*a/(b-1)*(jinne/10)*qi*12-jinne*10000;
}

+(double)dengeLjhkzs:(double)jinne qixian:(NSInteger)qi lilv:(double)ll{
    double a = [FThdjsq numeber:(1+ll/1000) cimi:qi*12];
    double b = [FThdjsq numeber:(1+ll/1000) cimi:qi*12];
    return (double)100*ll*a/(b-1)*(jinne/10)*qi*12;
}
//等本还款
+(double)dengbLjhklx:(double)jinne qixian:(NSInteger)qi lilv:(double)ll{
    double a = jinne*10000/(qi*12)*(ll/1000);
    return (double)(jinne*10000*ll/1000-(double)((12*qi-1)*a)/2)*12*qi;
}

+(double)dengbLjhkzs:(double)jinne qixian:(NSInteger)qi lilv:(double)ll{
    double a = jinne*10000/(qi*12)*(ll/1000);
    return (double)(jinne*10000*ll/1000-(double)((12*qi-1)*a)/2)*12*qi+jinne*10000;
}
@end
