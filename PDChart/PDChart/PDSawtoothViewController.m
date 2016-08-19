//
//  PDSawtoothViewController.m
//  PDChart
//
//  Created by 彭懂 on 16/8/19.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import "PDSawtoothViewController.h"
#import "DBSchoolSubTableViewCell.h"
#import "DBMainSchoolModel.h"
#import "PDARCProgressView.h"

@interface PDSawtoothViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation PDSawtoothViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i = 0; i < 6; i++) {
        DBMainSchoolModel *model = [[DBMainSchoolModel alloc] init];
        model.school = [NSString stringWithFormat:@"学校一中%d", i];
        model.course = [NSString stringWithFormat:@"%d", (6 - i) * 100 + 50];
        [arr addObject:model];
    }
    self.dataSource = arr;
    PDARCProgressView *progressView = [[PDARCProgressView alloc] initWithFrame:CGRectMake(17, 100, 148, 148) categoryArray:arr];
    [self.view addSubview:progressView];
    
    UITableView *taView = [[UITableView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(progressView.frame) + 14, 100, 160 , 136) style:UITableViewStylePlain];
    taView.backgroundColor = [UIColor clearColor];
    taView.backgroundView = [[UIView alloc] init];
    taView.separatorStyle = UITableViewCellSeparatorStyleNone;
    taView.showsVerticalScrollIndicator = NO;
    taView.showsHorizontalScrollIndicator = NO;
    taView.delegate = self;
    taView.dataSource = self;
    [self.view addSubview:taView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 29;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DBSchoolSubTableViewCell *cell = [DBSchoolSubTableViewCell createSchoolSubTableViewCellWithTableView:tableView];
    DBMainSchoolModel *model = [self.dataSource objectAtIndex:indexPath.row];
    NSArray *arr = kCColorZuHe;
    UIColor *color = [arr objectAtIndex:indexPath.row];
    cell.colorView.backgroundColor = color;
    cell.courseLabel.text = model.course;
    cell.courseLabel.textColor = color;
    cell.schoolLabel.text = model.school;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
