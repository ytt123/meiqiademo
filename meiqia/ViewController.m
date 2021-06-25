//
//  ViewController.m
//  meiqia
//
//  Created by yangtaotao on 2021/5/15.
//

#import "ViewController.h"
#import "MQChatViewManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor=[UIColor redColor];
    btn.frame=CGRectMake(100, 100, 100, 100);
    [btn setTitle:@"去客服" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pushToMeiqiaVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
#pragma mark  集成第五步: 跳转到聊天界面(button的点击方法)
- (void)pushToMeiqiaVC:(UIButton *)button {
#pragma mark 总之, 要自定义UI层  请参考 MQChatViewStyle.h类中的相关的方法 ,要修改逻辑相关的 请参考MQChatViewManager.h中相关的方法
    
#pragma mark  最简单的集成方法: 全部使用meiqia的,  不做任何自定义UI.
    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
    MQChatViewStyle *aStyle = [chatViewManager chatViewStyle];
    [aStyle setEnableRoundAvatar:YES];
//    [chatViewManager setPreSendMessages: @[@"我想咨询的订单号：【1705045496811】"]];
    
//    [chatViewManager setClientInfo:@{@"name":@"123测试",@"gender":@"man11",@"age":@"100"}];
    
    [chatViewManager setoutgoingDefaultAvatarImage:[UIImage imageNamed:@"meiqia-icon"]];
    [chatViewManager pushMQChatViewControllerInViewController:self];
#pragma mark  觉得返回按钮系统的太丑 想自定义 采用下面的方法
//    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
//    MQChatViewStyle *aStyle = [chatViewManager chatViewStyle];
//    [aStyle setNavBarTintColor:[UIColor redColor]];
//    [aStyle setNavBackButtonImage:[UIImage imageNamed:@"meiqia-icon"]];
//    [chatViewManager pushMQChatViewControllerInViewController:self];
#pragma mark 觉得头像 方形不好看 ,设置为圆形.
//    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
//    MQChatViewStyle *aStyle = [chatViewManager chatViewStyle];
//    [aStyle setEnableRoundAvatar:YES];
//    [aStyle setEnableOutgoingAvatar:NO]; //不显示用户头像
//    [aStyle setEnableIncomingAvatar:NO]; //不显示客服头像
//    [chatViewManager pushMQChatViewControllerInViewController:self];
#pragma mark 导航栏 右按钮 想自定义 ,但是不到万不得已,不推荐使用这个,会造成meiqia功能的缺失,因为这个按钮 1 当你在工作台打开机器人开关后 显示转人工,点击转为人工客服. 2在人工客服时 还可以评价客服
//    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
//    MQChatViewStyle *aStyle = [chatViewManager chatViewStyle];
//    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
//    [bt setImage:[UIImage imageNamed:@"meiqia-icon"] forState:UIControlStateNormal];
//    [aStyle setNavBarRightButton:bt];
//    [chatViewManager pushMQChatViewControllerInViewController:self];
#pragma mark 客户自定义信息
//    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
////    [chatViewManager setClientInfo:@{@"name":@"123测试",@"gender":@"man11",@"age":@"100"} override:YES];
//    [chatViewManager setClientInfo:@{@"name":@"123测试",@"gender":@"man11",@"age":@"100"}];
//    [chatViewManager pushMQChatViewControllerInViewController:self];
#pragma mark 预发送消息
//    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
//    [chatViewManager setPreSendMessages: @[@"我想咨询的订单号：【1705045496811】"]];
//    [chatViewManager pushMQChatViewControllerInViewController:self];
    
#pragma mark 如果你想绑定自己的用户系统 ,当然推荐你使用 客户自定义信息来绑定用户的相关个人信息
#pragma mark 切记切记切记  一定要确保 customId 是唯一的,这样保证  customId和meiqia生成的用户ID是一对一的
//    MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
//    NSString *customId = @"获取你们自己的用户ID 或 其他唯一标识的";
//    if (customId){
//        [chatViewManager setLoginCustomizedId:customId];
//    }else{
//   #pragma mark 切记切记切记 下面这一行是错误的写法 , 这样会导致 ID = "notadda" 和 meiqia多个用户绑定,最终导致 对话内容错乱 A客户能看到 B C D的客户的对话内容
//        //[chatViewManager setLoginCustomizedId:@"notadda"];
//    }
//    [chatViewManager pushMQChatViewControllerInViewController:self];
}


@end
