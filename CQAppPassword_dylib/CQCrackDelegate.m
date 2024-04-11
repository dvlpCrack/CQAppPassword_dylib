//
//  CQCrackDelegate.m
//  CQAppPassword_dylib
//
//  Created by qian on 2024/4/10.
//

#import "CQCrackDelegate.h"
#import <CJBaseHelper/HookCJHelper.h>
#import <CJBaseHelper/UIViewControllerCJHelper.h>
#import <dlfcn.h>

#import "CalculatorViewController.h"

@implementation CQCrackDelegate

void startHookDelegate(void) {
    [CQCrackDelegate startHookDelegate];
}

+ (void)startHookDelegate {
    if (@available(iOS 13.0, *)) {
        HookCJHelper_exchangeOriMethodToNewMethodWhichAddFromDiffClass([NSClassFromString(@"SceneDelegate") class], @selector(scene:willConnectToSession:options:), [CQCrackDelegate class], @selector(custom_scene:willConnectToSession:options:));
    } else {
        HookCJHelper_exchangeOriMethodToNewMethodWhichAddFromDiffClass([NSClassFromString(@"AppDelegate") class], @selector(application:didFinishLaunchingWithOptions:), [CQCrackDelegate class], @selector(custom_application:didFinishLaunchingWithOptions:));
    }
}

- (BOOL)custom_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 在原始方法needHook: 之前执行其他操作
    NSLog(@"在方法 AppDelegate 之前执行其他操作");
    
    // 调用原始方法needHook:
    bool result = [self custom_application:application didFinishLaunchingWithOptions:launchOptions];
    
    // 在原始方法needHook: 之后执行其他操作
    NSLog(@"在方法 AppDelegate 之后执行其他操作");
    [CQCrackDelegate extraThingForDelegate];  // 因为使用交换了，所以调用此方法的self不一定是还是本来的self，所以改用类方法调用
    return result;
}

- (void)custom_scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // 在原始方法needHook: 之前执行其他操作
    NSLog(@"在方法 SceneDelegate 之前执行其他操作");
    
    // 调用原始方法needHook:
    [self custom_scene:scene willConnectToSession:session options:connectionOptions];
    
    // 在原始方法needHook: 之后执行其他操作
    NSLog(@"在方法 SceneDelegate 之后执行其他操作");
    [CQCrackDelegate extraThingForDelegate];  // 因为使用交换了，所以调用此方法的self不一定是还是本来的self，所以改用类方法调用
}

+ (void)extraThingForDelegate {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

+ (void)appDidEnterBackground {
    NSLog(@"应用程序进入后台");
    
    [CQCrackDelegate showCalculator];
}

+ (void)showCalculator {
    CalculatorViewController *viewController = [[CalculatorViewController alloc] initWithOKBlock:^(UIViewController * _Nonnull viewController) {
        [viewController dismissViewControllerAnimated:YES completion:nil];
    }];
    viewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [[UIViewControllerCJHelper findCurrentShowingViewController] presentViewController:viewController animated:YES completion:^{
        NSLog(@"密码计算器打开成功");
    }];
}


@end
