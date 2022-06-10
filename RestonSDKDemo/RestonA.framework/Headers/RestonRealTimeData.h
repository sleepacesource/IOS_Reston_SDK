//
//  RestonRealTimeData.h
//  SDK
//
//  Created by Martin on 2017/7/28.
//  Copyright © 2017年 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestonRealTimeData : NSObject

@property (nonatomic,assign) BOOL awakeFlag;//清醒标志
@property (nonatomic,assign) BOOL asleepFlag;//入睡标志
@property (nonatomic,assign) UInt8 breathRate;//呼吸率
@property (nonatomic,assign) UInt8 heartRate;//心率
@property (nonatomic,assign) NSInteger status;//状态
@property (nonatomic,assign) NSInteger statusValue;//状态值

@property (nonatomic,assign) NSInteger temperture;//温度
@property (nonatomic,assign) NSInteger humidity;//湿度

@property (nonatomic,readonly) BOOL isOffBed;//是否为离床
@property (nonatomic,readonly) BOOL isInit;
@end
