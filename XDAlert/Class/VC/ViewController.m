//
//  ViewController.m
//  XDAlert
//
//  Created by Celia on 2017/8/21.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "ViewController.h"
#import "XDAlertViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    XDAlertConfiguration *config = [[XDAlertConfiguration alloc] init];
    config.buttonBackgroundColor = [UIColor orangeColor];
    config.buttonTextColor = [UIColor whiteColor];
    config.cornerRadius = 10.0;
    config.titleFont = 20.0;
    config.messageFont = 17.0;
    config.messageColor = [UIColor orangeColor];
    config.buttonCornerRadius = 5.0;
    config.viewBackgroundColor = [UIColor whiteColor];
    
    [XDAlertViewController setDefaultConfiguration:config];
    
    
    
    UIButton *btn0 = [self createBtnTag:0 title:@"alert  &  one button"];
    [btn0 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn1 = [self createBtnTag:1 title:@"alert  &  two button"];
    [btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [self createBtnTag:2 title:@"sheet  &  two button"];
    [btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn3 = [self createBtnTag:3 title:@"sheet  &  three button"];
    [btn3 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:btn0];
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
}

- (UIButton *)createBtnTag:(NSInteger)tag title:(NSString *)title {
    
    UIButton *tempBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100 + 60*tag, mScreenWidth - 40, 50)];
    tempBtn.tag = tag;
    tempBtn.backgroundColor = [UIColor redColor];
    [tempBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tempBtn setTitle:title forState:UIControlStateNormal];
    
    return tempBtn;
}


- (void)btnAction:(UIButton *)btn {
    
    switch (btn.tag) {
        case 0:
        {
            XDAlertViewController *alert = [XDAlertViewController initAlertWithTitle:@"中午吃啥" message:@"想吃啥都可以" buttonText:@"好吧" handler:^(UIButton *Btn) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
        case 1:
        {
            XDAlertViewController *alert = [XDAlertViewController initAlertWithTitle:@"您还未登录" message:nil leftText:@"去登录" rightText:@"取消" leftHandler:^(UIButton *leftBtn) {
                
                NSLog(@"去登录");
            } rightHandler:^(UIButton *rightBtn) {
                
                [self dismissViewControllerAnimated:YES completion:nil];
            }];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
        case 2:
        {
            XDAlertViewController *alert = [XDAlertViewController initAlertSheetWithTitle:@"确定要退出登录吗" message:@"" texts:@[@"取消",@"确定"] handler:^(NSInteger index) {
                
                if (index == 0) {
                    [self dismissViewControllerAnimated:YES completion:nil];
                }else {
                    NSLog(@"确定退出了");
                }
                
            }];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
        case 3:
        {
            XDAlertViewController *alert = [XDAlertViewController initAlertSheetWithTitle:@"请选择交通工具" message:@"店长推荐高铁哦" texts:@[@"暂不选择",@"高铁",@"汽车"] handler:^(NSInteger index) {
                
                if (index == 0) {
                    [self dismissViewControllerAnimated:YES completion:nil];
                }else if (index == 1) {
                    NSLog(@"高铁");
                }else {
                    NSLog(@"汽车");
                }
                
            }];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
