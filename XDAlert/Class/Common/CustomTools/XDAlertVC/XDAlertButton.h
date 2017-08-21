
//  Created by Celia on 2017/8/10.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XDAlertViewController.h"

@interface XDAlertButton : UIButton

+ (void)setBtnDefaultConfig:(XDAlertConfiguration *)config;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title actionHandler:(void (^)(UIButton *btn))actionHandler;

@end
