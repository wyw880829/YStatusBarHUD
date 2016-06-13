//
//  YStatusBarHUD.h
//  window
//
//  Created by wyw on 16/6/12.
//  Copyright © 2016年 qw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YStatusBarHUD : NSObject

/**
 *  显示消息图片
 *
 *  @param msg 消息
 */
+ (void)showMessage:(NSString *)msg Image:(UIImage *)image;

/**
 *  显示成功
 *
 *  @param msg 消息
 */
+ (void)showSucess:(NSString *)msg;

/**
 *  显示失败
 *
 *  @param msg 消息
 */
+ (void)showError:(NSString *)msg;

/**
 *  显示消息
 *
 *  @param msg 消息
 */
+ (void)showMessage:(NSString *)msg;

/**
 *  显示加载
 *
 *  @param msg 消息
 */
+ (void)showLoading:(NSString *)msg;

/**
 *  隐藏
 */
+ (void)hide;

@end
