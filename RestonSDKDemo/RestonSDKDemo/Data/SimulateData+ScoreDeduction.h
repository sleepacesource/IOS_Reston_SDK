//
//  SimulateData+ScoreDeduction.h
//  RestonSDKDemo
//
//  Created by San on 2017/9/15.
//  Copyright © 2017年 medica. All rights reserved.
//

#import "SimulateData.h"

@interface SimulateData (ScoreDeduction)

+ (NSArray *)backDeductionArrayyFromAnalysis:(HistoryDataAnalysis*)analysis;

+(NSString *)backBreathPause:(NSArray *)breathArray user:(UserObj *)obj;

@end
