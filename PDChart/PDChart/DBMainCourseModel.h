//
//  DBMainCourseModel.h
//  SportsDongBa
//
//  Created by 彭懂 on 16/8/12.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DBMainCourseModel : NSObject

@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *scoreTatol;
@property (nonatomic, copy) NSString *lvCount;
@property (nonatomic, copy) NSString *evaluationName;
@property (nonatomic, copy) UIColor *progressColor;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
