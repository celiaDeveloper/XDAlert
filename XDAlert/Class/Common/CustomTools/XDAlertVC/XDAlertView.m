
//  Created by Celia on 2017/8/10.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "XDAlertView.h"


CGFloat titleDefaultFont = 18.0;
CGFloat messageDefaultFont = 15.0;
CGFloat viewDefaultCorner = 0;

UIColor *titleColor;
UIColor *messageColor;
UIColor *viewBackColor;

@interface XDAlertView ()

@end

@implementation XDAlertView

+ (void)setDefaultConfig:(XDAlertConfiguration *)config {
    
    if (config.cornerRadius) {
        viewDefaultCorner = config.cornerRadius;
    }
    if (config.titleFont) {
        titleDefaultFont = config.titleFont;
    }
    if (config.messageFont) {
        messageDefaultFont = config.messageFont;
    }
    if (config.titleColor) {
        titleColor = config.titleColor;
    }
    if (config.messageColor) {
        messageColor = config.messageColor;
    }
    if (config.viewBackgroundColor) {
        viewBackColor = config.viewBackgroundColor;
    }
    [XDAlertButton setBtnDefaultConfig:config];
}


- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message btnText:(NSString *)btnText handler:(void (^)(UIButton *btn))handler {
    
    [self checkDefaultSet];
    self = [[XDAlertView alloc] init];
    self.backgroundColor = viewBackColor;
    
    [self frameLayoutWithTitle:title message:message sheet:false buttonCount:0];
    
    
    self.buttonOne = [[XDAlertButton alloc] initWithFrame:CGRectMake(20, self.frame.size.height - 30 - 50, self.frame.size.width - 40, 50) title:btnText actionHandler:handler];
    [self addSubview:self.buttonOne];
    
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message leftButtonText:(NSString *)leftText rightButtonText:(NSString *)rightText leftHandler:(void (^)(UIButton *leftBtn))leftHandler rightHandler:(void (^)(UIButton *leftBtn))rightHandler {
    
    [self checkDefaultSet];
    self = [[XDAlertView alloc] init];
    self.backgroundColor = viewBackColor;
    
    [self frameLayoutWithTitle:title message:message sheet:false buttonCount:0];
    
    
    self.buttonOne = [[XDAlertButton alloc] initWithFrame:CGRectMake(20, self.frame.size.height - 30 - 50, (self.frame.size.width - 20 * 3)/2, 50) title:leftText actionHandler:leftHandler];
    [self addSubview:self.buttonOne];
    
    self.buttonTwo = [[XDAlertButton alloc] initWithFrame:CGRectMake(self.buttonOne.frame.size.width + 20*2 , self.buttonOne.frame.origin.y, self.buttonOne.frame.size.width, self.buttonOne.frame.size.height) title:rightText actionHandler:rightHandler];
    [self addSubview:self.buttonTwo];
    
    
    return self;
}

- (instancetype)initSheetWithTitle:(NSString *)title message:(NSString *)message texts:(NSArray<NSString *> *)btnTexts handler:(void (^)(NSInteger index))handler {
    
    [self checkDefaultSet];
    self = [[XDAlertView alloc] init];
    self.backgroundColor = viewBackColor;
    
    [self frameLayoutWithTitle:title message:message sheet:YES buttonCount:btnTexts.count];
    
    
    CGFloat alertBtnTop = self.messageLabel.frame.size.height + self.messageLabel.frame.origin.y + 30;
    for (NSInteger index = 0; index < btnTexts.count; index++) {
        
        XDAlertButton *tempBtn = [[XDAlertButton alloc] initWithFrame:CGRectMake(10, alertBtnTop + 55*index, self.frame.size.width - 20, 50) title:btnTexts[index] actionHandler:^(UIButton *btn) {
            !handler ?  : handler(index);
        }];
        
        [self addSubview:tempBtn];
    }
    
    
    
    return self;
}



- (void)checkDefaultSet {
    
    if (!titleColor) {
        titleColor = [UIColor blackColor];
    }
    if (!messageColor) {
        messageColor = [UIColor darkGrayColor];
    }
    if (!viewBackColor) {
        viewBackColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0];
    }
}


// 布局约束
- (void)frameLayoutWithTitle:(NSString *)title message:(NSString *)message sheet:(BOOL)isSheet buttonCount:(NSInteger)count {
    
    CGSize titleSize = [self getTextSize:CGSizeMake(SCREEN_WIDTH - 60, MAXFLOAT) text:title font:titleDefaultFont bold:YES];
    self.titleLabel.frame = CGRectMake(0, 10, SCREEN_WIDTH - 60, titleSize.height < 50 ? 50 : titleSize.height);
    self.titleLabel.font = [UIFont boldSystemFontOfSize:titleDefaultFont];
    self.titleLabel.text = title;
    
    
    if (!message || [message isEqualToString:@""]) {
        self.messageLabel.frame = CGRectMake(0, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height, 0, 0);
    }else {
        CGSize messageSize = [self getTextSize:CGSizeMake(SCREEN_WIDTH - 60, MAXFLOAT) text:message font:messageDefaultFont bold:NO];
        self.messageLabel.frame = CGRectMake(0, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height, messageSize.width == 0 ? 0 : SCREEN_WIDTH - 60 , messageSize.height < 50 ? 50 : messageSize.height);
        self.messageLabel.font = [UIFont systemFontOfSize:messageDefaultFont];
        self.messageLabel.text = message;
    }
    
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.messageLabel];
    
    
    CGFloat buttonsHeight = isSheet ? 55*count + 5 : 50 + 30;
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH - 60, 10 + _titleLabel.frame.size.height + _messageLabel.frame.size.height + 30 + buttonsHeight);
    
    CGFloat centerY = isSheet ? SCREEN_HEIGHT - 10 - self.frame.size.height /2 : SCREEN_HEIGHT / 2;
    self.center = CGPointMake(SCREEN_WIDTH / 2, centerY);
    
    if (viewDefaultCorner) {
        self.layer.cornerRadius = viewDefaultCorner;
        self.layer.masksToBounds = YES;
    }
}


- (UILabel *)createLabel {
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    return label;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [self createLabel];
        _titleLabel.textColor = titleColor;
    }
    return _titleLabel;
}

- (UILabel *)messageLabel {
    
    if (!_messageLabel) {
        _messageLabel = [self createLabel];
        _messageLabel.textColor = messageColor;
    }
    return _messageLabel;
}

- (CGSize)getTextSize:(CGSize)size text:(NSString *)text font:(CGFloat)font bold:(BOOL)bold  {
    
    NSDictionary *attributes = @{NSFontAttributeName: bold ? [UIFont boldSystemFontOfSize:font] : [UIFont systemFontOfSize:font]};
    
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return rect.size;
}



@end
