//
//  KKPlaceholderTextView.h
//  PlaceholderTextView
//
//  Created by Cocoa on 2019/3/4.
//  Copyright © 2019年 Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
/**
 实现占位文本UITextView, 简单设置文本内边距
 */
@interface KKPlaceholderTextView : UITextView

///  内边距
@property (nonatomic, assign) UIEdgeInsets padding;
@property (nonatomic, copy) IBInspectable NSString *placeholder;
@property (nonatomic, copy) IBInspectable NSAttributedString *attributedPlaceholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderTextColor;

@end
