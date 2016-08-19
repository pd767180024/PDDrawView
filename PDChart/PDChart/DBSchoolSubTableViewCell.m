//
//  DBSchoolSubTableViewCell.m
//  SportsDongBa
//
//  Created by 彭懂 on 16/8/12.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import "DBSchoolSubTableViewCell.h"

@implementation DBSchoolSubTableViewCell

+ (instancetype)createSchoolSubTableViewCellWithTableView:(UITableView *)tableView
{
    DBSchoolSubTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DBSchoolSubTableViewCell"];
    if (!cell) {
        cell = [[DBSchoolSubTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DBSchoolSubTableViewCell"];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    UIView *colorV = [[UIView alloc] initWithFrame:CGRectMake(0, 5, 15, 15)];
    colorV.backgroundColor = [UIColor whiteColor];
    colorV.layer.borderColor = kMainBorderColor.CGColor;
    colorV.layer.borderWidth = 1.5;
    [self.contentView addSubview:colorV];
    self.colorView = colorV;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25, 4, 80, 17)];
    label.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:label];
    self.schoolLabel = label;
    
    UILabel *corsel = [[UILabel alloc] initWithFrame:CGRectMake(115, 0, 50, 27)];
    corsel.font = [UIFont boldSystemFontOfSize:18];
    [self.contentView addSubview:corsel];
    self.courseLabel = corsel;
}

@end
