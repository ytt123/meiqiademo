//
//  AppDelegate.m
//  meiqia
//
//  Created by yangtaotao on 2021/5/15.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <MeiQiaSDK/MQManager.h>
#import "MQServiceToViewInterface.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
    
#pragma mark  集成第一步: 初始化,  参数:appkey  ,尽可能早的初始化appkey.
    [MQManager initWithAppkey:@"54d7d9ac617ed844f7e72321713a24a3" completion:^(NSString *clientId, NSError *error) {
        if (!error) {
            NSLog(@"美洽 SDK：初始化成功");
        } else {
            NSLog(@"error:%@",error);
        }
    }];
    
    
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    ViewController*vc=[[ViewController alloc]init];
    vc.view.backgroundColor=[UIColor whiteColor];
    UINavigationController*nav=[[UINavigationController alloc]initWithRootViewController:vc];

    self.window.rootViewController=nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    #pragma mark  集成第二步: 进入前台 打开meiqia服务
    [MQManager openMeiqiaService];
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    #pragma mark  集成第三步: 进入后台 关闭美洽服务
    [MQManager closeMeiqiaService];
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    #pragma mark  集成第四步: 上传设备deviceToken
    [MQManager registerDeviceToken:deviceToken];
}


@end
