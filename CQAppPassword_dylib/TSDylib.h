//
//  TSDylib.h
//  CQAppPassword_dylib
//
//  Created by qian on 2024/4/10.
//
/*
教程：其他app中调用此动态库的示例如下：

#import <dlfcn.h>
void test_dylib(void) {
    void *handle = dlopen("libCQAppPassword_dylib.dylib", RTLD_LAZY);
    if (!handle) {
        printf("failed to dlopen lib");
        return;
    }
    
    int (*tsdylib_add)(int, int) = (int (*)(int, int)) dlsym(handle, "tsdylib_add");
    if (!tsdylib_add) {
        printf("func error: sum\n");
    } else {
        int result = tsdylib_add(100, 111);
        printf("动态库执行的结果 sum = %d", result);
    }

    dlclose(handle);
}
*/


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TSDylib : NSObject

extern "C" {
    int tsdylib_add(int a, int b);
}

@end

NS_ASSUME_NONNULL_END
