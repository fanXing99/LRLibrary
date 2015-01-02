//
//  ViewController.m
//  LRLibrary
//
//  Created by 李锐 on 15/1/2.
//  Copyright (c) 2015年 李锐. All rights reserved.
//

#import "ViewController.h"
#import "LRTime.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSString * time=[LRTime dateWithTimestamp:@"1404114037341643" AndForm:@"yyyy-MM-dd,HH:mm:ss"];
    NSString *time1=[LRTime dateNowWithForm:@"yyyy-MM-dd-HH-mm-ss"];
    UIAlertView *view=[[UIAlertView alloc]initWithTitle:@"测试" message:time1 delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
    [view show];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
