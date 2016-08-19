//
//  PDTorusViewController.m
//  PDChart
//
//  Created by 彭懂 on 16/8/19.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import "PDTorusViewController.h"

#import "DBMainViewCollectionViewCell.h"
#import "DBMainCourseModel.h"

@interface PDTorusViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation PDTorusViewController

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSArray *colorArr = @[
                          ColorWithHex(@"#ff4646"),
                          ColorWithHex(@"#ffc018"),
                          ColorWithHex(@"#008aff"),
                          ColorWithHex(@"#9933cc"),
                          ColorWithHex(@"#00dcd4"),
                          ];
    for (int i = 0; i < 14; i++) {
        DBMainCourseModel *model = [[DBMainCourseModel alloc] init];
        model.score = [NSString stringWithFormat:@"%d", i * 7 + 3];
        model.lvCount = [NSString stringWithFormat:@"%d", i];
        model.evaluationName = @"打发时光";
        model.progressColor = colorArr[i % 5];
        [self.dataSource addObject:model];
    }
    
    UICollectionViewFlowLayout *viewLayout = [[UICollectionViewFlowLayout alloc] init];
    viewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    viewLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectMake(15, 100, 340, 280.0) collectionViewLayout:viewLayout];
    collection.delegate = self;
    collection.dataSource = self;
    collection.bounces = NO;
    collection.allowsSelection = NO;
    collection.scrollEnabled = NO;
    collection.showsHorizontalScrollIndicator = NO;
    collection.showsVerticalScrollIndicator = NO;
    collection.backgroundView = nil;
    collection.backgroundColor = [UIColor clearColor];
    [collection registerClass:[DBMainViewCollectionViewCell class] forCellWithReuseIdentifier:@"DBMainViewCollectionViewCell"];
    [self.view addSubview:collection];
}

#pragma mark -UICollectionView代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger nember = self.dataSource.count > 10 ? 10 : self.dataSource.count;
    return nember;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150, 45.0);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DBMainViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DBMainViewCollectionViewCell" forIndexPath:indexPath];
    DBMainCourseModel *model = [self.dataSource objectAtIndex:indexPath.row];
    [cell fetchMainViewUIWithModel:model];
    return cell;
}

@end
