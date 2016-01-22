//
//  LMJInputTextView.h
//  InputTextView
//
//  Version:1.0.0
//
//  Created by MajorLi on 16/1/21.
//  Copyright © 2016年 iOS开发者公会. All rights reserved.
//
//  iOS开发者公会-技术1群 QQ群号：87440292
//  iOS开发者公会-技术2群 QQ群号：232702419
//  iOS开发者公会-议事区  QQ群号：413102158
//

#import <UIKit/UIKit.h>

@interface LMJInputTextView : UIView <UITextViewDelegate>

// 输入内容
@property (nonatomic,readonly) NSString * text;

// 字体颜色
@property (nonatomic,strong)   UIColor  * textColor;

// 字体
@property (nonatomic,strong)   UIFont   * font;

// 占位符
@property (nonatomic,copy)     NSString * placeholder;

// 占位符颜色
@property (nonatomic,strong)   UIColor  * placeholderColor;

// 输入换行是否隐藏键盘
@property (nonatomic,assign)   BOOL       inputReturnHideKeybord;


@end
