//
//  ViewController.m
//  YStatusBarHUDExample
//
//  Created by wyw on 16/6/13.
//  Copyright © 2016年 qw. All rights reserved.
//

#import "ViewController.h"
#import "YStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sucessAction:(id)sender {
    [YStatusBarHUD showSucess:@"加载成功"];
}

- (IBAction)errorAction:(id)sender {
    [YStatusBarHUD showError:@"加载失败"];
}

- (IBAction)showMessageAction:(id)sender {
    [YStatusBarHUD showMessage:@"加载消息"];
}

- (IBAction)showLoadingAction:(id)sender {
    [YStatusBarHUD showLoading:@"正在加载"];
}

- (IBAction)hideAction:(id)sender {
    [YStatusBarHUD hide];
}


@end
