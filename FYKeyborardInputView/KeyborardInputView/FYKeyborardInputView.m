//
//  FYKeyborardInputView.m
//  FYKeyborardInputView
//
//  Created by mac on 2018/4/8.
//  Copyright © 2018年 fanyang. All rights reserved.
//

#import "FYKeyborardInputView.h"
#import "FYPwdView.h"

@interface FYKeyborardInputView () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) FYPwdView *pwdView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *inputView;

@property (nonatomic, copy) FYSendInfoBlock resultBlock;
@end

@implementation FYKeyborardInputView


- (UIView *)inputView
{
    if (!_inputView) {
        _inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenHeight, 100)];
        [_inputView addSubview:self.label];
        _inputView.backgroundColor = FBGColor;
        [_inputView addSubview:self.pwdView];
    }
    return _inputView;
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
        _label.font = kFontSize(15);
        _label.backgroundColor = [UIColor whiteColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor blackColor];
        _label.text = @"请输入支付密码";
    }
    return _label;
}

- (FYPwdView *)pwdView
{
    if (!_pwdView) {
        _pwdView = [[FYPwdView alloc] initWithFrame:CGRectMake(0, 40, kScreenWidth, 60)];
        _pwdView.backgroundColor = [UIColor whiteColor];
    }
    return _pwdView;
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.tintColor = [UIColor clearColor];
        _textField.textColor = [UIColor clearColor];
        _textField.keyboardType = UIKeyboardTypePhonePad;
        _textField.delegate = self;
        _textField.inputAccessoryView = self.inputView;
    }
    return _textField;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self commentInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commentInit];
    }
    return self;
}

- (void)commentInit
{
    [self addSubview:self.textField];
    
    [self.textField becomeFirstResponder];
    [self addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
}

+ (void)showWithBlock:(FYSendInfoBlock)result
{
    FYKeyborardInputView *view = [FYKeyborardInputView buttonWithType:UIButtonTypeCustom];
    view.backgroundColor = [UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:.4];
    view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    view.resultBlock = result;
    
    [FYKeyWindows.rootViewController.view addSubview:view];
}

- (void)dismissAction
{
    [self.textField resignFirstResponder];
    [self removeFromSuperview];
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSInteger lenth = textField.text.length;
    if ([string isEqualToString:@""]) {
        NSLog(@"yes");
        self.pwdView.textFieldArray[lenth - 1].text = @"";
    } else {
        NSLog(@"no");
        self.pwdView.textFieldArray[lenth].text = @"●";
        if (textField.text.length == 5) {
            if (self.resultBlock) {
                self.resultBlock([NSString stringWithFormat:@"%@%@", textField.text, string]);
            }
            [self dismissAction];
        }
    }
    return YES;
}

@end
