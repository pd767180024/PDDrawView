//
//  DBMainViewCollectionViewCell.m
//  SportsDongBa
//
//  Created by 彭懂 on 16/8/15.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import "DBMainViewCollectionViewCell.h"
#import "CATCurveProgressView.h"
#import "DBMainCourseModel.h"

@interface DBMainViewCollectionViewCell ()

@property (nonatomic, strong) CATCurveProgressView *progressView;
@property (nonatomic, strong) UILabel *lvLabel;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation DBMainViewCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createCellUI];
    }
    return self;
}

- (void)createCellUI
{
    CATCurveProgressView *pView = [[CATCurveProgressView alloc] initWithFrame:CGRectMake(0, 0, 38 , 38 )];
    pView.progressLineWidth = 4.5;
    pView.curveBgColor = ColorWithHex(@"#999999");
    [self addSubview:pView];
    self.progressView = pView;
    
    UILabel *lvLabel = [[UILabel alloc] initWithFrame:CGRectMake(52 , 0, 90 , 18 )];
    lvLabel.font = [UIFont systemFontOfSize:11 ];
    lvLabel.textColor = ColorWithHex(@"#666666");
    [self.contentView addSubview:lvLabel];
    self.lvLabel = lvLabel;
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(52 - 1, 18, 90, 18)];
    nameLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
}

- (void)fetchMainViewUIWithModel:(DBMainCourseModel *)model
{
    self.progressView.progressColor = model.progressColor;
    [self.progressView setProgress:([model.score floatValue] / 100.0)];
    self.lvLabel.text = model.lvCount;
    self.nameLabel.text = model.evaluationName;
}

@end
