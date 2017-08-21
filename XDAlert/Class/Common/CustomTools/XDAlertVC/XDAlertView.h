
//  Created by Celia on 2017/8/10.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XDAlertButton.h"
#import "XDAlertViewController.h"

@interface XDAlertView : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *messageLabel;

@property (nonatomic, strong) XDAlertButton *buttonOne;
@property (nonatomic, strong) XDAlertButton *buttonTwo;



/** 全局的一些配置 */
+ (void)setDefaultConfig:(XDAlertConfiguration *)config;


/** 一个按钮 */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message btnText:(NSString *)btnText handler:(void (^)(UIButton *btn))handler;

/** 两个按钮 */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message leftButtonText:(NSString *)leftText rightButtonText:(NSString *)rightText leftHandler:(void (^)(UIButton *leftBtn))leftHandler rightHandler:(void (^)(UIButton *leftBtn))rightHandler;


/** sheet类型 可以多个按钮 */
- (instancetype)initSheetWithTitle:(NSString *)title message:(NSString *)message texts:(NSArray<NSString *> *)btnTexts handler:(void (^)(NSInteger index))handler;

@end
