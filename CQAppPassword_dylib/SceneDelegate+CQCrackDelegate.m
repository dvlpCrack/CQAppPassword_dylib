//
//  SceneDelegate+CQCrackDelegate.m
//  CQAppPassword_dylib
//
//  Created by qian on 2024/4/10.
//  Copyright © 2018 dvlproad. All rights reserved.
//

#import "SceneDelegate+CQCrackDelegate.h"
#import "CQCrackDelegate.h"

@implementation SceneDelegate (CQCrackDelegate)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [CQCrackDelegate startHookDelegate];
    });
}

@end
