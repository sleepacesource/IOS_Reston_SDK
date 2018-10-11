//
//  ControlViewController.m
//  RestonSDKDemo
//
//  Created by San on 2017/8/1.
//  Copyright © 2017年 medica. All rights reserved.
//

#import "ControlViewController.h"
#import "AutoMonitorViewController.h"
#import <Reston/Reston.h>
#import "Tool.h"
#import "SignalViewController.h"

@interface ControlViewController ()
@property (weak, nonatomic) IBOutlet UIButton *getDeviceStatusBT;
@property (weak, nonatomic) IBOutlet UIButton *setAutoMonitorBT;
@property (weak, nonatomic) IBOutlet UIButton *startCollectBT;
@property (weak, nonatomic) IBOutlet UIButton *stopCollectBT;
@property (weak, nonatomic) IBOutlet UIButton *startRealtimeDataBT;
@property (weak, nonatomic) IBOutlet UIButton *checkSignalBT;
@property (weak, nonatomic) IBOutlet UIButton *stopRealtimeDataBT;
@property (weak, nonatomic) IBOutlet UIScrollView *myscorollview;
@property (strong, nonatomic) IBOutlet UIView *cView;

@property (weak, nonatomic) IBOutlet UILabel *stautLabel;
@property (weak, nonatomic) IBOutlet UILabel *sleepStatusTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *heartRateTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *breathTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sleepStatusValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *heartRateValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *breathValueLabel;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *label1;

@end

@implementation ControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setUI];
    
    [self addLeftItem];
    
    [self initData];
}
- (void)setUI
{
    [Tool configSomeKindOfButtonLikeNomal:self.getDeviceStatusBT];
    [Tool configSomeKindOfButtonLikeNomal:self.setAutoMonitorBT];
    [Tool configSomeKindOfButtonLikeNomal:self.startCollectBT];
    [Tool configSomeKindOfButtonLikeNomal:self.stopCollectBT];
    [Tool configSomeKindOfButtonLikeNomal:self.startRealtimeDataBT];
    [Tool configSomeKindOfButtonLikeNomal:self.stopRealtimeDataBT];
    [Tool configSomeKindOfButtonLikeNomal:self.checkSignalBT];
    self.myscorollview.contentSize=self.cView.frame.size;
    [self.myscorollview addSubview:self.cView];
    self.label1.text=NSLocalizedString(@"process", nil);
    self.label1.textColor=[FontColor C4];
    self.label1.font=[FontColor T3];
    self.sleepStatusTitleLabel.textColor=[FontColor C3];
    self.sleepStatusTitleLabel.font=[FontColor T3];
    self.breathTitleLabel.textColor=[FontColor C3];
    self.breathTitleLabel.font=[FontColor T3];
    self.heartRateTitleLabel.textColor=[FontColor C3];
    self.heartRateTitleLabel.font=[FontColor T3];
    [self.getDeviceStatusBT setTitle:NSLocalizedString(@"obtain_working_state", nil) forState:UIControlStateNormal];
    [self.setAutoMonitorBT setTitle:NSLocalizedString(@"set_auto_monitor", nil) forState:UIControlStateNormal];
    [self.startCollectBT setTitle:NSLocalizedString(@"start_collection", nil) forState:UIControlStateNormal];
    [self.stopCollectBT setTitle:NSLocalizedString(@"off_collection", nil) forState:UIControlStateNormal];
    [self.startRealtimeDataBT setTitle:NSLocalizedString(@"view_data", nil) forState:UIControlStateNormal];
    [self.stopRealtimeDataBT setTitle:NSLocalizedString(@"off_data", nil) forState:UIControlStateNormal];
    [self.checkSignalBT setTitle:NSLocalizedString(@"view_signal_strength", nil) forState:UIControlStateNormal];
    self.breathTitleLabel.text=NSLocalizedString(@"breathrate", nil);
    self.heartRateTitleLabel.text=NSLocalizedString(@"heartrate", nil);
    self.sleepStatusTitleLabel.text=NSLocalizedString(@"sleep_state", nil);
    
    self.sleepStatusValueLabel.text=@"--";
    self.breathValueLabel.text=@"--";
    self.heartRateValueLabel.text=@"--";
    self.stautLabel.textColor=[FontColor C3];
    self.stautLabel.font=[FontColor T3];
    [Tool configureLabelBorder:self.stautLabel];
    self.textView.layer.borderWidth=1.0f;
    self.textView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.textView.layer.cornerRadius=2.0f;
    self.textView.textColor=[FontColor C3];
    self.textView.font=[FontColor T4];
    self.checkSignalBT.enabled=NO;
    self.startRealtimeDataBT.enabled=NO;
    self.stopRealtimeDataBT.enabled=NO;
}

- (void)addLeftItem
{
    UIButton *listButton=[UIButton buttonWithType:UIButtonTypeCustom];
    listButton.frame=CGRectMake(0, 0, 44, 44);
    [listButton setImage:[UIImage imageNamed:@"tab_btn_scenes_home.png"] forState:UIControlStateNormal];
    listButton.imageEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    [listButton addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *listItem=[[UIBarButtonItem alloc]initWithCustomView:listButton];
    self.navigationItem.leftBarButtonItem=listItem;
}

- (void)clickBack
{
    BOOL isConnected=self.selectPeripheral.peripheral&&[SLPBLESharedManager peripheralIsConnected:self.selectPeripheral.peripheral];
    if (isConnected) {
        [self disconnectedDevice];
    }
    [self.tabBarController.navigationController popToRootViewControllerAnimated:YES];
}

- (void)initData
{
    [self addRealTimeDataNotification];
}

- (void)viewWillAppear:(BOOL)animated
{
    //
    BOOL isConnected=self.selectPeripheral.peripheral&&[SLPBLESharedManager peripheralIsConnected:self.selectPeripheral.peripheral];
    self.getDeviceStatusBT.enabled=isConnected;
    self.setAutoMonitorBT.enabled=isConnected;
    self.startCollectBT.enabled=isConnected;
    if (isConnected) {
        self.stopCollectBT.enabled=!self.startCollectBT.enabled;
    }
    else
        self.stopCollectBT.enabled=isConnected;
    
    [Tool outputResultWithStr:nil textView:self.textView];
    self.navigationController.tabBarController.tabBar.hidden=NO;
    [self getdeviceWrokStatus:nil];//refresh the button status
}


- (IBAction)getdeviceWrokStatus:(id)sender{
    
    if (![Tool bleIsOpenShowToTextview:self.textView]) {
        return ;
    }
    if (![Tool deviceIsConnected:self.selectPeripheral.peripheral ShowToTextview:self.textView]) {
        return ;
    }
    [Tool outputResultWithStr:NSLocalizedString(@"getting_device_status", nil) textView:self.textView];
    [SLPBLESharedManager reston:self.selectPeripheral.peripheral getCollectionStatusWithTimeout:10.0 callback:^(SLPDataTransferStatus status, id data) {
        if (status==SLPDataTransferStatus_Succeed) {
            RestonCollectionStatus *workStatus=(RestonCollectionStatus *)data;
            if (workStatus.isCollecting) {
                self.stautLabel.text=NSLocalizedString(@"working_state_ing", nil);
                self.stopCollectBT.enabled=YES;
                self.startCollectBT.enabled=NO;
                [self isShowRealDataBT:YES];
            }
            else
            {
                self.stopCollectBT.enabled=NO;
                self.startCollectBT.enabled=YES;
                self.stautLabel.text=NSLocalizedString(@"working_state_not", nil);
            }
            [Tool outputResultWithStr:[NSString stringWithFormat:NSLocalizedString(@"get_working_status", nil),self.stautLabel.text] textView:self.textView];
        }
        else
        {
            self.stautLabel.text=NSLocalizedString(@"failure", nil);
            [Tool outputResultWithStr:NSLocalizedString(@"failure", nil) textView:self.textView];
        }
    }];
}


- (IBAction)setAutoMonitor:(id)sender {
    if (![Tool bleIsOpenShowToTextview:self.textView]) {
        return ;
    }
    if (![Tool deviceIsConnected:self.selectPeripheral.peripheral ShowToTextview:self.textView]) {
        return ;
    }
    
    [Tool outputResultWithStr:NSLocalizedString(@"set_auto_monitor", nil) textView:self.textView];
    AutoMonitorViewController *autoMonitorVC=[[AutoMonitorViewController alloc]initWithNibName:@"AutoMonitorViewController" bundle:nil];
    autoMonitorVC.selectPeripheral=self.selectPeripheral;
    self.navigationController.tabBarController.tabBar.hidden=YES;
    [self.navigationController pushViewController:autoMonitorVC animated:YES];
}

- (IBAction)startCollection:(id)sender {
    if (![Tool bleIsOpenShowToTextview:self.textView]) {
        return ;
    }
    if (![Tool deviceIsConnected:self.selectPeripheral.peripheral ShowToTextview:self.textView]) {
        return ;
    }
    
    [Tool outputResultWithStr:NSLocalizedString(@"informing_device_collecting", nil) textView:self.textView];
    [SLPBLESharedManager reston:self.selectPeripheral.peripheral startCollectionWithTimeout:10.0 callback:^(SLPDataTransferStatus status, id data) {
        if (status==SLPDataTransferStatus_Succeed) {
            [Tool outputResultWithStr:NSLocalizedString(@"began_collect_success", nil) textView:self.textView];
            self.startCollectBT.enabled=NO;
            self.stopCollectBT.enabled=YES;
        }
        else
        {
            [Tool outputResultWithStr:NSLocalizedString(@"failure", nil) textView:self.textView];
        }
        [self isShowRealDataBT:status==SLPDataTransferStatus_Succeed?YES:NO];
    }];
}


- (IBAction)stopCollect:(id)sender {
    if (![Tool bleIsOpenShowToTextview:self.textView]) {
        return ;
    }
    if (![Tool deviceIsConnected:self.selectPeripheral.peripheral ShowToTextview:self.textView]) {
        return ;
    }
    
    [Tool outputResultWithStr:NSLocalizedString(@"notified_acquisition_off", nil) textView:self.textView];
    [SLPBLESharedManager reston:self.selectPeripheral.peripheral stopCollectionWithTimeout:10.0 callback:^(SLPDataTransferStatus status, id data) {
        if (status==SLPDataTransferStatus_Succeed) {
            [Tool outputResultWithStr:NSLocalizedString(@"close_acquisition_success", nil) textView:self.textView];
            [self isShowRealDataBT:NO];
            self.sleepStatusValueLabel.text=@"--";
            self.breathValueLabel.text=@"--";
            self.heartRateValueLabel.text=@"--";
            self.startCollectBT.enabled=YES;
            self.stopCollectBT.enabled=NO;
        }
        else
        {
            [Tool outputResultWithStr:NSLocalizedString(@"failure", nil) textView:self.textView];
        }
    }];
}

- (IBAction)startRealtimeData:(id)sender {
    if (![Tool bleIsOpenShowToTextview:self.textView]) {
        return ;
    }
    if (![Tool deviceIsConnected:self.selectPeripheral.peripheral ShowToTextview:self.textView]) {
        return ;
    }
    
    [Tool outputResultWithStr:NSLocalizedString(@"getting_real_time_data", nil) textView:self.textView];
    [SLPBLESharedManager reston:self.selectPeripheral.peripheral startRealTimeDataWithTimeout:10.0 callback:^(SLPDataTransferStatus status, id data) {
        if (status==SLPDataTransferStatus_Succeed) {
            NSLog(@"%@",NSLocalizedString(@"start realtime data succeed", nil));
            [Tool outputResultWithStr:NSLocalizedString(@"notice_successful", nil) textView:self.textView];
        }
        else
        {
            self.sleepStatusValueLabel.text=@"--";
            self.breathValueLabel.text=@"--";
            self.heartRateValueLabel.text=@"--";
            NSLog(@"%@",NSLocalizedString(@"start realtime data failed", nil));
            [Tool outputResultWithStr:NSLocalizedString(@"failure", nil) textView:self.textView];
        }
    }];
}

///add realtime data
- (void)addRealTimeDataNotification
{
    [[NSNotificationCenter defaultCenter]addObserverForName:kNotificationNameBLERestonRealtimeData object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
        RestonRealTimeData *realData= [note.userInfo objectForKey:kNotificationPostData];
        NSLog(@"sleep status->%d,heartBeat-->%d,breath-->%d,awakeflag-->%d,sleepFlag-->%d",realData.status,realData.heartRate,realData.breathRate,realData.awakeFlag,realData.asleepFlag);
        NSString *b_value=[NSString stringWithFormat:@"%d %@",realData.heartRate,NSLocalizedString(@"unit_respiration", nil)];
        NSString *h_value=[NSString stringWithFormat:@"%d %@",realData.breathRate,NSLocalizedString(@"unit_heart", nil)];
        NSString *statusString;
        switch (realData.status) {
            case 0:
                statusString=NSLocalizedString(@"normal", nil);
                break;
            case 1:
                statusString=NSLocalizedString(@"initialization", nil);
                break;
            case 2:
                statusString=NSLocalizedString(@"respiration_pause", nil);
                break;
            case 3:
                statusString=NSLocalizedString(@"Heartbeat_pause", nil);
                break;
            case 4:
                statusString=NSLocalizedString(@"body_movement", nil);
                break;
            case 5:
                statusString=NSLocalizedString(@"out_bed", nil);
                b_value=@"--";
                h_value=@"--";
                break;
            case 6:
                statusString=NSLocalizedString(@"label_turn_over", nil);
                break;
            default:
                break;
        }
        self.sleepStatusValueLabel.text=statusString;
        self.breathValueLabel.text=b_value;
        self.heartRateValueLabel.text=h_value;
        [Tool outputResultWithStr:[NSString stringWithFormat:@"%@:%@",NSLocalizedString(@"sleep_state", nil),statusString] textView:self.textView];
        [Tool outputResultWithStr:[NSString stringWithFormat:@"%@:%@",NSLocalizedString(@"heartrate", nil),h_value] textView:self.textView];
        [Tool outputResultWithStr:[NSString stringWithFormat:@"%@:%@",NSLocalizedString(@"breathrate", nil),b_value] textView:self.textView];
        self.startCollectBT.enabled=NO;
        self.stopCollectBT.enabled=YES;
        [self isShowRealDataBT:YES];
    }];
}

- (IBAction)stopRealtimeData:(id)sender {
    if (![Tool bleIsOpenShowToTextview:self.textView]) {
        return ;
    }
    if (![Tool deviceIsConnected:self.selectPeripheral.peripheral ShowToTextview:self.textView]) {
        return ;
    }
    [Tool outputResultWithStr:NSLocalizedString(@"stopping_data", nil) textView:self.textView];
    [SLPBLESharedManager reston:self.selectPeripheral.peripheral stopRealTimeDataWithTimeout:10.0 callback:^(SLPDataTransferStatus status, id data) {
        if (status==SLPDataTransferStatus_Succeed) {
            self.sleepStatusValueLabel.text=@"--";
            self.breathValueLabel.text=@"--";
            self.heartRateValueLabel.text=@"--";
            
            NSLog(@"%@",NSLocalizedString(@"stop realtime data succeed", nil));
            [Tool outputResultWithStr:NSLocalizedString(@"stop_data_successfully", nil) textView:self.textView];
        }
        else
        {
            NSLog(@"%@",NSLocalizedString(@"stop realtime data failed", nil));
            [Tool outputResultWithStr:NSLocalizedString(@"failure", nil) textView:self.textView];
        }
    }];
}

- (IBAction)checkSingal:(id)sender {
    if (![Tool bleIsOpenShowToTextview:self.textView]) {
        return ;
    }
    if (![Tool deviceIsConnected:self.selectPeripheral.peripheral ShowToTextview:self.textView]) {
        return ;
    }
    
    [Tool outputResultWithStr:NSLocalizedString(@"getting_signal_strength", nil) textView:self.textView];
    SignalViewController *signalVC=[[SignalViewController alloc]init];
    signalVC.selectPeripheral=self.selectPeripheral;
    [self.navigationController pushViewController:signalVC animated:YES];
}

- (void)disconnectedDevice
{
    [SLPBLESharedManager disconnectPeripheral:self.selectPeripheral.peripheral timeout:10.0 completion:^(SLPBLEDisconnectReturnCodes code, NSInteger disconnectHandleID) {
        if (code==SLPBLEDisconnectReturnCode_Succeed) {
            NSLog(@"device has disconncted");
            [Tool outputResultWithStr:NSLocalizedString(@"disconnected", nil) textView:self.textView];
            [self.tabBarController.navigationController popToRootViewControllerAnimated:YES];
        }
    }];
}


- (void)isShowRealDataBT:(BOOL)flag
{
    self.startRealtimeDataBT.enabled=flag;
    self.stopRealtimeDataBT.enabled=flag;
    self.checkSignalBT.enabled=flag;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
