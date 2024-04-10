//
//  AppDelegate+CQCrackDelegate.m
//  CQAppPassword_dylib
//
//  Created by qian on 2024/4/10.
//  Copyright © 2018 dvlproad. All rights reserved.
//

#import "AppDelegate+CQCrackDelegate.h"
#import "CQCrackDelegate.h"

@implementation AppDelegate (CQCrackDelegate)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [CQCrackDelegate startHookDelegate];
    });
}

@end
