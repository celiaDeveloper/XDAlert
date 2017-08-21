
//
//  Created by Celia on 2017/8/9.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height



@interface XDAlertConfiguration : NSObject <NSCopying>

@property (nonatomic, assign) UIColor *buttonBackgroundColor;
@property (nonatomic, assign) UIColor *buttonTextColor;
@property (nonatomic, assign) UIColor *titleColor;
@property (nonatomic, assign) UIColor *messageColor;
@property (nonatomic, assign) UIColor *viewBackgroundColor;
@property (nonatomic) CGFloat cornerRadius;
@property (nonatomic) CGFloat buttonCornerRadius;
@property (nonatomic) CGFloat titleFont;
@property (nonatomic) CGFloat messageFont;

@end



@interface XDAlertViewController : UIViewController

/**
 设置alert 默认的一些配置    一旦设置成功，APP内都将是统一的风格
 */
+ (void)setDefaultConfiguration:(XDAlertConfiguration *)config;
+ (XDAlertConfiguration *)defaultConfiguration;

/** 一个按钮 */
+ (instancetype)initAlertWithTitle:(NSString *)title message:(NSString *)message buttonText:(NSString *)text handler:(void (^)(UIButton *Btn))handler;

/** 两个按钮 */
+ (instancetype)initAlertWithTitle:(NSString *)title message:(NSString *)message leftText:(NSString *)leftText rightText:(NSString *)rigthText leftHandler:(void (^)(UIButton *leftBtn))leftHandler rightHandler:(void (^)(UIButton *rightBtn))rightHandler;


/**
 sheet类型 提示框

 @param title 标题
 @param message 信息
 @param texts 按钮标题数组
 @param handler 回调
 */
+ (instancetype)initAlertSheetWithTitle:(NSString *)title message:(NSString *)message texts:(NSArray<NSString *> *)texts handler:(void (^)(NSInteger index))handler;

@end
