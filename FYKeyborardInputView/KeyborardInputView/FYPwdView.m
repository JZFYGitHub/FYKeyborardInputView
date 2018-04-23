//
//  FYPwdView.m
//  FYKeyborardInputView
//
//  Created by mac on 2018/4/8.
//  Copyright © 2018年 fanyang. All rights reserved.
//

#import "FYPwdView.h"

@implementation FYPwdView


#pragma mark - init
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

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self commentInit];
}

- (void)commentInit
{
    
    self.textFieldArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 6; i++) {
        UITextField *textField = [[UITextField alloc] init];
        textField.borderStyle = UITextBorderStyleBezel;
        textField.font = kFontSize(17);
        textField.userInteractionEnabled = NO;
        textField.textAlignment = NSTextAlignmentCenter;
        textField.backgroundColor = [UIColor whiteColor];
        [self addSubview:textField];
        [self.textFieldArray addObject:textField];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.textFieldArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:12 tailSpacing:12];
    [self.textFieldArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(44);
    }];
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSInteger lenth = textField.text.length;
    if ([string isEqualToString:@""]) {
        NSLog(@"yes");
        self.textFieldArray[lenth - 1].text = @"";
    } else {
        NSLog(@"no");
        self.textFieldArray[lenth].text = @"●";
        if (textField.text.length == 5) {
            self.infoBlock([NSString stringWithFormat:@"%@%@", textField.text, string]);
        }
    }
    return YES;
}


@end
