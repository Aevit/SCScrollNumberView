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
 the number will to scroll
 */
@property (nonatomic, strong) NSNumber *number;

/**
 default: [UIFont systemFontOfSize:14]
 */
@property (nonatomic, strong) UIFont *font;

/**
 default: [UIColor darkGrayColor]
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 scroll up or down, default: YES
 */

@property (nonatomic, assign) BOOL isScrollUp;

/**
 row number to scroll, default: 5
 */
@property (nonatomic, assign) NSInteger scrollLineNum;

/**
 animation duration, default: 1.5
 */
@property (nonatomic, assign) CFTimeInterval duration;

/**
 animation duration gap, default: 0.2
 */
@property (nonatomic, assign) CFTimeInterval durationOffset;

/**
 the columns will NOT scroll. eg. [NSMutableSet setWithObjects:@0, @1, nil]; default: empty set.
 */
@property (nonatomic, strong) NSMutableSet *exceptAnimIndexSet;



/**
 start to scroll
 */
- (void)startAnimation;

@end
