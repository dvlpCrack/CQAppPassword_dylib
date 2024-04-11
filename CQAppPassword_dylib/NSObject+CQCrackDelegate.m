//
//  NSObject+CQCrackDelegate.m
//  CQAppPassword_dylib
//
//  Created by qian on 2024/4/10.
//  Copyright © 2018 dvlproad. All rights reserved.
//

#import "NSObject+CQCrackDelegate.h"

@implementation NSObject (CQCrackDelegate)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"=========%@", NSStringFromClass(self));
    });
}

@end
