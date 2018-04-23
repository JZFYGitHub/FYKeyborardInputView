//
//  FYPwdView.h
//  FYKeyborardInputView
//
//  Created by mac on 2018/4/8.
//  Copyright © 2018年 fanyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYPwdView : UIView  <UITextFieldDelegate>


/**
 结果回调
 */
@property (nonatomic, copy) FYSendInfoBlock infoBlock;

@property (nonatomic, strong) NSMutableArray <UITextField *>*textFieldArray;


/**
 公共初始化
 */
- (void)commentInit;

@end
