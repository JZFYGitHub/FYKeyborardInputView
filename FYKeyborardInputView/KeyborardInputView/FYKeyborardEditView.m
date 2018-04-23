//
//  FYKeyborardEditView.m
//  FYKeyborardInputView
//
//  Created by mac on 2018/4/9.
//  Copyright © 2018年 fanyang. All rights reserved.
//

#import "FYKeyborardEditView.h"

@interface FYKeyborardEditView ()
@property (nonatomic, strong) UITextField *textField;
@end

@implementation FYKeyborardEditView

#pragma mark - lazy
- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectZero];
        _textField.delegate = self;
        _textField.keyboardType = UIKeyboardTypePhonePad;
    }
    return _textField;
}

#pragma mark - init
- (void)commentInit
{
    [super commentInit];
    
    [self.superview addSubview:self.textField];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pwdAction)];
    [self addGestureRecognizer:tap];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commentInit];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self commentInit];
}

#pragma mark - privete
- (void)pwdAction
{
    if (!self.textField.isFirstResponder) {
        [self.textField becomeFirstResponder];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length == 5) {
        [textField endEditing:YES];
    }
    return [super textField:textField shouldChangeCharactersInRange:range replacementString:string];
}

@end
