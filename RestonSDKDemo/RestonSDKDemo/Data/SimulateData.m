//
//  simulateData.m
//  RestonSDKDemo
//
//  Created by San on 2017/8/9.
//  Copyright © 2017年 medica. All rights reserved.
//

#import "SimulateData.h"
#import "SimulateData+ScoreDeduction.h"

@implementation SimulateData

+ (UserObj *)simulateLongData
{
    UserObj *obj=[[UserObj alloc]init];
    obj.farmlyID=[NSNumber numberWithInteger:0];
    obj.memID=[NSNumber numberWithInteger:0];
    obj.date=@"2017-07-21";
    obj.duration=[NSNumber numberWithInteger:584];
    obj.startTime=[NSNumber numberWithInteger:1500649565];
    obj.score=[NSNumber numberWithInteger:41];
    obj.light=[NSNumber numberWithInteger:193];
    obj.rem=[NSNumber numberWithInteger:285];
    obj.deep=[NSNumber numberWithInteger:72];
    obj.wake=[NSNumber numberWithInteger:0];
    obj.MdDeepSleepPerc=[NSNumber numberWithInteger:10];
    obj.MdRemSleepPerc=[NSNumber numberWithInteger:39];
    obj.MdLightSleepPerc=[NSNumber numberWithInteger:27];
    obj.MdWakeSleepPerc=[NSNumber numberWithInteger:24];;
    obj.MdWakeUpTime=[NSNumber numberWithInteger:62];
    obj.wake_times=[NSNumber numberWithInteger:6];
    obj.tdcs=[NSNumber numberWithInteger:65];
    obj.fscs=[NSNumber numberWithInteger:105];
    obj.pjxl=[NSNumber numberWithInteger:64];
    obj.pjhxl=[NSNumber numberWithInteger:17];
    obj.zgxl=[NSNumber numberWithInteger:75];
    obj.zghxl=[NSNumber numberWithInteger:22];
    obj.zdxl=[NSNumber numberWithInteger:40];
    obj.zdhxl=[NSNumber numberWithInteger:12];
    obj.xtghsc=[NSNumber numberWithInteger:0];
    obj.hxgssc=[NSNumber numberWithInteger:0];
    obj.hxghsc=[NSNumber numberWithInteger:1];
    obj.hxztcs=[NSNumber numberWithInteger:1];
    obj.hxztsc=[NSNumber numberWithInteger:12];
    obj.xtztcs=[NSNumber numberWithInteger:0];
    obj.xtztsc=[NSNumber numberWithInteger:0];
    obj.lccs=[NSNumber numberWithInteger:1];
    obj.lcsc=[NSNumber numberWithInteger:417];
    
    obj.timeStep=[NSNumber numberWithInteger:60];
    obj.recordCount=[NSNumber numberWithInteger:714];
    obj.stopMode=[NSNumber numberWithInteger:0];
    obj.isupload=[NSNumber numberWithInteger:1];
    obj.reportFlag=[NSNumber numberWithInteger:1];
    obj.breathRateString=@"[15,19,14,15,15,18,14,16,14,16,15,15,15,14,15,15,15,15,16,13,15,13,14,15,12,17,15,15,19,20,19,20,17,15,15,17,17,17,18,15,15,14,15,21,19,21,16,20,18,17,17,17,13,13,14,15,15,15,15,16,17,18,18,18,18,17,18,19,16,19,16,19,19,18,19,19,19,18,18,19,19,18,17,16,15,16,15,15,16,15,16,16,16,14,16,16,15,16,15,15,17,15,15,15,17,17,16,17,15,15,17,15,18,18,14,14,14,14,15,15,15,14,15,15,15,15,14,14,15,15,15,15,15,15,15,15,19,15,17,16,19,18,19,14,15,16,20,16,20,19,18,18,18,14,17,17,19,17,17,19,14,16,14,14,15,18,16,15,15,15,15,15,16,18,19,19,19,16,18,19,14,16,17,15,15,18,18,18,16,18,17,17,19,16,19,18,20,14,19,18,18,18,19,18,17,18,18,17,18,18,19,18,18,17,17,18,19,18,17,17,16,17,15,15,19,17,18,18,19,19,18,18,18,18,18,18,17,17,16,12,18,18,19,18,19,19,18,19,19,19,18,18,16,14,15,15,16,15,13,15,15,14,14,15,14,14,14,14,14,15,17,15,15,16,16,16,16,16,16,14,17,16,18,14,17,17,15,16,17,17,17,19,17,16,20,20,18,19,18,17,18,18,18,16,18,18,19,17,12,22,18,16,16,18,19,15,19,15,17,18,17,18,17,16,17,16,17,15,15,18,17,17,17,17,19,17,17,18,19,18,18,18,18,18,19,18,17,18,17,18,18,17,16,18,18,18,18,18,17,17,18,18,18,17,18,17,17,18,17,18,17,17,17,17,17,18,18,18,16,15,15,15,14,16,16,15,14,17,13,15,15,17,17,16,18,17,17,18,18,18,18,16,16,17,18,17,18,18,18,15,14,14,14,13,14,15,17,18,13,16,17,16,16,14,13,15,15,14,14,16,16,17,18,16,18,16,16,17,16,18,17,14,15,15,17,17,17,16,18,15,16,17,18,16,17,17,17,17,18,17,17,18,18,18,17,18,18,17,15,14,15,15,15,16,15,16,17,15,14,15,15,15,15,15,15,15,15,14,14,15,14,15,16,15,15,15,15,15,16,17,16,19,16,19,18,18,20,19,17,19,18,18,19,18,20,15,22,18,18,15,19,19,18,17,19,20,15,21,20,19,20,18,20,15,17,17,17,20,17,18,18,16,21,16,18,15,17,16,18,15,17,17,15,15,18,18,17,18,16,18,18,17,15,16,17,17,18,18,19,19,18,18,19,18,18,19,19,19,18,19,19,18,18,18,18,19,19,19,19,18,19,18,18,19,18,18,18,16,15,17,16,18,19,18,13,13,14,18,17,16,17,19,16,15,12,0,0,0,0,0,0,0,12,13,0,14,15,14,15,16,15,19,15,15,15,17,19,19,19,15,15,15,15,15,15,15,18,15,15,15,15,15,0,20,16,14,17,15,16,18,18,18,15,19,19,15,15,19,16,16,15,17,15,16,15,15,19,15,18,19,17,15,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,15,15,15]";
    obj.heartRateString=@"[57,65,68,74,77,70,60,60,64,63,59,62,57,66,61,65,52,57,61,67,65,64,59,60,56,61,62,54,62,57,58,67,63,55,61,58,66,62,63,66,63,63,64,63,64,59,54,60,63,60,55,64,58,65,69,78,76,73,73,76,71,73,75,73,73,73,74,74,71,72,70,70,72,72,72,71,69,69,68,69,69,66,64,66,68,67,68,68,68,67,66,67,67,66,66,66,68,67,67,65,67,67,67,66,67,65,66,66,66,65,65,65,65,67,67,65,65,66,66,66,65,66,66,64,65,65,65,65,65,65,66,65,65,65,64,67,69,72,75,69,70,68,68,70,65,62,68,64,69,68,65,62,67,66,66,67,64,66,66,64,64,65,64,66,65,65,66,63,63,63,63,63,67,66,62,64,65,65,64,63,69,64,61,65,65,64,64,64,64,63,63,63,66,64,63,64,65,63,64,64,64,64,64,67,64,65,65,63,63,62,63,61,59,64,63,64,63,58,60,62,62,65,64,68,64,64,68,65,65,66,65,65,64,64,64,66,63,65,64,65,65,66,65,63,64,62,63,63,63,63,62,62,59,61,57,62,62,60,58,61,60,62,63,62,58,63,60,63,61,63,60,61,62,63,62,61,63,62,59,61,61,59,64,63,63,62,60,57,65,63,61,66,64,64,63,66,61,57,63,59,64,60,61,61,63,57,55,58,60,60,62,60,59,61,58,68,62,67,63,66,63,64,64,57,65,64,57,58,61,62,61,64,60,61,61,64,63,63,63,62,62,60,65,60,61,64,65,62,62,63,61,65,63,60,61,61,61,63,61,61,61,63,61,64,62,63,62,64,62,62,64,61,62,61,62,64,62,64,63,62,58,62,61,62,63,61,60,58,58,61,59,62,60,60,63,66,63,63,58,60,61,63,63,61,63,61,62,66,60,63,62,63,61,61,64,63,62,63,62,61,62,59,61,63,60,58,61,63,61,61,60,66,62,62,61,62,64,62,62,62,60,60,63,62,63,62,62,60,60,62,61,60,60,61,62,63,62,62,63,64,63,59,63,63,61,63,64,64,60,63,61,61,63,63,63,64,62,62,63,63,63,62,63,64,64,65,65,64,63,65,64,64,62,63,64,65,63,64,63,62,64,68,64,64,64,60,62,61,61,65,61,65,65,61,61,71,70,68,67,65,65,63,62,61,62,64,61,65,67,62,66,66,62,62,60,60,60,63,65,60,58,58,62,60,54,57,65,62,65,66,65,61,60,59,62,62,62,62,63,58,62,62,60,59,62,65,63,60,61,63,60,62,62,62,61,63,64,64,65,63,64,64,63,65,66,65,64,65,64,65,65,64,66,65,64,71,71,69,68,66,67,67,62,66,67,64,66,65,62,67,67,71,58,57,55,0,0,0,0,0,0,0,55,62,64,61,64,64,67,65,65,72,67,69,68,69,69,69,69,69,65,66,64,66,66,66,67,66,65,68,65,57,65,61,68,66,64,61,60,57,58,66,66,57,59,65,67,65,65,58,72,59,59,61,68,66,61,64,72,68,66,64,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,65,65,72]";
    obj.statusString=	@"[6,6,6,0,4,0,6,0,4,6,6,0,0,0,0,0,0,0,4,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,4,0,0,0,6,2,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,6,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,0,6,2,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,6,4,0,0,6,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,6,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,6,0,0,4,0,0,0,0,0,0,0,0,0,6,4,0,0,0,0,6,0,0,5,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,4,4,0,0,0,0,0,6,0,0,0,0,0,0,0,6,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,4,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,4,0,0,0,0,0,6,6,0,6,0,0,6,2,6,6,0,6,6,6,6,0,0,0,0,0,0,0,0,6,0,0,0,6,0,0,0,0,0,0,0,6,4,0,0,6,0,0,0,0,6,0,0,0,0,0,0,6,0,0,0,4,0,0,6]";
    obj.statusValueString=	@"[1,2,1,1,0,1,2,1,0,1,0,1,1,1,0,0,0,0,2,2,1,2,1,0,1,1,1,0,0,0,0,2,2,0,0,0,1,1,1,2,0,1,1,1,1,1,0,0,1,1,0,1,2,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,2,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,2,0,0,0,2,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,2,1,0,0,0,0,0,1,1,0,0,1,0,0,1,0,0,0,0,0,1,0,1,0,1,0,2,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,2,0,1,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,2,0,0,0,1,1,1,0,2,1,0,1,0,0,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,1,1,0,1,0,1,1,2,0,0,2,0,0,0,0,0,0,0,1,0,0,1,1,0,0,1,1,0,0,1,0,0,1,0,0,2,0,0,0,1,0,0,2,1,2,1,1,0,3,0,0,1,0,0,0,0,1,1,0,0,0,1,0,1,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,1,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0,1,0,0,0,2,0,1,1,0,0,1,1,1,1,0,0,1,1,0,1,0,0,0,1,0,1,0,2,1,0,1,1,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,3,1,1,0,1,1,1,1,1,0,2,1,0,1,57,60,60,60,60,60,60,2,0,12,2,0,0,0,0,0,1,1,0,1,1,2,1,2,1,1,0,0,0,0,0,1,0,2,0,0,0,11,1,1,1,0,1,0,1,1,3,1,1,0,2,0,1,1,1,2,1,1,2,0,1,2,1,1,1,0,0,0,12,60,60,60,60,60,60,60,60,60,42,60,60,60,60,60,60,60,60,60,60,60,60,60,60,60,9,18,0,0,0]";
    obj.sleepStateStr=	@"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]";
    obj.SleepCurveStr=@"[0,-0.023902,-0.048756000000000001,-0.0092659999999999999,-0.030327,-0.022877000000000002,-0.0097789999999999995,-0.01524,-0.015893000000000001,-0.030261,-0.023268,-0.018547999999999999,-0.046933000000000002,-0.045622000000000003,-0.048341000000000002,-0.028757000000000001,-0.021429,-0.00027500000000000002,-0.001263,-0.029836999999999999,-0.006594,-0.046859999999999999,-0.015524,-0.041563000000000003,-0.0016689999999999999,-0.042987999999999998,-0.045255999999999998,-0.0094570000000000001,-0.025738,-0.013479,-0.007247,-0.014944000000000001,-0.042886000000000001,-0.042882999999999998,-0.00696,-0.014681,-0.043485999999999997,-0.026883000000000001,-0.0098250000000000004,-0.042182999999999998,-0.016081000000000002,-0.044254000000000002,-0.027137000000000001,-0.023637999999999999,-0.0042079999999999999,-0.0052379999999999996,-0.042136,-0.044352999999999997,-0.024309999999999998,-0.024211,-0.0028630000000000001,-0.0030400000000000002,-0.0096530000000000001,-0.017808000000000001,-0.046686999999999999,-0.028913000000000001,-0.0027859999999999998,-0.012645999999999999,-0.037874999999999999,-0.012292000000000001,-0.049331,-0.017736999999999999,-0.045936999999999999,-0.047992,-0.047585000000000002,-0.030186999999999999,-0.01214,0,0.83006500000000005,0.96584099999999995,1.1088210000000001,1.259004,1.4165049999999999,1.581324,1.7480800000000001,1.9165460000000001,2.0067520000000001,2.091691,2.1714790000000002,2.2457729999999998,2.314003,2.376055,2.4318149999999998,2.4812829999999999,2.5244599999999999,2.5611160000000002,2.5911390000000001,2.6144150000000002,2.63117,2.6465580000000002,2.6603490000000001,2.672774,2.6838299999999999,2.693632,2.7025229999999998,2.7106159999999999,2.7180249999999999,2.7247499999999998,2.730791,2.736148,2.7410489999999998,2.7456079999999998,2.564832,2.5684800000000001,2.5717850000000002,2.575205,2.578738,2.5823860000000001,2.586147,2.5897939999999999,2.5933280000000001,2.5967470000000001,2.6001669999999999,2.603586,2.6070060000000002,2.6104250000000002,2.6136170000000001,2.8011200000000001,2.8029470000000001,2.803185,2.8009249999999999,2.7961659999999999,2.78891,2.7791549999999998,2.7659950000000002,2.750337,2.7321810000000002,2.7115269999999998,2.6883750000000002,2.6627239999999999,2.634576,2.604158,2.5719240000000001,2.5369660000000001,2.5001910000000001,2.4625089999999998,2.4239190000000002,2.3844210000000001,2.3440150000000002,2.3036080000000001,2.2613859999999999,2.2173479999999999,2.171948,2.1242779999999999,2.0743369999999999,2.0230350000000001,1.9703710000000001,1.9154359999999999,1.859594,1.803752,1.7470019999999999,1.6902520000000001,1.6335010000000001,1.5758430000000001,1.517277,1.45871,1.4001440000000001,1.341124,1.283466,1.226261,1.1686030000000001,1.1095820000000001,1.050108,0.98972599999999999,0.92843500000000001,0.86805299999999996,0.80857800000000002,0.75001200000000001,0.69416900000000004,0.64059699999999997,0.58929500000000001,0.54117000000000004,0.49803999999999998,0.458088,0.42313000000000001,0.39316600000000002,0.36819600000000002,0.34640399999999999,0.33005899999999999,0.31825500000000001,0.310083,0.30463499999999999,0.30191099999999998,0.30100300000000002,0.30327300000000001,0.307813,0.31553100000000001,0.32461099999999998,0.33505299999999999,0.34504200000000002,0.35548400000000002,0.36637900000000001,0.38045400000000001,0.39543600000000001,0.41177999999999998,0.42948599999999998,0.44764599999999999,0.46444400000000002,0.48033399999999998,0.49259199999999997,0.50258000000000003,0.50757399999999997,0.50939000000000001,0.50666500000000003,0.49985600000000002,0.48805199999999999,0.472161,0.45127699999999998,0.42721500000000001,0.39997500000000002,0.37046499999999999,0.33868500000000001,0.30645,0.27421600000000002,0.24379799999999999,0.21474199999999999,0.189772,0.16525599999999999,0.14255599999999999,0.122125,0.103966,0.088075000000000001,0.076522000000000007,0.067488999999999993,0.061931,0.058236999999999997,0.058722999999999997,0.063388,0.074144000000000002,0.091694999999999999,0.117449,0.149591,0.18993699999999999,0.23657600000000001,0.29021400000000003,0.35225899999999999,0.422711,0.499504,0.58193300000000003,0.665771,0.75031300000000001,0.83133299999999999,0.91023900000000002,0.98562300000000003,1.0567800000000001,1.121596,1.1800710000000001,1.230796,1.2779990000000001,1.322384,1.363246,1.4005860000000001,1.4344030000000001,1.4625840000000001,1.4879469999999999,1.5104919999999999,1.5330360000000001,1.5541720000000001,1.5724899999999999,1.5865800000000001,1.595739,1.599966,1.600671,1.598557,1.595035,1.589399,1.5823529999999999,1.5724899999999999,1.562627,1.5534680000000001,1.5485359999999999,1.5478320000000001,1.552764,1.561922,1.5746039999999999,1.590808,1.6105339999999999,1.633783,1.658442,1.6790430000000001,1.6955880000000001,1.7060470000000001,1.71183,1.7129380000000001,1.7113119999999999,1.704839,1.6935210000000001,1.6759459999999999,1.6508780000000001,1.6204289999999999,1.5833600000000001,1.540996,1.4946600000000001,1.444353,1.391397,1.3331470000000001,1.268276,1.1954629999999999,1.117354,1.032626,0.94260200000000005,0.84993099999999999,0.75461100000000003,0.66193999999999997,0.57191599999999998,0.48851099999999997,0.41040300000000002,0.33692699999999998,0.26808500000000002,0.20519999999999999,0.15224299999999999,0.111863,0.086706000000000005,0.074123999999999995,0.072794999999999999,0.082716999999999999,0.099918000000000007,0.12506200000000001,0.1555,0.19123200000000001,0.230934,0.277254,0.32886599999999999,0.38511200000000001,0.445988,0.51017400000000002,0.575021,0.64052900000000002,0.70669999999999999,0.77485499999999996,0.84301099999999995,0.91315199999999996,0.98263,1.0514479999999999,1.1182799999999999,1.183127,1.2433419999999999,1.2995859999999999,1.352522,1.40215,1.4484699999999999,1.4954510000000001,1.5417700000000001,1.5874269999999999,1.6311,1.673449,1.7124889999999999,1.75153,1.789909,1.8289489999999999,1.8686510000000001,1.910339,1.952688,1.995698,2.039371,2.0837050000000001,2.1273780000000002,2.173035,2.2180309999999999,2.262365,2.303391,2.341987,2.3763869999999998,2.4072520000000002,2.4345829999999999,2.457935,2.4755400000000001,2.4882789999999999,2.4961509999999998,2.4991569999999999,2.4968509999999999,2.4892349999999999,2.4732180000000001,2.4514459999999998,2.4239190000000002,2.393284,2.359985,2.3244669999999998,2.2865060000000001,2.2461039999999999,2.203703,2.1593049999999998,2.1126870000000002,2.064737,2.0154550000000002,1.9655069999999999,1.9151149999999999,1.8647229999999999,1.8143309999999999,1.764383,1.7153229999999999,1.668039,1.6229750000000001,1.5803529999999999,1.540616,1.5037659999999999,1.4706889999999999,1.442496,1.4187430000000001,1.3989860000000001,1.383003,1.3710150000000001,1.362579,1.3574740000000001,1.354366,1.35259,1.3512580000000001,1.3501479999999999,1.347928,1.344376,1.339715,1.333277,1.3250630000000001,1.3148519999999999,1.3026420000000001,1.288435,1.2711190000000001,1.2511399999999999,1.2287189999999999,1.2042999999999999,1.178993,1.15191,1.122385,1.0913060000000001,1.0588960000000001,1.024931,0.98919100000000004,0.95167400000000002,0.91260399999999997,0.87286799999999998,0.83313099999999995,0.79450500000000002,0.75698900000000002,0.72235700000000003,0.69083300000000003,0.66241399999999995,0.63865400000000005,0.61999599999999999,0.60666399999999998,0.59954200000000002,0.59818899999999997,0.60326800000000003,0.61477899999999996,0.63227999999999995,0.65532400000000002,0.68280399999999997,0.71471799999999996,0.75151100000000004,0.791184,0.83396099999999995,0.87895299999999998,0.92549800000000004,0.97403700000000004,1.0247919999999999,1.077321,1.131623,1.1874769999999999,1.2448809999999999,1.3033939999999999,1.363016,1.423745,1.484918,1.5456479999999999,1.606155,1.6651119999999999,1.723403,1.7810299999999999,1.837105,1.891629,1.9437139999999999,1.993805,2.0423439999999999,2.0884450000000001,2.1327729999999998,2.1753279999999999,2.216332,2.2560060000000002,2.294349,2.3313630000000001,2.3683770000000002,2.4040620000000001,2.4384160000000001,2.4709970000000001,2.5018050000000001,2.530618,2.5569929999999998,2.5804870000000002,2.6015429999999999,2.619939,2.6356760000000001,2.6482399999999999,2.657632,2.6639279999999999,2.6663939999999999,2.6650299999999998,2.6602779999999999,2.6514060000000002,2.6392980000000001,2.6239569999999999,2.6056029999999999,2.584311,2.5600830000000001,2.5321850000000001,2.5006149999999998,2.4646400000000002,2.4257279999999999,2.3835130000000002,2.3390949999999999,2.2928419999999998,2.244386,2.193727,2.1423350000000001,2.0898409999999998,2.036613,1.9819169999999999,1.9261189999999999,1.8692200000000001,1.8123210000000001,1.755422,1.698523,1.64089,1.5825229999999999,1.5226869999999999,1.4621170000000001,1.401915,1.342446,1.282977,1.223876,1.164774,1.1056729999999999,1.0458369999999999,0.98636900000000005,0.92653300000000005,0.86669799999999997,0.80759599999999998,0.74922900000000003,0.69122899999999998,0.63469699999999996,0.57889900000000005,0.52420299999999997,0.47024100000000002,0.41701300000000002,0.36452000000000001,0.313861,0.266874,0.22503799999999999,0.187253,0.15388499999999999,0.12418800000000001,0.098161999999999999,0.076946000000000001,0.061273000000000001,0.051181999999999998,0.047038999999999997,0.048501000000000002,0.056328999999999997,0.070143999999999998,0.090323000000000001,0.116525,0.14840800000000001,0.18598500000000001,0.230015,0.27973700000000001,0.33591199999999999,0.39892,0.46838000000000002,0.54429300000000003,0.62551900000000005,0.71167999999999998,0.80163600000000002,0.89387000000000005,0.98989899999999997,1.089345,1.1914469999999999,1.2946880000000001,1.3975500000000001,1.4985139999999999,1.5987180000000001,1.697025,1.7930539999999999,1.886047,1.975624,2.0595080000000001,2.1365590000000001,2.2066469999999998,2.2702689999999999,2.3257629999999998,2.3728660000000001,2.4111859999999998,2.4410889999999998,2.4629409999999998,2.4775,2.4838650000000002,2.4815990000000001,2.4662489999999999,2.4373710000000002,2.3942730000000001,2.3399369999999999,2.276052,2.2025950000000001,2.1191209999999998,2.0260760000000002,1.9225680000000001,1.809266,1.6868380000000001,1.5559510000000001,1.416161,1.2701370000000001,1.118771,0.96295399999999998,0.80312899999999998,0.64107800000000004,0.47769299999999998,0.31541999999999998,0.15581800000000001,0,0,0,0,0,0,0,0,0,0.029489999999999999,0.104162,0.18907599999999999,0.24449899999999999,0.24449899999999999,0.18907599999999999,0.104162,0.029489999999999999,0.28041899999999997,0.33761999999999998,0.39684799999999998,0.45797300000000002,0.52047200000000005,0.58421699999999999,0.64716600000000002,0.70813400000000004,0.76659699999999997,0.82115499999999997,0.86774200000000001,0.90253300000000003,0.924651,0.88384200000000002,0.82581700000000002,0.74930099999999999,0.67441899999999999,0.60156900000000002,0.530752,0.46196700000000002,0,-0.017808000000000001,-0.046686999999999999,-0.028913000000000001,-0.0027859999999999998,-0.012645999999999999,-0.037874999999999999,-0.012292000000000001,-0.049331,-0.017736999999999999,-0.045936999999999999,-0.047992,-0.047585000000000002,-0.030186999999999999,-0.01214,-0.009195,-0.0079620000000000003,-0.037270999999999999,-0.020552000000000001,-0.011153,-0.034629,-0.022431,-0.032209000000000002,-0.040870999999999998,-0.044831999999999997,-0.044306999999999999,-0.016202999999999999,-0.010146000000000001,-0.0027130000000000001,-0.042769000000000001,-0.041062000000000001,-0.0056600000000000001,-0.048194000000000001,-0.040099000000000003,-0.0039449999999999997,-0.035087,-0.040006,-0.015654000000000001,-0.031301000000000002,-0.0058139999999999997,-0.0041200000000000004,-0.010492,-0.0076930000000000002,-0.043919,-0.019726,-0.034070000000000003,-0.032779999999999997,-0.014024999999999999,0,-0.023902,-0.048756000000000001,-0.0092659999999999999,-0.030327,-0.022877000000000002,-0.0097789999999999995,-0.01524,-0.015893000000000001,-0.030261,-0.023268,-0.018547999999999999,-0.046933000000000002,-0.045622000000000003]";
    obj.sleepCurveStatusStr=@"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0]";
    obj.deductionName=@[@"deduction_breathe_slow",@"restless",@"up_night_more",@"actual_sleep_long",@"fall_asleep_hard",@"abnormal_breathing",@"start_sleep_time_too_latter",@"wake_times_too_much",@"benign_sleep"];
    obj.deductionValue=@[@"-1",@"-4",@"-2",@"-7",@"-15",@"-2",@"-1",@"-20",@"-7"];
    obj.breathPauseTimeString=[self simlateBreathPauseString];
    obj.asleepTime=[NSNumber numberWithInteger:68];
    obj.weekday=@"5";
    obj.week=@"30";
    obj.month=@"7";
    obj.year=@"2017";
    obj.bedTimeStr=@"23:06";
    obj.wakeUpTimeStr=@"09：58";
//    obj.source=[NSNumber numberWithInteger:6];
    obj.timezone=[NSNumber numberWithInteger:28800];
    obj.arithmeticVer=@"";
    
    return obj;
}

+ (NSString *)simlateBreathPauseString
{
    NSArray *timeArray=@[@"09:30",@"09:58"];
    NSArray *timeVlaueArray=@[@"12",@"11"];
    NSMutableString *result=[[NSMutableString alloc]initWithCapacity:0];
    for (int i=0 ; i<2; i++) {
        NSString *second=[NSString stringWithFormat:@"%d",i+1];
        NSString *bstr=[NSString stringWithFormat:NSLocalizedString(@"sequence", nil), second];
        if (i==1) {
            [result appendString:[NSString stringWithFormat:@"%@ %@  %@s",bstr,timeArray[i],timeVlaueArray[i]]];
        }
        else
            [result appendString:[NSString stringWithFormat:@"%@ %@  %@s\n",bstr,timeArray[i],timeVlaueArray[i]]];
    }
    return result;
}

+ (UserObj *)simulateShortData
{
    UserObj *obj=[[UserObj alloc]init];
    obj.date=@"2016-12-30";
    obj.timezone=[NSNumber numberWithInteger:28800];
    obj.duration=[NSNumber numberWithInteger:166];
    obj.startTime=[NSNumber numberWithInteger:1483056407];
    obj.pjxl=[NSNumber numberWithInteger:68];
    obj.pjhxl=[NSNumber numberWithInteger:14];
    obj.tdcs=[NSNumber numberWithInteger:99];
    obj.fscs=[NSNumber numberWithInteger:26];
    obj.zgxl=[NSNumber numberWithInteger:0];
    obj.zghxl=[NSNumber numberWithInteger:20];
    obj.recordCount=[NSNumber numberWithInteger:166];
    obj.asleepTime=[NSNumber numberWithInteger:0];
    obj.reportFlag=[NSNumber numberWithInteger:2];
    obj.arithmeticVer=@"";
    
    return obj;
}

+ (UserObj *)dealwithData:(SLPHistoryData *)historyData
{
    Z1_HistoryDataDetail *detail =(Z1_HistoryDataDetail *)historyData.detail;
    Z1_HistoryDataAnalysis *analysis=(Z1_HistoryDataAnalysis *)historyData.analysis;
    
    UserObj *obj=[[UserObj alloc]init];
    obj.farmlyID=[NSNumber numberWithInteger:0];
    obj.memID=[NSNumber numberWithInteger:0];
    obj.timezone=[NSNumber numberWithInteger:[[NSTimeZone systemTimeZone] secondsFromGMT]];
    
    NSDate *startDate= [NSDate dateWithTimeIntervalSince1970:historyData.summary.startTime];
    NSDateFormatter *sd = [[NSDateFormatter alloc] init];
    [sd setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:obj.timezone.intValue]];
    sd.dateFormat = @"yyyy-MM-dd";
    obj.date= [sd stringFromDate:startDate];
    obj.reportFlag=[NSNumber numberWithInteger:historyData.summary.reportFlag];
    
    obj.breathRateString=[NSString stringWithFormat:@"[%@]",[detail.breathRateValueArray componentsJoinedByString:@","]];
    obj.heartRateString=[NSString stringWithFormat:@"[%@]",[detail.heartBeatRateValueArray componentsJoinedByString:@","]];
    obj.statusString=[NSString stringWithFormat:@"[%@]",[detail.sleepStatusArray componentsJoinedByString:@","]];
    obj.statusValueString=[NSString stringWithFormat:@"[%@]",[detail.sleepStatusValueArray componentsJoinedByString:@","]];
    obj.SleepCurveStr=[NSString stringWithFormat:@"[%@]",[analysis.sleepCurveArray componentsJoinedByString:@","]];
    obj.sleepCurveStatusStr=[NSString stringWithFormat:@"[%@]",[analysis.sleepCurveStatusArray componentsJoinedByString:@","]];
    obj.duration=[NSNumber numberWithInteger:analysis.duration];
    obj.startTime=[NSNumber numberWithInteger:historyData.summary.startTime];
    obj.score=[NSNumber numberWithInteger:analysis.sleepScore];
    obj.light=[NSNumber numberWithInteger:analysis.lightSleepAllTime];
    obj.rem=[NSNumber numberWithInteger:analysis.inSleepAllTime];
    obj.deep=[NSNumber numberWithInteger:analysis.deepSleepAllTime];
    obj.wake=[NSNumber numberWithInteger:analysis.wakeAllTime];
    obj.MdDeepSleepPerc=[NSNumber numberWithInteger:analysis.deepSleepPerc];
    obj.MdRemSleepPerc=[NSNumber numberWithInteger:analysis.inSleepPerc];
    obj.MdLightSleepPerc=[NSNumber numberWithInteger:analysis.lightSleepPerc];
    obj.MdWakeSleepPerc=[NSNumber numberWithInteger:analysis.wakeSleepPerc];;
    obj.MdWakeUpTime=[NSNumber numberWithInteger:analysis.wakeAndLeaveBedBeforeAllTime];
    obj.wake_times=[NSNumber numberWithInteger:analysis.wake_Times];
    obj.tdcs=[NSNumber numberWithInteger:analysis.bodyMovementTimes];
    obj.fscs=[NSNumber numberWithInteger:analysis.trunOverTimes];
    obj.pjxl=[NSNumber numberWithInteger:analysis.averageHeartBeatRate];
    obj.pjhxl=[NSNumber numberWithInteger:analysis.averageBreathRate];
    obj.zgxl=[NSNumber numberWithInteger:analysis.maxHeartBeatRate];
    obj.zghxl=[NSNumber numberWithInteger:analysis.maxBreathRate];
    obj.zdxl=[NSNumber numberWithInteger:analysis.minHeartBeatRate];
    obj.zdhxl=[NSNumber numberWithInteger:analysis.minBreathRate];
    obj.hxghsc=[NSNumber numberWithInteger:analysis.breathRateSlowAllTime];
    obj.timeStep=[NSNumber numberWithInteger:60];
    obj.stopMode=[NSNumber numberWithInteger:0];
    obj.isupload=[NSNumber numberWithInteger:1];
    obj.asleepTime=[NSNumber numberWithInteger:analysis.fallAlseepAllTime];
    obj.recordCount = [NSNumber numberWithInteger:historyData.summary.recordCount];
    obj.lccs=[NSNumber numberWithInteger:analysis.leaveBedTimes];
    obj.arithmeticVer= analysis.algorithmVer;
    
    NSTimeInterval startTime = obj.startTime.integerValue;//上床时间
    NSTimeInterval endTime = startTime + obj.recordCount.integerValue * 60;//起床时间
    NSTimeInterval awakeTime = endTime - obj.MdWakeUpTime.integerValue * 60;//醒来时间
    NSDate *asleepDate = [NSDate dateWithTimeIntervalSince1970:startTime];
    NSDate *wakeupDate = [NSDate dateWithTimeIntervalSince1970:awakeTime];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:obj.timezone.intValue]];
    df.dateFormat = @"HH:mm";
    obj.bedTimeStr = [df stringFromDate:asleepDate];
    obj.wakeUpTimeStr = [df stringFromDate:wakeupDate];
    obj.deductionName=[self backDeductionArrayyFromAnalysis:analysis][0];
    obj.deductionValue=[self backDeductionArrayyFromAnalysis:analysis][1];
    obj.breathPauseTimeString=[self backBreathPause:analysis.breathRateStatusAry user:obj];
    
    return obj;
}

@end
