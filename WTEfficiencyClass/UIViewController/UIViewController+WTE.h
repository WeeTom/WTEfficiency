//
//  UIViewController+WTE.h
//  MingdaoV2
//
//  Created by Wee Tom on 13-8-1.
//  Copyright (c) 2013年 Mingdao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NaviBtn : UIButton
@property (strong, nonatomic) UILabel *label;
@property (assign, nonatomic) BOOL isLeftButton;
- (void)setText:(NSString *)text;
@end

@interface UIViewController (WTE)
- (UIBarButtonItem *)backBtnWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage;
- (UIBarButtonItem *)leftBtnWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage target:(id)target selector:(SEL)selector;
- (UIBarButtonItem *)rightBtnWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage target:(id)target selector:(SEL)selector;

- (UIBarButtonItem *)leftBtnWithText:(NSString *)text target:(id)target selector:(SEL)selector;
- (UIBarButtonItem *)rightBtnWithText:(NSString *)text target:(id)target selector:(SEL)selector;
@end
