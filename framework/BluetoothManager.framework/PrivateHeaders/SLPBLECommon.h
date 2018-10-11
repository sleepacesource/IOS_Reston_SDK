//
//  SLPBLECommon.h
//  Sleepace
//
//  Created by Martin on 6/7/16.
//  Copyright © 2016 com.medica. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,SLPBLEProtocalType){
    SLPBLEProtocalType_Original = 0,
    SLPBLEProtocalType_Promotional,
    SLPBLEProtocalType_Sepcial,
};

typedef NS_ENUM(UInt8, BLE_RespondsCode) {
    SLP_BLE_Error_None = 0x00, //成功
    SLP_BLE_Error_MessageTypeError = 0x01,//错误的消息类型
    SLP_BLE_Error_ParameterError = 0x02,//参数错误
    SLP_BLE_Error_NotLogin = 0x03,//未登录
    SLP_BLE_Error_DataNotFound = 0x04,//数据不存在
    SLP_BLE_Error_DeviceTypeUnMatch = 0x05,//设备类型不匹配
    SLP_BLE_Error_UpgradePacketVerifyFailed = 0x06,//升级包校验错误
    SLP_BLE_Error_ProductionInfoError = 0x07,//没有正确的出厂信息
    SLP_BLE_Error_OperationError = 0x08,//操作错误
    
    SLP_BLE_Error_UnKnown = 0xff,//未知错误
};

//蓝牙消息的唯一ID 界面上使用
typedef NS_ENUM(NSInteger,SLPBLEMessagetUniqTypes) {
    //Reston
    SLPBLEMessagetUniqType_RestonLogin = 0,//reston登录
    SLPBLEMessagetUniqType_RestonSetSmartWake,//设置智能唤醒
    SLPBLEMessagetUniqType_RestonGetSmartWake,//获取智能唤醒
    SLPBLEMessagetUniqType_RestonSetAudoCollecting,//设置自动采集
    SLPBLEMessagetUniqType_RestonGetAudoCollecting,//获取自动采集
    SLPBLEMessagetUniqType_RestonGetBattery,//获取电量
    SLPBLEMessagetUniqType_RestonGetDeviceInfo,//获取设备信息
    SLPBLEMessagetUniqType_RestonSetCollectionStatus,//设置采集状态
    SLPBLEMessagetUniqType_RestonGetCollectionStatus,//获取采集状态
    SLPBLEMessagetUniqType_RestonGetDeviceVersion,//获取设备版本信息
    SLPBLEMessagetUniqType_RestonNotify,//通知设备开始上报数据
    SLPBLEMessagetUniqType_RestonPostRealTimeData,//设备向客户端上报实时数据 设备->APP
    SLPBLEMessagetUniqType_RestonPostOriginalData,//设备向客户端上报原始数据 设备->APP
    SLPBLEMessagetUniqType_RestonHistorySummaryQuery,//历史数据的概要查询
    SLPBLEMessagetUniqType_RestonHistoryBoundaryQuery,//历史数据的边界查询
    SLPBLEMessagetUniqType_RestonDownloadHistoryData,//历史数据下载
    SLPBLEMessagetUniqType_RestonDownloadHistoryDataAdditional,//带温湿度的历史数据下载
    SLPBLEMessagetUniqType_RestonPostStatus,//控制盒状态上报  设备->APP
    SLPBLEMessagetUniqType_RestonUpgradeSummery,//概要上传请求
    SLPBLEMessagetUniqType_RestonUpgradeContent,//内容上传请求
    SLPBLEMessagetUniqType_RestonGetEnviormentData,//获取环境数据
    
    //Milky
    SLPBLEMessagetUniqType_MilkyTimeCalibration,//时间校准
    SLPBLEMessagetUniqType_MilkyGetSystemInfo,//获取系统信息
    SLPBLEMessagetUniqType_MilkyGetVersionInfo,//获取版本信息
    SLPBLEMessagetUniqType_MilkySetUserInfo,//设置用户信息
    SLPBLEMessagetUniqType_MilkyGetUserInfo,//获取用户信息
    SLPBLEMessagetUniqType_MilkySetSleepTime,//设置睡眠时间
    SLPBLEMessagetUniqType_MilkyGetSleepTime,//获取睡眠时间
    SLPBLEMessagetUniqType_MilkySetAlarm,//闹钟配置
    SLPBLEMessagetUniqType_MilkySetSmartWakeupInfo,//设置智能唤醒
    SLPBLEMessagetUniqType_MilkyGetSmartWakeupInfo,//获取智能唤醒
    SLPBLEMessagetUniqType_MilkySetCollectionStatus,//设置采集状态
    SLPBLEMessagetUniqType_MilkyGetBatteryInfo,//获取电量信息
    SLPBLEMessagetUniqType_MilkyGetSleepStatus,//获取睡眠状态
    SLPBLEMessagetUniqType_MilkyGetCollectionStatus,//获取采集状态
    SLPBLEMessagetUniqType_MilkyGetEnviormentData,//获取环境数据
    SLPBLEMessagetUniqType_MilkyHistoryDataQuery,//历史数据查询
    SLPBLEMessagetUniqType_MilkyHistoryDownload,//历史数据下载啊
    SLPBLEMessagetUniqType_MilkyHistoryDownloadAdditional,//历史数据下载(含温湿度)
    SLPBLEMessagetUniqType_MilkySummaryUpload,//升级的概要信息上传
    SLPBLEMessagetUniqType_MilkyContrentUpload,//升级包上传
    
    //Pillow
    SLPBLEMessagetUniqType_PillowLogin,//Pillow登录
    SLPBLEMessagetUniqType_PillowSetSmartWake,//设置智能唤醒
    SLPBLEMessagetUniqType_PillowGetSmartWake,//获取智能唤醒
    SLPBLEMessagetUniqType_PillowSetAudoCollecting,//设置自动采集
    SLPBLEMessagetUniqType_PillowGetAudoCollecting,//获取自动采集
    SLPBLEMessagetUniqType_PillowGetBattery,//获取电量
    SLPBLEMessagetUniqType_PillowGetDeviceInfo,//获取设备信息
    SLPBLEMessagetUniqType_PillowSetCollectionStatus,//设置采集状态
    SLPBLEMessagetUniqType_PillowGetCollectionStatus,//获取采集状态
    SLPBLEMessagetUniqType_PillowGetDeviceVersion,//获取设备版本信息
    SLPBLEMessagetUniqType_PillowNotify,//通知设备开始上报数据
    SLPBLEMessagetUniqType_PillowPostRealTimeData,//设备向客户端上报实时数据 设备->APP
    SLPBLEMessagetUniqType_PillowPostOriginalData,//设备向客户端上报原始数据 设备->APP
    SLPBLEMessagetUniqType_PillowHistorySummaryQuery,//历史数据的概要查询
    SLPBLEMessagetUniqType_PillowHistoryBoundaryQuery,//历史数据的边界查询
    SLPBLEMessagetUniqType_PillowDownloadHistoryData,//历史数据下载
    SLPBLEMessagetUniqType_PillowPostStatus,//控制盒状态上报  设备->APP
    SLPBLEMessagetUniqType_PillowUpgradeSummery,//概要上传请求
    SLPBLEMessagetUniqType_PillowUpgradeContent,//内容上传请求
    
    //Mattress
    SLPBLEMessagetUniqType_Mattress_GetDeviceInfo,
    SLPBLEMessagetUniqType_Mattress_ConfigureWiFiSetting,
    SLPBLEMessagetUniqType_Mattress_GetWiFiSetting,
    SLPBLEMessagetUniqType_Mattress_ConfigureServerAddressSetting,
    SLPBLEMessagetUniqType_Mattress_GetServerAddressSetting,
    SLPBLEMessagetUniqType_Mattress_GetMacAddress,
    SLPBLEMessagetUniqType_Mattress_ConfigureWiFiDromant,
    SLPBLEMessagetUniqType_Mattress_GetWiFiStatus,
    
    //NOX2
    SLPBLEMessagetUniqType_NOX2TimeCalibration,//时间校准
    SLPBLEMessagetUniqType_NOX2FactoryReset,//恢复出厂设置
    SLPBLEMessagetUniqType_NOX2GetSystemInfo,//获取系统信息
    SLPBLEMessagetUniqType_NOX2GetVersionInfo,//获取版本信息
    SLPBLEMessagetUniqType_NOX2ConfigureUserInfo,//配置用户信息
    SLPBLEMessagetUniqType_NOX2ConfigureSleepScene,//睡眠场景配置
    SLPBLEMessagetUniqType_NOX2ConfigureLightScene,//照明场景配置
    SLPBLEMessagetUniqType_NOX2ConfigureCommonScene,//普通设备场景配置
    SLPBLEMessagetUniqType_NOX2ConfigureMultyScene,//多个场景同时配置
    SLPBLEMessagetUniqType_NOX2ConfigureAlarm,//闹铃配置
    SLPBLEMessagetUniqType_NOX2LightOperation,//灯光操作
    SLPBLEMessagetUniqType_NOX2MusicOperation,//音乐操作
    SLPBLEMessagetUniqType_NOX2SceneOperation,//场景操作
    SLPBLEMessagetUniqType_NOX2SleepAidOperation,//助眠操作
    SLPBLEMessagetUniqType_NOX2AlarmOperation,//闹铃操作
    SLPBLEMessagetUniqType_NOX2PreviewOperation,//预览操作
    SLPBLEMessagetUniqType_NOX2PlayOperation,//预览操作
    SLPBLEMessagetUniqType_NOX2GetDeviceStatus,//获取设备状态
    SLPBLEMessagetUniqType_NOX2GetOperatingMode,//获取工作模式
    SLPBLEMessagetUniqType_NOX2PostOperatingMode,//post工作模式
    SLPBLEMessagetUniqType_NOX2GetMusicList,//获取音乐列表
    SLPBLEMessagetUniqType_NOX2GetProgressOfUPgrade,//获取升级进度
    SLPBLEMessagetUniqType_NOX2UPgradeSummaryUpload,//升级概要信息上传
    SLPBLEMessagetUniqType_NOX2UPgradeContrentUpload,//升级包上传
    SLPBLEMessagetUniqType_NOX2GestureOperation,//手势操作
    SLPBLEMessagetUniqType_NOX2ConfigureWiFi,//配置WiFi
    SLPBLEMessagetUniqType_NOX2NightLightSetting,//小夜灯设置
    SLPBLEMessagetUniqType_NOX2ConfigureAlbum,//配置专辑列表
    SLPBLEMessagetUniqType_NOX2WiFiStatus,///WiFi状态查询
    SLPBLEMessagetUniqType_NOX2IpAddress,///ip地址获取
    SLPBLEMessagetUniqType_NOX2GetDeviceLog,
    SLPBLEMessagetUniqType_NOX2ConfigurePIN,//配置PIN码
    SLPBLEMessagetUniqType_NOX2GetPIN,//获取PIN码
    
    SLPBLEMessagetUniqType_None,
};
typedef NS_ENUM(UInt8, OperationSwitch) {
    OperationSwitch_OFF = 0x00,
    OperationSwitch_ON,
};

typedef NS_ENUM(UInt8, OperationMode) {
    OperationMode_Normal = 0x00,
    OperationMode_Lighting, //照明
    OperationMode_Assist, //助眠
    OperationMode_PreAssist, //预助眠
};

typedef NS_ENUM(UInt8, LightOperation) {
    LightOperation_OFF = 0x00,
    LightOperation_ON,
    LightOperation_SetBrightness,//设置亮度
};

typedef NS_ENUM(UInt8, LightOperationMode) {
    LightOperationMode_Normal = 0x00,
    LightOperationMode_Lighting, //照明
    LightOperationMode_Assist, //助眠
    LightOperationMode_PreAssist, //预助眠
};

typedef NS_ENUM(UInt8, LightMode) {
    LightMode_White = 0x00,
    LightMode_Color,
    LightMode_Fluxay,
};

typedef NS_ENUM(UInt8, GestureOperation) {
    GestureOperation_InValid = 0x00,
    GestureOperation_DeleteAll,
    GestureOperation_DeleteSingle,//删除单个
    GestureOperation_ModifyList,//修改列表，有则改，无则加
    GestureOperation_SetList, //设置列表
};

typedef NS_ENUM(NSInteger, GestureMode) {
    GestureModeWave = 0x00, //挥手
    GestureModeHover, //悬停
    GestureModeKeypad,//按键
};

typedef NS_ENUM(NSInteger, GestureActionMode) {
    GestureActionModeDefault = 0x00,
    GestureActionModePlayOrStop,
    GestureActionModeChangeMusic,
    GestureActionModeChangeLight,
    GestureActionModeChangeAlbum,
    GestureActionModeDisable = 0xFF,
};

typedef NS_ENUM(UInt8,SLPMusicStatus) {
    SLPMusicStatus_Stop = 0,
    SLPMusicStatus_Play,
    SLPMusicStatus_Pause,
    SLPMusicStatus_PrePlay = 0x0F,
};

typedef NS_ENUM(UInt8, MusicOperationMode) {
    MusicOperationMode_Normal = 0,
    MusicOperationMode_None,
    MusicOperationMode_Assist,
    MusicOperationMode_PreAssist, //预助眠
};

typedef NS_ENUM(UInt8, MusicOperation) {
    MusicOperation_Stop = 0x00,//停止后播放为从头开始
    MusicOperation_Play,
    MusicOperation_Pause,//暂停后播放为继续播放
    MusicOperation_SetVolume,//设置音量
    MusicOperation_SetPlayMode,//变更播放模式
    MusicOperation_SetPlayProgress, //播放进度调整
};

typedef NS_ENUM(NSInteger,SLPBLEPillowPostMessageType) {
    SLPBLEPillowPostMessageType_RealtimeData = 0x07,//pillow 实时数据
    SLPBLEPillowPostMessageType_OriginalData = 0x1D,//pillow 原始数据
    SLPBLEPillowPostMessageType_PillowPostStatus = 0x05//pillow 控制盒状态上报
};

typedef NS_ENUM(NSInteger,SLPBLERestonPostMessageType) {
    SLPBLERestonPostMessageType_RealtimeData = 0x07,//reston 实时数据
    SLPBLERestonPostMessageType_OriginalData = 0x1D,//reston 原始数据
    SLPBLERestonPostMessageType_RestonPostStatus = 0x05//Reston 控制盒状态上报
};

typedef NS_ENUM(NSInteger,SLPBLENoxPostMessageType) {
    SLPBLENoxPostMessageType_WorkStatus = 0x41,//工作模式
};

typedef NS_ENUM(UInt8, SceneOperation) {
    SceneOperation_Close = 0x00, //关闭场景模式(当前不是该场景，则忽略)
    SceneOperation_Open, //打开该场景模式(已开此场景, 则忽略)
    SceneOperation_ReStart, //重启(当前不是该场景，则打开)
    SceneOperation_Pause, //暂停(当前不是该场景运行，则忽略)
    SceneOperation_Recover, //恢复(当前不是该场景暂停，则忽略)
    //快速配置
    SceneOperation_Delete = 0xE5, //删除场景(当前是该场景，则停止)
    SceneOperation_Disable, //停用场景(当前是该场景，则停止)
    SceneOperation_Enable, //启用场景(只启用,不打开)
};

typedef NS_ENUM(UInt8, AlarmOperation) {
    AlarmOperation_Close = 0x00,
    AlarmOperation_Open,
    AlarmOperation_Snooze,//贪睡
    AlarmOperation_StartPreview,
    AlarmOperation_StopPreview,
    //快速配置
    AlarmOperation_Delete = 0xE5,//删除闹钟(当前该闹钟在运行，则停止)
    AlarmOperation_Disable,//停用闹钟(当前该闹钟在运行，则停止)
    AlarmOperation_Enable,//启用闹钟(只启用, 不开闹钟)
};

typedef NS_ENUM(UInt8, PreviewOperation) {
    PreviewOperation_Stop = 0x00,
    PreviewOperation_Start,
};

typedef NS_ENUM(UInt8, SleepAssistOperation) {
    SleepAssistOperation_Normal = 0x00, //正常操作下，如果辅助已经停止，设备会用后续参数会重新打开睡眠辅助
    SleepAssistOperation_ReStart, //重新开启会停止当前辅助流程，用后续参数开启睡眠辅助
    SleepAssistOperation_Stop,  //停止助眠
    SleepAssistOperation_Pause,  //暂停助眠时如果没有开启不会有动作
    SleepAssistOperation_Recover,  //恢复助眠时如果没有暂停不会有动作
    SleepAssistOperation_SlowlyStop,  //缓慢停止辅助用于检测到睡着后调用，防止惊醒用户
    SleepAssistOperation_ReSet,//重新开始计时
};

//蓝牙传输数据的默认超时时间
#define kBLEDefaultTimeoutInterval (10.0)
//蓝牙扫描的默认的超时时间
#define kBLEDefaultScanTimeoutInterval (10.0)
//蓝牙连接的默认的超时时间
#define kBLEDefaultConnectTimeoutInterval (10.0)

//获取蓝牙消息类型的描述
#define SLPBLEMessageTypeDescription(type) [SLPBLECommon descriptionOfMessagetType:type]

#define kBLEPreCode (0x12ef) //蓝牙老协议前导码
@interface SLPBLECommon : NSObject

+ (NSString *)descriptionOfMessagetType:(SLPBLEMessagetUniqTypes)type;
+ (NSString *)entityClassStringFrom:(SLPBLEMessagetUniqTypes)type;
@end
