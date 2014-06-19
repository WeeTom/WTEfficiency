//
//  UIViewController+WTE.m
//  MingdaoV2
//
//  Created by Wee Tom on 13-8-1.
//  Copyright (c) 2013年 Mingdao. All rights reserved.
//

#import "UIViewController+WTE.h"
#import "WTEMacro.h"

@implementation NaviBtn
- (UIEdgeInsets)alignmentRectInsets {
    UIEdgeInsets insets;
    if (!WTE_SYSVersionUnder7) {
        if ([self isLeftButton]) {
            insets = UIEdgeInsetsMake(0, 11, 0, 0);
        } else {
            insets = UIEdgeInsetsMake(0, 0, 0, 11);
        }
    } else {
        insets = UIEdgeInsetsZero;
    }
    
    return insets;
}

- (void)setText:(NSString *)text
{
    self.label.text = text;
    [self.label sizeToFit];
    if ([self isLeftButton]) {
        self.label.frame = CGRectMake(10, 22 - self.label.frame.size.height/2, self.label.frame.size.width, self.label.frame.size.height);
    } else {
        self.label.frame = CGRectMake(self.frame.size.width - self.label.frame.size.width - 10, 22 - self.label.frame.size.height/2, self.label.frame.size.width, self.label.frame.size.height);
    }
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
        _label.backgroundColor = [UIColor clearColor];
        _label.textColor = [UIColor lightGrayColor];
        _label.highlightedTextColor = [UIColor lightGrayColor];
        _label.font = [UIFont systemFontOfSize:16];
        _label.numberOfLines = 2;
        _label.adjustsFontSizeToFitWidth = YES;
        _label.minimumScaleFactor = 0.5;
        [self addSubview:_label];
        if (self.isLeftButton) {
            _label.textAlignment = NSTextAlignmentLeft;
        } else {
            _label.textAlignment = NSTextAlignmentRight;
        }
    }
    return _label;
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    self.label.highlighted = highlighted;
}
@end

@implementation UIViewController (WTE)
- (UIBarButtonItem *)backBtnWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage
{
   return [self leftBtnWithImage:image highlightImage:highlightImage target:self selector:@selector(backBtnPressed)];
}

- (void)backBtnPressed
{
    if (![self.navigationController popViewControllerAnimated:YES]) {
        [self dismissViewControllerAnimated:YES completion:^{}];
    }
}

- (UIBarButtonItem *)leftBtnWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage target:(id)target selector:(SEL)selector
{
    NaviBtn *btn = [[NaviBtn alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highlightImage forState:UIControlStateHighlighted];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    btn.isLeftButton = YES;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return self.navigationItem.leftBarButtonItem;
}

- (UIBarButtonItem *)rightBtnWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage target:(id)target selector:(SEL)selector
{
    NaviBtn *btn = [[NaviBtn alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highlightImage forState:UIControlStateHighlighted];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return self.navigationItem.rightBarButtonItem;
}

- (UIBarButtonItem *)leftBtnWithText:(NSString *)text target:(id)target selector:(SEL)selector
{
    NaviBtn *btn = [[NaviBtn alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    btn.isLeftButton = YES;
    [btn setText:text];

    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];

    return self.navigationItem.leftBarButtonItem;
}

- (UIBarButtonItem *)rightBtnWithText:(NSString *)text target:(id)target selector:(SEL)selector
{
    NaviBtn *btn = [[NaviBtn alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    [btn setText:text];

    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return self.navigationItem.rightBarButtonItem;
}
@end
