//
//  TSDylib.m
//  CQAppPassword_dylib
//
//  Created by qian on 2024/4/10.
//

#import "TSDylib.h"

@implementation TSDylib

- (NSInteger)tsdylib_add:(NSInteger)a to:(NSInteger)b {
    return a + b;
}

- (NSInteger)tsdylib_subtract:(NSInteger)a from:(NSInteger)b {
    return b - a;
}

int tsdylib_add(int a, int b) {
    TSDylib *object = [[TSDylib alloc] init];
    NSInteger result = [object tsdylib_add:a to:b];
    
    return [@(result) intValue];;
}

@end
