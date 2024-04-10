//
//  CalculatorViewController.m
//  TSDemoDemo
//
//  Created by qian on 2024/4/10.
//  Copyright © 2024 dvlproad. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@property (nonatomic, strong) UILabel *displayLabel;
@property (nonatomic, weak) void(^okBlock)(UIViewController *viewController);


@end

@implementation CalculatorViewController

- (id)initWithOKBlock:(void(^)(UIViewController *viewController))okBlock {
    self = [super init];
    if (self) {
        _okBlock = okBlock;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.blackColor;
    
    // 创建显示标签
    UILabel *displayLabel = [[UILabel alloc] init];
    displayLabel.font = [UIFont boldSystemFontOfSize:40];
    displayLabel.textAlignment = NSTextAlignmentRight;
    displayLabel.backgroundColor = [UIColor blackColor];
    [self.view addSubview:displayLabel];
    self.displayLabel = displayLabel;
    
    // 创建按钮
    NSArray *buttonTitles = @[@"AC", @"+/-", @"%", @"÷",
                              @"7", @"8", @"9", @"x",
                              @"4", @"5", @"6", @"-",
                              @"1", @"2", @"3", @"+",
                              @"0", @"", @".", @"="];
    CGFloat buttonWidth = 80;
    CGFloat buttonHeight = 80;
    CGFloat spacing = 10;
    CGFloat startX = 20;
    CGFloat startY = CGRectGetHeight(self.view.bounds) - 39 - 5 * buttonHeight - 4 * spacing;
    
    for (NSInteger i = 0; i < buttonTitles.count; i++) {
        NSString *buttonTitle = buttonTitles[i];
        
        UIColor *buttonTitleColor = UIColor.whiteColor;
        UIColor *buttonBackgroundColor = UIColor.grayColor;
        if ([@[@"AC", @"+/-", @"%"] containsObject:buttonTitle]) {
            buttonTitleColor = [UIColor blackColor];
            buttonBackgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:1.0];
        } else if ([@[@"÷", @"x", @"-", @"+", @"="] containsObject:buttonTitle]) {
            buttonTitleColor = [UIColor whiteColor];
            buttonBackgroundColor = [UIColor orangeColor];
        }
        NSInteger row = i / 4;
        NSInteger column = i % 4;
        
        CGFloat buttonX = startX + (buttonWidth + spacing) * column;
        CGFloat buttonY = startY + (buttonHeight + spacing) * row;
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight)];
        [button setTitle:buttonTitle forState:UIControlStateNormal];
        [button setTitleColor:buttonTitleColor forState:UIControlStateNormal];
        button.backgroundColor = buttonBackgroundColor;
        [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    [self.displayLabel setFrame:CGRectMake(20, startY-20-100, CGRectGetWidth(self.view.bounds) - 40, 100)];
}

- (void)buttonTapped:(UIButton *)sender {
    NSString *buttonTitle = sender.titleLabel.text;
    NSString *currentDisplayText = self.displayLabel.text;
    if (currentDisplayText == nil) {
        currentDisplayText = @"";
    }
    
    if ([buttonTitle isEqualToString:@"AC"]) {
        // 清除显示
        self.displayLabel.text = @"";
    } else if ([buttonTitle isEqualToString:@"="]) {
        // 执行计算
        NSExpression *expression = [NSExpression expressionWithFormat:currentDisplayText];
        NSNumber *result = [expression expressionValueWithObject:nil context:nil];
        NSString *text = [result stringValue];
        self.displayLabel.text = text;
        
        if ([self checkPassword:text]) {
            self.okBlock(self);
        }
        
    } else {
        // 追加按钮文本到显示
        self.displayLabel.text = [currentDisplayText stringByAppendingString:buttonTitle];
    }
}

- (BOOL)checkPassword:(NSString *)text {
    // 获取当前时间
    NSDate *currentDate = [NSDate date];
    
    // 创建日期格式化器
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    // 设置小时和分钟的格式为两位数，不足两位时在前面补零
    [dateFormatter setDateFormat:@"HHmm"];
    
    // 格式化当前时间
    NSString *formattedTime = [dateFormatter stringFromDate:currentDate];
    NSLog(@"当前时间后四位：%@", formattedTime);
    
    if ([text isEqualToString:formattedTime]) {
        return true;
    }
    return false;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
