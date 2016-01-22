//
//  LMJInputTextView.m
//  InputTextView
//
//  Created by LiMingjie on 16/1/21.
//  Copyright © 2016年 iOS开发者公会. All rights reserved.
//
//  iOS开发者公会-技术1群 QQ群号：87440292
//  iOS开发者公会-技术2群 QQ群号：232702419
//  iOS开发者公会-议事区  QQ群号：413102158
//

#import "LMJInputTextView.h"

@implementation LMJInputTextView
{
    UITextView * _textView;
}

- (id)init{
    self = [super init];
    if (self) {
        
        self.clipsToBounds = YES;
        
        [self createTextViewWithFrame:CGRectMake(0, 0, 0, 0)];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.clipsToBounds = YES;
        
        [self createTextViewWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
    }
    return self;
}

- (void)createTextViewWithFrame:(CGRect)frame{
    
    self.placeholderColor = [UIColor lightTextColor];
    
    _textView = [[UITextView alloc] initWithFrame:frame];
    _textView.backgroundColor = [UIColor clearColor];
    _textView.delegate        = self;
    [self addSubview:_textView];
}


#pragma mark - Get/Set Methods

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    
    [_textView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
}

- (NSString *)text{
    if ([_textView.text isEqualToString:_placeholder]) {
        return @"";
    }else{
        return _textView.text;
    }
}

- (void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    
    if (_placeholder.length != 0) {
        if (_textView.text.length == 0) {
            
            _textView.text      = placeholder;
            _textView.textColor = _placeholderColor;
        }
    }
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    
    if ([_textView.text isEqualToString:_placeholder]) {
        _textView.textColor = _placeholderColor;
    }
}

- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    
    if ([_textView.text isEqualToString:_placeholder] == NO) {
        _textView.textColor = textColor;
    }
}

- (void)setFont:(UIFont *)font{
    _textView.font = font;
}

#pragma mark - UITextView Delegate
- (void)textViewDidBeginEditing:(UITextView *)textView{
    if ([_textView.text isEqualToString:self.placeholder]) {
        _textView.text      = @"";
        _textView.textColor = self.textColor;
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text.length == 0) {
        _textView.text      = _placeholder;
        _textView.textColor = _placeholderColor;
    }
}
- (void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length == 0) {
        return;
    }
    
    if ([_textView.text hasSuffix:@"\n"] == YES) {
        
        if (_inputReturnHideKeybord == YES) {
            
            _textView.text = [_textView.text substringToIndex:(_textView.text.length -1)];
            [_textView resignFirstResponder];
            
        }else{
            
        }
    }
    
}

@end
