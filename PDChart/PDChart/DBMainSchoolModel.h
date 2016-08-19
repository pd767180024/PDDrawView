//
//  DBMainSchoolModel.h
//  SportsDongBa
//
//  Created by 彭懂 on 16/8/12.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBMainSchoolModel : NSObject

@property (nonatomic, copy) NSString *school;
@property (nonatomic, copy) NSString *schoolColor;
@property (nonatomic, copy) NSString *course;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
