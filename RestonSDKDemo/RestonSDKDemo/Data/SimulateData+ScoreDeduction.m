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

+(NSString *)backBreathPauseTimes:(NSArray *)ahiArray
{
//    ahiArrayStr = @"[4638,5916,6,2,22,9,8,44,64]";
    if(ahiArray){
        NSMutableString *result=[[NSMutableString alloc]initWithCapacity:0];
        if(ahiArray&&ahiArray.count >= 3){
            //            [4638,5916,6,2,22,9,8,44,64]"
            int start_hour = ([ahiArray[0] intValue] >> 8) & 0xff;
            int start_min =[ahiArray[0] intValue] & 0xff;
            int wake_hour = ([ahiArray[1] intValue] >> 8) & 0xff;
            int wake_min =[ahiArray[1] intValue] & 0xff;
            int duration = [ahiArray[2] intValue];//持续时长N小时
            
            int startMins = start_hour*60 + start_min ;
            int endMIns = start_hour*60 + start_min + 60 - start_min;
            
            for (int i=0 ; i<duration; i++) {
                NSString *start_time = [self minutesToTimeStr:startMins];
                NSString *end_time = [self minutesToTimeStr:endMIns];
                startMins = endMIns;
                endMIns = startMins + 60;
                
                if(i==duration-1 && ( endMIns >(wake_hour*60+wake_min))){//最后一个小时结束时间是否比实际清醒时间大，如果大，选择实际清醒时间
                    end_time = [self minutesToTimeStr:wake_hour*60+wake_min];
                    NSLog(@"实际清醒时间:%@",end_time);
                }
                NSString *ahi_time = [NSString stringWithFormat:@"%@~%@",start_time,end_time];
                NSString *ahi_seconds=[NSString stringWithFormat:@"%@%@",ahiArray[i+3],NSLocalizedString(@"unit_times", nil)];
                
                [result appendString:[NSString stringWithFormat:@"%@ %@\n",ahi_time,ahi_seconds]];
                
            }
            return result;
        }
        else
            return @"";
    }
    else
        return @"";
}


+ (NSString *)minutesToTimeStr:(int)min{
    return [NSString stringWithFormat:@"%02d:%02d",min/60>=24?min/60-24:min/60,min%60];
}


@end
