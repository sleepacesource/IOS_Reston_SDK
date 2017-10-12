//
//  SimulateData+ScoreDeduction.m
//  RestonSDKDemo
//
//  Created by San on 2017/9/15.
//  Copyright © 2017年 medica. All rights reserved.
//

#import "SimulateData+ScoreDeduction.h"

@implementation SimulateData (ScoreDeduction)

+ (NSArray *)backDeductionArrayyFromAnalysis:(HistoryDataAnalysis*)analysis
{
    NSMutableArray * deductionNameArr=[[NSMutableArray alloc]initWithCapacity:0];
    NSMutableArray * deductionValueArr=[[NSMutableArray alloc]initWithCapacity:0];
    for (HistoryDataScoreDeduction *scoreObj in analysis.scoreDeductionAry) {
        switch (scoreObj.type) {
            case Reston_ScoreDeductibleType_BodyMoveToomuch:
            {
                [deductionNameArr addObject:@"restless"];
            }
                break;
            case Reston_ScoreDeductibleType_LeftBedToomany:
            {
                [deductionNameArr addObject:@"up_night_more"];
            }
                break;
            case Reston_ScoreDeductibleType_AwakeTooFrequent:
            {
                [deductionNameArr addObject:@"wake_times_too_much"];
            }
                break;
            case Reston_ScoreDeductibleType_SleepToolate:
            {
                [deductionNameArr addObject:@"start_sleep_time_too_latter"];
            }
                break;
            case Reston_ScoreDeductibleType_DifficultToSleep:
            {
                [deductionNameArr addObject:@"fall_asleep_hard"];
            }
                break;
            case Reston_ScoreDeductibleType_DeepSleepNotEnough:
            {
                [deductionNameArr addObject:@"deep_sleep_time_too_short"];
            }
                break;
            case Reston_ScoreDeductibleType_SleepTooLong:
            {
                [deductionNameArr addObject:@"actual_sleep_long"];
            }
                break;
            case Reston_ScoreDeductibleType_SleepTooShort:
            {
                [deductionNameArr addObject:@"actual_sleep_short"];
            }
                break;
            case Reston_ScoreDeductibleType_BreathPause:
            {
                [deductionNameArr addObject:@"respiration_pause"];
            }
                break;
            case Reston_ScoreDeductibleType_BreathLow:
            {
                [deductionNameArr addObject:@"deduction_breathe_slow"];
            }
                break;
            case Reston_ScoreDeductibleType_BreathHight:
            {
                [deductionNameArr addObject:@"deduction_breathe_fast"];
            }
                break;
            case Reston_ScoreDeductibleType_HeartbeatPause:
            {
                [deductionNameArr addObject:@"heart_pause"];
            }
                break;
            case Reston_ScoreDeductibleType_HeartbeatLow:
            {
                [deductionNameArr addObject:@"heartrate_too_low"];
            }
                break;
            case Reston_ScoreDeductibleType_HeartbeatHigh:
            {
                [deductionNameArr addObject:@"heartrate_too_fast"];
            }
                break;
            case Reston_ScoreDeductibleType_optimumSleepPercentTooLow:
            {
                [deductionNameArr addObject:@"benign_sleep"];
            }
                break;
            default:
                break;
        }
        [deductionValueArr addObject:[NSString stringWithFormat:@"-%d",scoreObj.score]];
    }
    
    return @[deductionNameArr,deductionValueArr];
}

+(NSString *)backBreathPause:(NSArray *)breathArray user:(UserObj *)obj
{
    int index=0;
    NSMutableString *result=[[NSMutableString alloc]initWithCapacity:0];
    for (int i=0 ; i<breathArray.count; i++) {
        int  time=[[breathArray objectAtIndex:i] intValue];
        if (time!=0) {
            index++;
            NSTimeInterval timeInterval = obj.startTime.integerValue + i* 60;
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
            NSDateFormatter *df = [[NSDateFormatter alloc] init];
            [df setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:obj.timezone.intValue]];
            df.dateFormat = @"HH:mm";
            NSString *timeStr = [df stringFromDate:date];
            NSString *second=[NSString stringWithFormat:@"%d",index];
            NSString *bstr=[NSString stringWithFormat:NSLocalizedString(@"sequence", nil), second];
            [result appendString:[NSString stringWithFormat:@"%@ %@  %ds\n",bstr,timeStr,time]];
        }
    }
    return result;
}

@end
