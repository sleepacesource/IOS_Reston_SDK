//
//  UpgradeInfoObj.m
//  RestonSDKDemo
//
//  Created by San on 2017/9/12.
//  Copyright © 2017年 medica. All rights reserved.
//

#import "UpgradeInfoObj.h"

@implementation UpgradeInfoObj

+ (UpgradeInfoObj *)backUpgradeInfoFromDeviceNumber:(NSString *)numberString
{
    UpgradeInfoObj *upgradeInfo=[[UpgradeInfoObj alloc]init];
    if ([numberString isEqualToString:@"9-0"]) {
         NSString *filepath=[[NSBundle mainBundle] pathForResource:@"9-0_1.14" ofType:@"des"];
        upgradeInfo.package=[NSData dataWithContentsOfFile:filepath];
        upgradeInfo.crcDes=2539419916;
        upgradeInfo.crcBin=3855732355;
    }
    else if ([numberString isEqualToString:@"22-3"])
    {
        NSString *filepath=[[NSBundle mainBundle] pathForResource:@"22-3_1.15" ofType:@"des"];
        upgradeInfo.package=[NSData dataWithContentsOfFile:filepath];
        upgradeInfo.crcDes=2909393882;
        upgradeInfo.crcBin=3430449546;
    }
    else if ([numberString isEqualToString:@"22-4"])
    {
        NSString *filepath=[[NSBundle mainBundle] pathForResource:@"22-4_1.1.5" ofType:@"des"];
        upgradeInfo.package=[NSData dataWithContentsOfFile:filepath];
        upgradeInfo.crcDes=2909393882;
        upgradeInfo.crcBin=3430449546;
    }
    else
    {
        
    }
    
    return upgradeInfo;
}

@end
