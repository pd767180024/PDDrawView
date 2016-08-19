//
//  ViewController.m
//  PDChart
//
//  Created by 彭懂 on 16/8/19.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import "ViewController.h"
#import "PDSawtoothViewController.h"
#import "PDCircleViewController.h"
#import "PDTorusViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indenti = @"pengdong";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indenti];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indenti];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"锯状圆饼图";
            break;
        case 1:
            cell.textLabel.text = @"矩形图";
            break;
        case 2:
            cell.textLabel.text = @"圆环图";
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            PDSawtoothViewController *sawtooth = [[PDSawtoothViewController alloc] init];
            [self.navigationController pushViewController:sawtooth animated:YES];
        }
            break;
        case 1:
        {
            PDCircleViewController *circle = [[PDCircleViewController alloc] init];
            [self.navigationController pushViewController:circle animated:YES];
        }
            break;
        case 2:
        {
            PDTorusViewController *torus = [[PDTorusViewController alloc] init];
            [self.navigationController pushViewController:torus animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
