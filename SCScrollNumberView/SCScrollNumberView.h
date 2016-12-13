//
//  SCScrollNumberView.h
//  SCScrollNumberViewDemo
//
//  Created by Aevit on 2016/12/13.
//  Copyright © 2016年 Aevit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCScrollNumberView : UIView

/**
 数字字符串，默认为空字符串
 */
@property (nonatomic, strong) NSNumber *number;

/**
 数字字体，默认 14 号系统字体
 */
@property (nonatomic, strong) UIFont *font;

/**
 数字颜色，默认为 darkGray
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 是否向上滚动，默认为 YES
 */

@property (nonatomic, assign) BOOL isScrollUp;
/**
 每个数字滚动的行数，默认是 5 行
 */
@property (nonatomic, assign) NSInteger scrollLineNum;

/**
 动画时间，默认是 1.5
 */
@property (nonatomic, assign) CFTimeInterval duration;

/**
 每个数字的动画间隔时间，默认是 0.2
 */
@property (nonatomic, assign) CFTimeInterval durationOffset;

/**
 不做动画的列，默认为空，格式如：[NSMutableSet setWithObjects:@0, @1, nil]
 */
@property (nonatomic, strong) NSMutableSet *exceptAnimIndexSet;



/**
 开始动画
 */
- (void)startAnimation;

@end
