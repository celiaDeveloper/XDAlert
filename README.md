# XDAlert

自定制alert提示框

*******************
##设置提示框默认的样式##
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
*******************


##alert样式
![Image text](https://github.com/celiaDeveloper/XDAlert/blob/master/Screenshots/image1.png)

![Image text](https://github.com/celiaDeveloper/XDAlert/blob/master/Screenshots/image2.png)

##sheet样式
![Image text](https://github.com/celiaDeveloper/XDAlert/blob/master/Screenshots/image3.png)

![Image text](https://github.com/celiaDeveloper/XDAlert/blob/master/Screenshots/image4.png)
