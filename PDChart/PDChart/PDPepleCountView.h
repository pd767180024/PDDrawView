//
//  PDPepleCountView.h
//  SportsDongBa
//
//  Created by 彭懂 on 16/8/12.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDPepleCountView : UIView

@property (nonatomic, assign) CGFloat  pepleCount;

- (instancetype)initWithFrame:(CGRect)fram WithColorArr:(NSArray <UIColor *> *)colorArr andTitleName:(NSString *)titleName;

@end
