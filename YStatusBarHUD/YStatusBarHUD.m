//
//  YStatusBarHUD.m
//  window
//
//  Created by wyw on 16/6/12.
//  Copyright © 2016年 qw. All rights reserved.
//

#import "YStatusBarHUD.h"

#define YTitleFont [UIFont systemFontOfSize:12]

@implementation YStatusBarHUD

/** 窗口 */
static UIWindow *window_;

/** 定时器 */
static NSTimer *timer_;

/** 消息显示显示时间 */
static CGFloat const YMessageShowTime = 2.0;
/** 动画时间 */
static CGFloat const YAnimotionDuration = 0.25;

/**
 *  创建window
 */
+ (void)setupWindow
{
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, 20);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.frame = frame;
    window_.windowLevel = UIWindowLevelAlert;
    window_.backgroundColor = [UIColor greenColor];
    window_.hidden = NO;

    frame.origin.y = 0;
    // 窗口动画
    [UIView animateWithDuration:YAnimotionDuration animations:^{
        window_.frame = frame;
    }];
}

/**
 *  显示消息图片
 *
 *  @param msg 消息
 */
+ (void)showMessage:(NSString *)msg Image:(UIImage *)image
{
    // 停止上一次定时器
    [timer_ invalidate];
    timer_ = nil; // 销毁定时器
    
    [self setupWindow];
    // 创建一个按钮
    UIButton *Btu = [UIButton buttonWithType:UIButtonTypeCustom];
    [Btu setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    Btu.titleLabel.font = YTitleFont;
    [Btu setTitle:msg forState:UIControlStateNormal];
    Btu.frame = window_.bounds;
    if (image) {
        [Btu setImage:image forState:UIControlStateNormal];
        Btu.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    }
    
    [window_ addSubview:Btu];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:YMessageShowTime target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**
 *  显示成功
 *
 *  @param msg 消息
 */
+ (void)showSucess:(NSString *)msg
{
    [self showMessage:msg Image:[UIImage imageNamed:@"YStatusBarHUD.bundle/check"]];
}

/**
 *  显示失败
 *
 *  @param msg 消息
 */
+ (void)showError:(NSString *)msg
{
   [self showMessage:msg Image:[UIImage imageNamed:@"YStatusBarHUD.bundle/error"]];
}

/**
 *  显示消息
 *
 *  @param msg 消息
 */
+ (void)showMessage:(NSString *)msg
{
    [self showMessage:msg Image:nil];
}

/**
 *  显示加载
 *
 *  @param msg 消息
 */
+ (void)showLoading:(NSString *)msg
{
    [self setupWindow];
    
    // 创建一个标签
    UILabel *Lable = [[UILabel alloc] init];
    Lable.frame = window_.bounds;
    Lable.font = YTitleFont;
    Lable.text = @"正在加载";
    Lable.textColor = [UIColor whiteColor];
    Lable.textAlignment = NSTextAlignmentCenter;
    Lable.backgroundColor = [UIColor blueColor];
    [window_ addSubview:Lable];
    
    // 创建指示器
    UIActivityIndicatorView *act = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : YTitleFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    act.center = CGPointMake(centerX, centerY);
    [act startAnimating];
    [window_ addSubview:act];
}

/**
 *  隐藏
 */
+ (void)hide
{
    [UIView animateWithDuration:YAnimotionDuration animations:^{
        
        CGRect frame = window_.frame;
        frame.origin.y = - window_.frame.size.height;
        window_.frame = frame;
        
    } completion:^(BOOL finished) {
        
        window_ = nil;
        timer_ = nil;
    }];
    
}


@end
