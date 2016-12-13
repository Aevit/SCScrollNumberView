//
//  SCScrollNumberView.m
//  SCScrollNumberViewDemo
//
//  Created by Aevit on 2016/12/13.
//  Copyright © 2016年 Aevit. All rights reserved.
//

#import "SCScrollNumberView.h"

@interface SCScrollNumberView()

/**
 一行文本的高度
 */
@property (nonatomic, assign) CGFloat oneLineHeight;

/**
 所有 label 的数组
 */
@property (nonatomic, strong) NSMutableArray *numberLblArr;

@end

@implementation SCScrollNumberView

- (instancetype)init {
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.clipsToBounds = YES;
    
    self.font = [UIFont systemFontOfSize:14];
    self.textColor = [UIColor darkGrayColor];
    self.scrollLineNum = 5;
    self.isScrollUp = YES;
    self.duration = 1.5;
    self.durationOffset = 0.2;
    
    self.number = nil;
    //    self.numberStr = @"";
}

#pragma mark - props
- (NSMutableArray *)numberLblArr {
    if (!_numberLblArr) {
        _numberLblArr = [NSMutableArray array];
    }
    return _numberLblArr;
}

- (NSInteger)scrollLineNum {
    return _scrollLineNum + 1;
}

- (void)setNumber:(NSNumber *)number {
    _number = number;
    
    for (UILabel *aLbl in self.numberLblArr) {
        [aLbl removeFromSuperview];
    }
    [self.numberLblArr removeAllObjects];
    
    [self separateNumber];
}

- (NSString *)numberStr {
    if (!self.number) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@", self.number];
}

- (CGFloat)oneLineHeight {
    if (_oneLineHeight == 0) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:self.font,
                                     NSParagraphStyleAttributeName: paragraph};
        CGSize size = [@"8" sizeWithAttributes:attributes];
        _oneLineHeight = ceilf(size.height);
    }
    return _oneLineHeight;
}

- (NSMutableSet *)exceptAnimIndexSet {
    if (!_exceptAnimIndexSet) {
        _exceptAnimIndexSet = [NSMutableSet set];
    }
    return _exceptAnimIndexSet;
}

#pragma mark - private methods
/**
 分离数字，并创建 label
 */
- (void)separateNumber {
    for (int i = 0; i < self.numberStr.length; i++) {
        [self.numberLblArr addObject:[self createNumLabelInIndex:i]];
    }
}

- (UILabel *)createNumLabelInIndex:(NSInteger)index {
    
    CGFloat width = self.frame.size.width / self.numberStr.length;
    UILabel *aLbl = [[UILabel alloc] initWithFrame:CGRectMake(index * width, (self.isScrollUp ? 0 : -[self maxY]), width, self.oneLineHeight * self.scrollLineNum)];
    [self addSubview:aLbl];
    aLbl.font = self.font;
    aLbl.textColor = self.textColor;
    aLbl.backgroundColor = [UIColor clearColor];
    aLbl.textAlignment = NSTextAlignmentCenter;
    aLbl.numberOfLines = 0;
    aLbl.lineBreakMode = NSLineBreakByClipping;
    aLbl.text = [self buildText:[self.numberStr substringWithRange:NSMakeRange(index, 1)]];
    return aLbl;
}


/**
 label 文本赋值，注意最后加多了一行原数字
 
 @param text 原数字
 @return 待滚动的数字
 */
- (NSString*)buildText:(NSString*)text {
    NSMutableString *str = [NSMutableString stringWithFormat:@"%@", text];
    for (int i = 0; i < self.scrollLineNum - 2; i++) {
        [str appendFormat:@"\n%d", rand() % 10];
    }
    [str appendFormat:@"\n%@", text];
    return str;
}

- (CGFloat)maxY {
    return self.oneLineHeight * self.scrollLineNum - self.oneLineHeight;
}

#pragma mark - animation
- (void)startAnimation {
    
    CFTimeInterval duration = self.duration - ([self.numberLblArr count] * self.durationOffset);
    CFTimeInterval offset = 0;
    
    
    for (int i = 0; i < self.numberLblArr.count; i++) {
        
        if ([self.exceptAnimIndexSet containsObject:@(i)]) {
            continue;
        }
        
        UILabel *aLbl = (UILabel*)self.numberLblArr[i];
        aLbl.layer.anchorPoint = CGPointMake(0.5, 0);
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
        animation.duration = duration + offset;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        
        animation.fromValue = (self.isScrollUp ? @0 : @(-[self maxY]));
        animation.toValue = (self.isScrollUp ? @(-[self maxY]) : @0);
        
        [aLbl.layer addAnimation:animation forKey:@"SCScrollNumberViewAnimation"];
        
        offset += self.durationOffset;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
