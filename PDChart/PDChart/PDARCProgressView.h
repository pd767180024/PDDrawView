//
//  PDARCProgressView.h
//  SportsDongBa
//
//  Created by 彭懂 on 16/8/12.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DBMainSchoolModel;
@interface PDARCProgressView : UIView

@property (nonatomic, strong) NSArray *categoryArray;

- (instancetype)initWithFrame:(CGRect)frame categoryArray:(NSArray<DBMainSchoolModel *> *)categoryArray;

@end
