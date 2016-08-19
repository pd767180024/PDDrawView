//
//  DBSchoolSubTableViewCell.h
//  SportsDongBa
//
//  Created by 彭懂 on 16/8/12.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBSchoolSubTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView *colorView;
@property (nonatomic, strong) UILabel *schoolLabel;
@property (nonatomic, strong) UILabel *courseLabel;

+ (instancetype)createSchoolSubTableViewCellWithTableView:(UITableView *)tableView;

@end
