
//  Created by Celia on 2017/8/9.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "XDAlertViewController.h"
#import "XDAlertView.h"


XDAlertConfiguration *alertDefaultConfiguration;


@implementation XDAlertConfiguration

- (id)copyWithZone:(NSZone *)zone {
    
    XDAlertConfiguration *config = [[[self class] alloc] init];
    config.buttonBackgroundColor = self.buttonBackgroundColor;
    config.buttonTextColor = self.buttonTextColor;
    config.titleFont = self.titleFont;
    config.cornerRadius = self.cornerRadius;
    return config;
}

@end


@interface XDAlertViewController ()


@end

@implementation XDAlertViewController

+ (void)setDefaultConfiguration:(XDAlertConfiguration *)config {
    
    //只允许设置一次，有值的时候返回
    if (alertDefaultConfiguration) {
        return;
    }
    
    alertDefaultConfiguration = config;
    [XDAlertView setDefaultConfig:alertDefaultConfiguration];
}

+ (XDAlertConfiguration *)defaultConfiguration {
    
    NSAssert(alertDefaultConfiguration, @"未设置 defaultConfiguration，应先调用 +[HPAlertViewController setDefaultConfiguration:] 来进行初始化");
    return alertDefaultConfiguration;
}



+ (XDAlertViewController *)createDefaultAlertVC {
    
    XDAlertViewController *alertVC = [[XDAlertViewController alloc] init];
    alertVC.view.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.4];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        alertVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }else {
        alertVC.modalPresentationStyle = UIModalPresentationCurrentContext;
    }
    return alertVC;
}


+ (instancetype)initAlertWithTitle:(NSString *)title message:(NSString *)message buttonText:(NSString *)text handler:(void (^)(UIButton *Btn))handler {
    
    XDAlertViewController *alertVC = [self createDefaultAlertVC];
    
    XDAlertView *alertView = [[XDAlertView alloc] initWithTitle:title message:message btnText:text handler:handler];
    [alertVC.view addSubview:alertView];
    
    return alertVC;
}


+ (instancetype)initAlertWithTitle:(NSString *)title message:(NSString *)message leftText:(NSString *)leftText rightText:(NSString *)rigthText leftHandler:(void (^)(UIButton *leftBtn))leftHandler rightHandler:(void (^)(UIButton *rightBtn))rightHandler {
    
    XDAlertViewController *alertVC = [self createDefaultAlertVC];
    
    XDAlertView *alertView = [[XDAlertView alloc] initWithTitle:title message:message leftButtonText:leftText rightButtonText:rigthText leftHandler:leftHandler rightHandler:rightHandler];
    [alertVC.view addSubview:alertView];
    
    return alertVC;
}


+ (instancetype)initAlertSheetWithTitle:(NSString *)title message:(NSString *)message texts:(NSArray<NSString *> *)texts handler:(void (^)(NSInteger index))handler {
    
    XDAlertViewController *alertVC = [self createDefaultAlertVC];
    
    XDAlertView *alertView = [[XDAlertView alloc] initSheetWithTitle:title message:message texts:texts handler:handler];
    [alertVC.view addSubview:alertView];
    
    return alertVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
