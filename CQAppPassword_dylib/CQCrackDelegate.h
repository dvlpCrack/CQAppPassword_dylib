//
//  CQCrackDelegate.h
//  CQAppPassword_dylib
//
//  Created by qian on 2024/4/10.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CQCrackDelegate : NSObject

//extern "C" {
    void startHookDelegate(void);
//}

@end

NS_ASSUME_NONNULL_END
