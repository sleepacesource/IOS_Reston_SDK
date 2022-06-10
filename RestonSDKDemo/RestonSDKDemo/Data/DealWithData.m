//
//  DealWithData.m
//  RestonSDKDemo
//
//  Created by San on 2017/8/31.
//  Copyright © 2017年 medica. All rights reserved.
//

#import "DealWithData.h"

@implementation DealWithData

+(NSArray *)backDataArray:(UserObj *)dataObj
{
    if ([dataObj.reportFlag integerValue]==1)
    {
        return [self backLongDataArray:dataObj];
    }
    else
        return [self backShortDataArray:dataObj];
}

+ (NSArray *)backShortDataArray:(UserObj *)obj
{
    NSString *date=[NSString stringWithFormat:@"%@",obj.date];
    NSString *duration=[NSString stringWithFormat:@"%02d%@%02d%@",[obj.duration integerValue]/60,NSLocalizedString(@"unit_h", nil),[obj.duration integerValue]%60,NSLocalizedString(@"unit_m", nil)];
    NSString *averageHeartRate=[NSString stringWithFormat:@"%@ %@",obj.pjxl,NSLocalizedString(@"unit_heart", nil)];
    NSString *averageBreathRate=[NSString stringWithFormat:@"%@ %@",obj.pjhxl,NSLocalizedString(@"unit_respiration", nil)];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    formatter.timeZone=[NSTimeZone localTimeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[obj.startTime integerValue]];
    NSString *startTime = [formatter stringFromDate:confromTimesp];
    NSInteger startTimeNum=[[[startTime componentsSeparatedByString:@":"] objectAtIndex:0] integerValue]*60+[[[startTime componentsSeparatedByString:@":"] objectAtIndex:1] integerValue];
    NSInteger startSleepTime=[obj.asleepTime integerValue]+startTimeNum;
    NSInteger endSleepTime=[obj.duration integerValue]+[obj.asleepTime integerValue]+startTimeNum;
    NSString *startTimeStr=[NSString stringWithFormat:@"%02d:%02d",startSleepTime/60>=24?startSleepTime/60-24:startSleepTime/60,startSleepTime%60];
    NSString *endTimeStr =[NSString stringWithFormat:@"%02d:%02d",endSleepTime/60>=24?endSleepTime/60-24:endSleepTime/60,endSleepTime%60];
     NSString *sleepTime=[NSString stringWithFormat:@"%@(%@)~%@(%@)",startTimeStr,NSLocalizedString(@"starting_point", nil),endTimeStr,NSLocalizedString(@"end_point", nil)];
    
//    NSString *temString=[NSString stringWithFormat:@"%@ ℃",obj.tem];
//    NSString *humString=[NSString stringWithFormat:@"%@ %%",obj.hum];
    
    return  @[date,sleepTime,duration,averageHeartRate,averageBreathRate];
}

+(NSArray *)backLongDataArray:(UserObj *)obj
{
    NSString *date=[NSString stringWithFormat:@"%@",obj.date];
    NSString *score=[NSString stringWithFormat:@"%@",obj.score];
    NSString *duration=[NSString stringWithFormat:@"%02d%@%02d%@",[obj.duration integerValue]/60,NSLocalizedString(@"unit_h", nil),[obj.duration integerValue]%60,NSLocalizedString(@"unit_m", nil)];
   
    NSString *asleepTime=[NSString stringWithFormat:@"%02d%@%02d%@",[obj.asleepTime integerValue]/60,NSLocalizedString(@"unit_h", nil),[obj.asleepTime integerValue]%60,NSLocalizedString(@"unit_m", nil)];
    NSString *averageHeartRate=[NSString stringWithFormat:@"%@ %@",obj.pjxl,NSLocalizedString(@"unit_heart", nil)];
    NSString *averageBreathRate=[NSString stringWithFormat:@"%@ %@",obj.pjhxl,NSLocalizedString(@"unit_respiration", nil)];
    NSString *wakes=[NSString stringWithFormat:@"%@ %@",obj.wake_times,NSLocalizedString(@"unit_times", nil)];
    NSString *turnOver=[NSString stringWithFormat:@"%@ %@",
                        obj.fscs,NSLocalizedString(@"unit_times", nil)];
    NSString *bodyMovement=[NSString stringWithFormat:@"%@ %@",obj.tdcs,NSLocalizedString(@"unit_times", nil)];
    NSString *leaveBed=[NSString stringWithFormat:@"%@ %@",obj.lccs,
                        NSLocalizedString(@"unit_times", nil)];
    NSArray *deArr=@[obj.deductionName,obj.deductionValue];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    formatter.timeZone=[NSTimeZone localTimeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[obj.startTime integerValue]];
    NSString *startTime = [formatter stringFromDate:confromTimesp];
    NSInteger startTimeNum=[[[startTime componentsSeparatedByString:@":"] objectAtIndex:0] integerValue]*60+[[[startTime componentsSeparatedByString:@":"] objectAtIndex:1] integerValue];
    NSInteger startSleepTime=[obj.asleepTime integerValue]+startTimeNum;
    NSInteger endSleepTime=[obj.duration integerValue]+[obj.asleepTime integerValue]+startTimeNum;
    NSString *startTimeStr=[NSString stringWithFormat:@"%02d:%02d",startSleepTime/60>=24?startSleepTime/60-24:startSleepTime/60,startSleepTime%60];
    NSString *endTimeStr =[NSString stringWithFormat:@"%02d:%02d",endSleepTime/60>=24?endSleepTime/60-24:endSleepTime/60,endSleepTime%60];
    NSString *sleepTime=[NSString stringWithFormat:@"%@(%@)~%@(%@)",startTimeStr,NSLocalizedString(@"asleep_point", nil),endTimeStr,NSLocalizedString(@"awake_point", nil)];
    NSString *deepPre=[NSString stringWithFormat:@"%d%%",[obj.MdDeepSleepPerc integerValue]];
    NSString *remPre=[NSString stringWithFormat:@"%d%%",[obj.MdRemSleepPerc integerValue]];
    NSString *lightPre=[NSString stringWithFormat:@"%d%%",[obj.MdLightSleepPerc integerValue]];
    NSString *wakePre=[NSString stringWithFormat:@"%d%%",[obj.MdWakeSleepPerc integerValue]];
    NSString *breathPauseStr=[NSString stringWithFormat:@"%@",obj.breathPauseTimeString.length?obj.breathPauseTimeString:NSLocalizedString(@"nothing", nil)];
//    NSString *temString=[NSString stringWithFormat:@"%@ ℃",obj.tem];
//    NSString *humString=[NSString stringWithFormat:@"%@ %%",obj.hum];
    
    return  @[date,score,deArr,sleepTime,duration,asleepTime,averageHeartRate,averageBreathRate,breathPauseStr,deepPre,remPre,lightPre,wakePre,wakes,turnOver,bodyMovement,leaveBed];
}


@end
