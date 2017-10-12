//
//  SignalViewController.m
//  RestonSDKDemo
//
//  Created by San on 2017/7/26.
//  Copyright © 2017年 medica. All rights reserved.
//

#import "SignalViewController.h"
#import "Tool.h"
#import "HeartCurveView.h"
#define speed_x (0.4)//波形的宽度

@interface SignalViewController ()
{
    
    NSMutableArray *heartDataSource;
    NSTimer *_heartTimer;
    
    
    NSTimer *_breathTimer;
    
    
    NSMutableArray *breathDataSource;
    
    HeartCurveView *hcv;
    HeartCurveView *bcv;
}

@property (weak, nonatomic) IBOutlet UIView *heartView;
@property (weak, nonatomic) IBOutlet UIView *breathView;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@end

@implementation SignalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUI];
    
    [self addNotification];
    
    [self startSigal];
}


- (void)setUI
{
    self.title=NSLocalizedString(@"signal_strength", nil);
    self.label1.text=NSLocalizedString(@"heart_signal_strength", nil);
    self.label2.text=NSLocalizedString(@"respiration_signal_strength", nil);
    self.label1.textColor=[FontColor C3];
    self.label1.font=[FontColor T3];
    self.label2.textColor=[FontColor C3];
    self.label2.font=[FontColor T3];
    

    hcv = [[HeartCurveView alloc] init];
    hcv.backgroundColor = [UIColor clearColor];
    hcv.layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);//曲线移动方向，从右向左移动
//    hcv.layer.borderWidth=1.0f;
//    hcv.layer.borderColor=[UIColor grayColor].CGColor;
//    hcv.layer.cornerRadius=3.0f;
    [self.heartView addSubview:hcv];
    
    
    bcv = [[HeartCurveView alloc] init];
    bcv.backgroundColor=[UIColor clearColor];
    bcv.layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);//曲线移动方向，从右向左移动
//    bcv.layer.borderWidth=1.0f;
//    bcv.layer.borderColor=[UIColor grayColor].CGColor;
//    bcv.layer.cornerRadius=3.0f;
    [self.breathView addSubview:bcv];
    [self addConstraint];
    [self initDataSource];
}


- (void)addConstraint
{
    hcv.translatesAutoresizingMaskIntoConstraints=NO;
    [self.heartView addConstraint:[NSLayoutConstraint  constraintWithItem:hcv attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.heartView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0]];
    [self.heartView addConstraint:[NSLayoutConstraint  constraintWithItem:hcv attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.heartView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0]];
    [self.heartView addConstraint:[NSLayoutConstraint  constraintWithItem:hcv attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.heartView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [self.heartView addConstraint:[NSLayoutConstraint  constraintWithItem:hcv attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.heartView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    [hcv layoutIfNeeded];
    
    bcv.translatesAutoresizingMaskIntoConstraints=NO;
    [self.breathView addConstraint:[NSLayoutConstraint  constraintWithItem:bcv attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.breathView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0]];
    [self.breathView addConstraint:[NSLayoutConstraint  constraintWithItem:bcv attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.breathView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0]];
    [self.breathView addConstraint:[NSLayoutConstraint  constraintWithItem:bcv attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.breathView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [self.breathView addConstraint:[NSLayoutConstraint  constraintWithItem:bcv attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.breathView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    [hcv layoutIfNeeded];
}

- (void)addNotification
{
    [[NSNotificationCenter defaultCenter]addObserverForName:kNotificationNameBLERestonOriginalData object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        RestonOriginalData *originaData= [note.userInfo objectForKey:kNotificationPostData];
        NSLog(@"b->%@,h->%@",originaData.breathRateArray,originaData.heartRateArray);
        [heartDataSource addObjectsFromArray:originaData.heartRateArray];
        [breathDataSource addObjectsFromArray:originaData.breathRateArray];
    }];
}

-(void)startSigal
{
    [SLPBLESharedManager reston:self.selectPeripheral.peripheral startOriginalDataWithTimeout:10.0 callback:^(SLPDataTransferStatus status, id data) {
        if (status==SLPDataTransferStatus_Succeed) {
            NSLog(@"开始原始实时数据成功。");
        }
        else
        {
            NSLog(@"开始原始实时数据失败");
        }
    }];
}


-(void)initDataSource
{
    //初始心跳数据！
    heartDataSource= [NSMutableArray arrayWithCapacity:40];
    
    breathDataSource= [NSMutableArray array];
    
    [self createWorkDataSourceWithTimeInterval:0.1];
    
    [self createBreathTimerInterval:0.1];//呼吸
    
}

///移动曲线定时器
- (void)createWorkDataSourceWithTimeInterval:(NSTimeInterval )timeInterval
{
    if (_heartTimer==nil) {
        _heartTimer=[NSTimer timerWithTimeInterval:timeInterval target:self selector:@selector(timerTranslationFun) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:_heartTimer forMode:NSRunLoopCommonModes];
    }
}


-(void)createBreathTimerInterval:(NSTimeInterval)timerInterval
{
    if (_breathTimer==nil) {
        _breathTimer=[NSTimer timerWithTimeInterval:timerInterval target:self selector:@selector(breathRateTimerAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:_breathTimer forMode:NSRunLoopCommonModes];
    }
}

//平移方式绘制,
- (void)timerTranslationFun
{
    if (heartDataSource.count)
    {
        CGFloat v = [heartDataSource[0] floatValue] ;
        [self rawCurveWithValue:v view:hcv];
        [hcv setNeedsDisplay];
        [heartDataSource removeObjectAtIndex:0];
    }
    
    //    NSLog(@"self.heartRateArray.count = %d",self.heartRateArray.count);
    
    if (heartDataSource.count > 40 )
    {
        for (int i = 0; i < 10; i++)
        {
            if (i%2 == 0)
            {
                float v = [heartDataSource[0] floatValue] ;
                [self rawCurveWithValue:v view:hcv];
                [hcv setNeedsDisplay];
            }
            [heartDataSource removeObjectAtIndex:0];
        }
    }
}

-(void)breathRateTimerAction
{
    if (breathDataSource.count)
    {
        CGFloat v = [breathDataSource[0] floatValue] ;
        [self rawCurveWithValue:v view:bcv];
        [bcv setNeedsDisplay];
        [breathDataSource removeObjectAtIndex:0];
    }
    
    //    NSLog(@"self.breathRateArray.count = %d",(int)self.breathRateArray.count);
    if (breathDataSource.count > 40)
    {
        for (int i = 0; i < 10; i++)
        {
            if (i%2 == 0)
            {
                float v = [breathDataSource[0] floatValue] ;
                [self rawCurveWithValue:v view:bcv];
                [bcv setNeedsDisplay];
            }
            [breathDataSource removeObjectAtIndex:0];
        }
    }
}

-(void)rawCurveWithValue:(CGFloat)value view:(HeartCurveView *)view
{
    CGPoint p = CGPointMake(0, view.frame.size.height * (value + 1) / 2);
    
    if (view.x_count >= self.view.frame.size.width)
    {
        view.isFullScreen = YES;
        view.x_count = 0;
        
        if (view.firstHeartPoints.count)
        {
            view.secondHeartPoints = [NSMutableArray arrayWithArray:view.firstHeartPoints];
            view.isFirstCopy = YES;
            [view.firstHeartPoints removeAllObjects];
        }
        
        if (view.secondHeartPoints.count)
        {
            for (int i = 0; i < 15; i++)
            {
                [view.secondHeartPoints removeObjectAtIndex:0];
            }
        }
    }
    else
    {
        view.x_count += speed_x;
        
        if (view.isFullScreen)
        {
            [view.firstHeartPoints addObject:[NSValue valueWithCGPoint:p]];
            [self allPointsAddEx:view.firstHeartPoints addon:speed_x];
            
            if (view.secondHeartPoints.count)
            {
                [view.secondHeartPoints removeObjectAtIndex:0];
            }
        }
        else
        {
            [view.secondHeartPoints addObject:[NSValue valueWithCGPoint:p]];
            [self allPointsAddEx:view.secondHeartPoints addon:speed_x];
        }
    }
}

-(void)allPointsAddEx:(NSMutableArray *)points addon:(CGFloat)addon
{
    for (int i = 0; i < points.count; i++)
    {
        CGPoint p = [(NSValue *)points[i] CGPointValue];
        p.x = addon * i;
        [points replaceObjectAtIndex:i withObject:[NSValue valueWithCGPoint:p]];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
