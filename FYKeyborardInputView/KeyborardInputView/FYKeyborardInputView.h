//
//  FYKeyborardInputView.h
//  FYKeyborardInputView
//
//  Created by mac on 2018/4/8.
//  Copyright © 2018年 fanyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYKeyborardInputView : UIButton

/**
 直接唤起支付键盘

 @param result 结果回调
 */
+ (void)showWithBlock:(FYSendInfoBlock)result;

@end
