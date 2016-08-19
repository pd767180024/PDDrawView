//
//  PDPepleCountView.m
//  SportsDongBa
//
//  Created by 彭懂 on 16/8/12.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import "PDPepleCountView.h"
#import <CoreText/CTFont.h>
#import <CoreText/CTStringAttributes.h>

#define PDCos(a) cos(a / 180.f * M_PI)
#define PDSin(a) sin(a / 180.f * M_PI)
#define PDTan(a) tan((a) / 180.f * M_PI)
@interface PDPepleCountView ()

@property (nonatomic, strong) NSArray *colorArr;
@property (nonatomic, copy) NSString *titleText;

@end

@implementation PDPepleCountView

- (instancetype)initWithFrame:(CGRect)fram WithColorArr:(NSArray <UIColor *> *)colorArr andTitleName:(NSString *)titleName
{
    self = [super initWithFrame:fram];
    if (self) {
        self.colorArr = colorArr;
        self.titleText = titleName;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // 创建左侧文字lv
    CGRect textRect = CGRectMake(0, self.bounds.size.height - 40, 90, 40);
    CGSize size = CGSizeMake(10, 10);
    UIRectCorner corners = UIRectCornerTopLeft | UIRectCornerBottomLeft;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:textRect byRoundingCorners:corners cornerRadii:size];
    CAShapeLayer *textShape = [CAShapeLayer layer];
    textShape.strokeColor = kMainBorderColor.CGColor;
    UIColor *fillC = self.colorArr[1];
    textShape.fillColor = fillC.CGColor;
    textShape.lineWidth = 2.0;
    textShape.path = path.CGPath;
    [self.layer addSublayer:textShape];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(16, self.bounds.size.height - 40 + (textRect.size.height - 30) / 2.0, 84, 30);
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.layer addSublayer:textLayer];
    
    textLayer.alignmentMode = kCAAlignmentLeft;
    textLayer.wrapped = YES;
    UIFont *font = [UIFont boldSystemFontOfSize:30];
    NSMutableAttributedString *string = nil;
    string = [[NSMutableAttributedString alloc] initWithString:self.titleText];
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFloat fontSize = font.pointSize;
    CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);
    NSDictionary *attribs = @{
                              (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor whiteColor].CGColor,
                              (__bridge id)kCTFontAttributeName: (__bridge id)fontRef
                              };
    [string setAttributes:attribs range:NSMakeRange(0, [self.titleText length])];
    
    font = [UIFont boldSystemFontOfSize:14];
    fontName = (__bridge CFStringRef)font.fontName;
    fontSize = font.pointSize;
    fontRef = CTFontCreateWithName(fontName, fontSize, NULL);
    attribs = @{
                (__bridge id)kCTForegroundColorAttributeName: (__bridge id)[UIColor whiteColor].CGColor,
                (__bridge id)kCTFontAttributeName: (__bridge id)fontRef
                };
    [string setAttributes:attribs range:NSMakeRange(self.titleText.length - 2 > 0 ? self.titleText.length - 2 : 0 , 2)];
    CFRelease(fontRef);
    textLayer.string = string;
    
    // 计算点坐标
    CGPoint rtPoint = CGPointMake(CGRectGetMaxX(textRect), self.bounds.size.height - CGRectGetHeight(textRect));
    CGFloat scale = (self.pepleCount / 1000.f * 40);
    CGFloat yScale = rtPoint.y - scale;
    CGFloat xScale = rtPoint.x + scale * PDTan(23.0);
    CGRect roundRect = CGRectMake(xScale, yScale, 40, 40);
    
    // 创建左侧四边形
    UIBezierPath *leftRoundPath = [UIBezierPath bezierPath];
    [leftRoundPath moveToPoint:CGPointMake(rtPoint.x, rtPoint.y)];
    [leftRoundPath addLineToPoint:CGPointMake(rtPoint.x, rtPoint.y + textRect.size.height)];
    [leftRoundPath addLineToPoint:CGPointMake(xScale, yScale + roundRect.size.height)];
    [leftRoundPath addLineToPoint:CGPointMake(xScale, yScale)];
    [leftRoundPath closePath];
    CAShapeLayer *leftRoundLayer = [CAShapeLayer layer];
    leftRoundLayer.strokeColor = kMainBorderColor.CGColor;
    UIColor *leftRoundLayerC = self.colorArr[0];
    leftRoundLayer.fillColor = leftRoundLayerC.CGColor;
    leftRoundLayer.lineWidth = 1;
    leftRoundLayer.path = leftRoundPath.CGPath;
    [self.layer addSublayer:leftRoundLayer];
    
    // 创建正面四边形
    UIBezierPath *zhengRoundPath = [UIBezierPath bezierPath];
    [zhengRoundPath moveToPoint:CGPointMake(rtPoint.x, rtPoint.y + textRect.size.height)];
    [zhengRoundPath addLineToPoint:CGPointMake(rtPoint.x - 0.5 + roundRect.size.width, rtPoint.y + textRect.size.height)];
    [zhengRoundPath addLineToPoint:CGPointMake(xScale + roundRect.size.width - 0.5, yScale + roundRect.size.height)];
    [zhengRoundPath addLineToPoint:CGPointMake(xScale, yScale + roundRect.size.height)];
    [zhengRoundPath closePath];
    CAShapeLayer *zhengRoundLayer = [CAShapeLayer layer];
    zhengRoundLayer.strokeColor = kMainBorderColor.CGColor;
    UIColor *zhengRoundLayerC = self.colorArr[2];
    zhengRoundLayer.fillColor = zhengRoundLayerC.CGColor;
    zhengRoundLayer.lineWidth = 2.5;
    zhengRoundLayer.path = zhengRoundPath.CGPath;
    [self.layer addSublayer:zhengRoundLayer];
    
    // 创建正方形上方
    UIBezierPath *roundPath = [UIBezierPath bezierPathWithRect:roundRect];
    CAShapeLayer *roundLayer = [CAShapeLayer layer];
    roundLayer.strokeColor = kMainBorderColor.CGColor;
    UIColor *roundFillC = self.colorArr[1];
    roundLayer.fillColor = roundFillC.CGColor;
    roundLayer.lineWidth = 2.0;
    roundLayer.path = roundPath.CGPath;
    [self.layer addSublayer:roundLayer];
    
    CATextLayer *ztextLayer = [CATextLayer layer];
    ztextLayer.frame = CGRectMake(xScale, yScale + (roundRect.size.height - 12) / 2.0, 40, 12);
    ztextLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.layer addSublayer:ztextLayer];
    
    ztextLayer.alignmentMode = kCAAlignmentCenter;
    ztextLayer.wrapped = YES;
    UIFont *zfont = [UIFont systemFontOfSize:12];
    NSMutableAttributedString *zstring = nil;
    zstring = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%.0lf", self.pepleCount]];
    CFStringRef zfontName = (__bridge CFStringRef)zfont.fontName;
    CGFloat zfontSize = zfont.pointSize;
    CTFontRef zfontRef = CTFontCreateWithName(zfontName, zfontSize, NULL);
    NSDictionary *zattribs = @{
                              (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor whiteColor].CGColor,
                              (__bridge id)kCTFontAttributeName: (__bridge id)zfontRef
                              };
    [zstring setAttributes:zattribs range:NSMakeRange(0, [NSString stringWithFormat:@"%.0lf", self.pepleCount].length)];
    CFRelease(zfontRef);
    ztextLayer.string = zstring;

}

- (void)setPepleCount:(CGFloat)pepleCount
{
    _pepleCount = pepleCount;
    [self setNeedsDisplay];
}

@end
