
//  Created by Celia on 2017/8/10.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "XDAlertButton.h"

UIColor *buttonDefaultBackColor;
UIColor *buttonDefaultTextColor;

CGFloat buttonDefaultCorner = 0;

@interface XDAlertButton ()
@property (nonatomic, copy) void (^actionBlock)(UIButton *btn);
@end

@implementation XDAlertButton

+ (void)setBtnDefaultConfig:(XDAlertConfiguration *)config {
    
    if (config) {
        if (config.buttonBackgroundColor) {
            buttonDefaultBackColor = config.buttonBackgroundColor;
        }
        if (config.buttonTextColor) {
            buttonDefaultTextColor = config.buttonTextColor;
        }
        if (config.buttonCornerRadius) {
            buttonDefaultCorner = config.buttonCornerRadius;
        }
    }
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title actionHandler:(void (^)(UIButton *btn))actionHandler {
    
    self = [super initWithFrame:frame];
    if (!buttonDefaultBackColor) {
        buttonDefaultBackColor = [UIColor colorWithRed:86/255.0 green:142/255.0 blue:247/255.0 alpha:1.0];
    }
    if (!buttonDefaultTextColor) {
        buttonDefaultTextColor = [UIColor whiteColor];
    }
    
    [self setTitle:title forState:UIControlStateNormal];
    [self setBackgroundColor:buttonDefaultBackColor];
    [self setTitleColor:buttonDefaultTextColor forState:UIControlStateNormal];
    
    if (buttonDefaultCorner) {
        self.layer.cornerRadius = buttonDefaultCorner;
        self.layer.masksToBounds = YES;
    }
    
    self.actionBlock = actionHandler;
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return self;
}

- (void)buttonAction:(UIButton *)btn {
    
    if (self.actionBlock) {
        self.actionBlock(btn);
    }
}

@end
