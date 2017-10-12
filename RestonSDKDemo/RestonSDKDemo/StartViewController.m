//
//  StartViewController.m
//  RestonSDKDemo
//
//  Created by San on 2017/8/2.
//  Copyright © 2017年 medica. All rights reserved.
//

#import "StartViewController.h"
#import "ScanDeviceViewController.h"
#import "Tool.h"
#import "DeviceViewController.h"
#import "ControlViewController.h"
#import "DataViewController.h"
#import "AppDelegate.h"

@interface StartViewController ()
{
    UIView *_tabbarView;
    UITabBarController *tabbarVC;
}
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *skipButton;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet  UIImageView *imageview;

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib
    [self setUI];
}

- (void)setUI
{
    [self.searchButton setTitle:NSLocalizedString(@"search_device", nil) forState:UIControlStateNormal];
    [self.skipButton setTitle:NSLocalizedString(@"ignore", nil) forState:UIControlStateNormal];
    [Tool configSomeKindOfButtonLikeNomal:self.searchButton];
    [Tool configSomeKindOfButtonLikeNomal:self.skipButton];
    self.label1.text=NSLocalizedString(@"index_guide1", nil);
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    self.label3.text=[NSString stringWithFormat:NSLocalizedString(@"cur_app_version", nil), version];
    self.imageview.image=[UIImage imageNamed:@"sdk_index_icon_reston.png"];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden=YES;    
    [Tool writeStringToDocument:@""];
}

- (IBAction)pressScanDevice:(id)sender
{
    ScanDeviceViewController *scanVC=[[ScanDeviceViewController alloc]initWithNibName:@"ScanDeviceViewController" bundle:nil];
    self.navigationController.navigationBar.hidden=NO;
    [self.navigationController pushViewController:scanVC animated:YES];
}


- (IBAction)pressSkip:(id)sender
{
    DeviceViewController *deviceVC=[[DeviceViewController alloc]initWithNibName:@"DeviceViewController" bundle:nil];
    deviceVC.title=NSLocalizedString(@"device", nil);
    deviceVC.tabBarItem.image = [UIImage imageNamed:@"home.png"];
    ControlViewController *controlVC=[[ControlViewController alloc]initWithNibName:@"ControlViewController" bundle:nil];
    controlVC.title=NSLocalizedString(@"control", nil);
    controlVC.tabBarItem.image = [UIImage imageNamed:@"control.png"];
    DataViewController *dataVC=[[DataViewController alloc]initWithNibName:@"DataViewController" bundle:nil];
    dataVC.title=NSLocalizedString(@"report", nil);
    dataVC.tabBarItem.image = [UIImage imageNamed:@"data.png"];
    
    UINavigationController *un1=[[UINavigationController alloc]initWithRootViewController:deviceVC];
    UINavigationController *un2=[[UINavigationController alloc]initWithRootViewController:controlVC];
    UINavigationController *un3=[[UINavigationController alloc]initWithRootViewController:dataVC];
    
    tabbarVC=[[UITabBarController alloc]init];
    tabbarVC.viewControllers=[NSArray arrayWithObjects:un1,un2,un3,nil];
    self.navigationController.navigationBar.hidden=YES;
    [self.navigationController pushViewController:tabbarVC animated:YES];
    
//    [self _initTabbarView];
}


/*
 自定义tabbar
 */
-(void)_initTabbarView
{
    [tabbarVC.tabBar setHidden:YES];
    _tabbarView=[[UIView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height-49, self.view.frame.size.width, 49)];
    [self.view addSubview:_tabbarView];
    for (int i=0; i<3; i++) {
        float itemWidth = self.view.frame.size.width/3;
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake((itemWidth-30)/2+(i*itemWidth), (49-30)/2, 30, 30)];
        button.tag = i+10;
        if (button.tag==10) {
            button.selected=YES ;
        }
        button.backgroundColor=[UIColor redColor];
        [button addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        [_tabbarView addSubview:button];
    }
}

- (void)selectedTab:(UIButton *)button {
    //     button.selected=!button.selected;
    
    for (int i=10; i<15; i++) {
        UIButton *BT=(UIButton*)[self.view viewWithTag:i];
        if (button.tag==i) {
            [BT setSelected:YES];
        }
        else
            [BT setSelected:NO];
    }
}

- (void)button:(UIButton*)button setImage:(NSString *)imageName
      selected:(NSString *)selectImageName
{
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal ];
    //    [button setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    //    [button setBackgroundImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
