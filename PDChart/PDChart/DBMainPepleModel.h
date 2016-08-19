//
//  DBMainPepleModel.h
//  SportsDongBa
//
//  Created by 彭懂 on 16/8/12.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBMainPepleModel : NSObject

@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *count;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
