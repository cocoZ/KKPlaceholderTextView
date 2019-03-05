//
//  KKPlaceholderTextView.m
//  PlaceholderTextView
//
//  Created by Cocoa on 2019/3/4.
//  Copyright © 2019年 Cocoa. All rights reserved.
//

#import "KKPlaceholderTextView.h"

@interface KKPlaceholderTextView ()

@property (nonatomic, strong) UILabel *placeholderLabel;

@end

@implementation KKPlaceholderTextView

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}
- (void)setup {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePlaceholderLabelState) name:UITextViewTextDidChangeNotification object:self];
}

- (void)updatePlaceholderLabelState {
    _placeholderLabel.hidden = self.hasText;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
- (UILabel *)placeholderLabel {
    if (_placeholderLabel == nil) {
        _placeholderLabel = [UILabel new];
        _placeholderLabel.textAlignment = self.textAlignment;
        _placeholderLabel.numberOfLines = 0;
        _placeholderLabel.font = self.font;
        _placeholderLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        _placeholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _placeholderLabel.textColor = [UIColor lightGrayColor];
        _placeholderLabel.hidden = YES;
        [self addSubview:_placeholderLabel];
    }
    return _placeholderLabel;
}

#pragma mark - TextView
- (void)setText:(NSString *)text {
    [super setText:text];
    [self updatePlaceholderLabelState];
}
- (void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
    [self updatePlaceholderLabelState];
}
- (void)setFont:(UIFont *)font {
    [super setFont:font];
    [self updatePlaceholderLabelState];
}
- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    [super setTextAlignment:textAlignment];
    _placeholderLabel.textAlignment = textAlignment;
    [self updatePlaceholderLabelState];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.placeholderLabel.frame = [self placeholderFrame];
}
- (CGSize)intrinsicContentSize {
    CGSize newSize = [super intrinsicContentSize];
    if (self.hasText == NO) {
        UIEdgeInsets padding = self.padding;
        CGRect placeholderFrame = [self placeholderFrame];
        newSize.height = placeholderFrame.size.height + padding.top + padding.bottom;
    }
    return newSize;
}


#pragma mark - Custom

- (CGRect)placeholderFrame {
    UIEdgeInsets padding = self.padding;
    CGFloat maxWidth = CGRectGetWidth(self.frame) - padding.left - padding.right;
    CGFloat height = CGRectGetHeight(self.frame) - padding.top - padding.bottom;
    CGSize size = [self.placeholderLabel sizeThatFits:CGSizeMake(maxWidth, height)];
    
    return CGRectMake(padding.left, padding.top, size.width, size.height);
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.placeholderLabel.text = placeholder;
    [self updatePlaceholderLabelState];
}
- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder {
    _attributedPlaceholder = attributedPlaceholder;
    self.placeholderLabel.attributedText = attributedPlaceholder;
    [self updatePlaceholderLabelState];
}
- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor {
    _placeholderTextColor = placeholderTextColor;
    self.placeholderLabel.textColor = placeholderTextColor;
}

- (UIEdgeInsets)padding {
    return UIEdgeInsetsMake(self.textContainerInset.top, self.textContainerInset.left + self.textContainer.lineFragmentPadding, self.textContainerInset.bottom, self.textContainerInset.right + self.textContainer.lineFragmentPadding);
}
- (void)setPadding:(UIEdgeInsets)padding {
    UIEdgeInsets newInset = UIEdgeInsetsMake(padding.top, padding.left - self.textContainer.lineFragmentPadding, padding.bottom, padding.right - self.textContainer.lineFragmentPadding);
    self.textContainerInset = newInset;
}



@end
