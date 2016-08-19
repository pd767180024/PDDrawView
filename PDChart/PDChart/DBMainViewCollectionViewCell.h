//
//  DBMainViewCollectionViewCell.h
//  SportsDongBa
//
//  Created by 彭懂 on 16/8/15.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DBMainCourseModel;
@interface DBMainViewCollectionViewCell : UICollectionViewCell

- (void)fetchMainViewUIWithModel:(DBMainCourseModel *)model;

@end
