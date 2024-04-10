//
//  CalculatorViewController.h
//  TSDemoDemo
//
//  Created by qian on 2024/4/10.
//  Copyright © 2024 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorViewController : UIViewController

- (id)initWithOKBlock:(void(^)(UIViewController *viewController))okBlock;

@end

NS_ASSUME_NONNULL_END
