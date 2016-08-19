//
//  PDARCProgressView.m
//  SportsDongBa
//
//  Created by 彭懂 on 16/8/12.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import "PDARCProgressView.h"
#import "DBMainSchoolModel.h"

#define PDAngle(radian) ((radian) * 2 * M_PI)

@interface PDARCProgressView ()

@property (nonatomic, assign) CGFloat   totla;

@end

@implementation PDARCProgressView

- (instancetype)initWithFrame:(CGRect)frame categoryArray:(NSArray<DBMainSchoolModel *> *)categoryArray
{
    self = [super initWithFrame:frame];
    if (self) {
        self.totla = 0;
        self.categoryArray = categoryArray;
        self.backgroundColor = [UIColor clearColor];
        for (DBMainSchoolModel *category in categoryArray) {
            self.totla += [category.course floatValue];
        }
    }
    return self;
}

- (void)setCategoryArray:(NSArray *)categoryArray
{
    _categoryArray = categoryArray;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    NSInteger zeroCoutn = 0;
    for (DBMainSchoolModel *model in self.categoryArray) {
        if ([model.course floatValue] == 0) {
            zeroCoutn++;
        }
    }
    NSArray *colors = kCColorZuHe;
    NSArray *withArr = @[@(66.0), @(58), @(49)];
    // 判断各种情况
    if (self.categoryArray.count == 0 || zeroCoutn == self.categoryArray.count) {
        if (self.categoryArray.count == 0) {
            UIBezierPath *Path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width / 2.f, self.frame.size.height / 2.f) radius:66 startAngle:- M_PI endAngle: + M_PI clockwise:YES];
            CAShapeLayer *layer = [CAShapeLayer layer];
            layer.path = Path.CGPath;
            layer.fillColor = ColorWithHex(@"#cccccc").CGColor;
            layer.strokeColor = kMainBorderColor.CGColor;
            layer.lineWidth = 2;
            [self.layer addSublayer:layer];
        } else {
            CGFloat beforeWith = 0;
            CGFloat startAngle = - M_PI;
            for (int i = 0; i < self.categoryArray.count; i ++) {
                NSNumber *radius = @(0);
                while (radius.floatValue == beforeWith) {
                    radius = [withArr objectAtIndex:arc4random()%3];
                }
                beforeWith = radius.floatValue;
                UIBezierPath *Path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width / 2.f, self.frame.size.height / 2.f) radius:beforeWith startAngle:startAngle endAngle:startAngle + PDAngle((1.0 / self.categoryArray.count)) clockwise:YES];
                CAShapeLayer *layer = [CAShapeLayer layer];
                layer.path = Path.CGPath;
                layer.fillColor = ((UIColor *)colors[i % 10]).CGColor;
                layer.strokeColor = kMainBorderColor.CGColor;
                layer.lineWidth = 2;
                [self.layer addSublayer:layer];
            }
        }
    } if (self.categoryArray.count == 1) {
        UIBezierPath *Path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width / 2.f, self.frame.size.height / 2.f) radius:66 startAngle:- M_PI endAngle: + M_PI clockwise:YES];
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = Path.CGPath;
        layer.fillColor = ((UIColor *)colors[0]).CGColor;
        layer.strokeColor = kMainBorderColor.CGColor;
        layer.lineWidth = 2;
        [self.layer addSublayer:layer];
    } else {
        CGFloat beforeWith = 0;
        CGFloat startAngle = - M_PI + M_PI_4;
        CGFloat firstWith = -1;
        for (int i = 0; i < self.categoryArray.count; i ++) {
            DBMainSchoolModel *model = self.categoryArray[i];
            NSNumber *radius = [withArr objectAtIndex:arc4random()%3];
            if (i > 9) {
                radius = withArr[2];
            } else {
                while (radius.floatValue == beforeWith) {
                    radius = [withArr objectAtIndex:arc4random()%3];
                }
                if (i == 0) {
                    firstWith = beforeWith;
                }
            }
            beforeWith = radius.floatValue;
            UIBezierPath *Path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width / 2.f, self.frame.size.height / 2.f) radius:beforeWith startAngle:startAngle endAngle:startAngle + PDAngle(([model.course floatValue] / self.totla)) clockwise:YES];
            startAngle += PDAngle(([model.course floatValue] / self.totla));
            [Path addLineToPoint:CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0)];
            [Path closePath];
            if (startAngle > M_PI) {
                startAngle -= 2 * M_PI;
            }
            CAShapeLayer *layer = [CAShapeLayer layer];
            layer.path = Path.CGPath;
            if (i > 9) {
                layer.fillColor = ColorWithHex(@"#cccccc").CGColor;
            } else {
                layer.fillColor = ((UIColor *)colors[i % 10]).CGColor;
            }
            layer.strokeColor = kMainBorderColor.CGColor;
            layer.lineWidth = 2;
            [self.layer addSublayer:layer];
        }
    }
    
    UIBezierPath *Path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width / 2.f, self.frame.size.height / 2.f) radius:33 startAngle:- M_PI endAngle: + M_PI clockwise:YES];
    CAShapeLayer *layer1 = [CAShapeLayer layer];
    layer1.path = Path1.CGPath;
    layer1.fillColor = [UIColor whiteColor].CGColor;
    layer1.strokeColor = kMainBorderColor.CGColor;
    layer1.lineWidth = 2;
    [self.layer addSublayer:layer1];
}

@end
