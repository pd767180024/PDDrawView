//
//  PDCircleViewController.m
//  PDChart
//
//  Created by 彭懂 on 16/8/19.
//  Copyright © 2016年 彭懂. All rights reserved.
//

#import "PDCircleViewController.h"
#import "DBMainPepleModel.h"
#import "PDPepleCountView.h"

@interface PDCircleViewController ()

@property (nonatomic, strong) NSMutableArray *cellDataSource;

@end

@implementation PDCircleViewController

- (NSMutableArray *)cellDataSource
{
    if (!_cellDataSource) {
        _cellDataSource = [[NSMutableArray alloc] init];
    }
    return _cellDataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i < 10; i++) {
        DBMainPepleModel *model = [[DBMainPepleModel alloc] init];
        model.level = [NSString stringWithFormat:@"%d", i];
        model.count = [NSString stringWithFormat:@"%d", 1000 - i * 100];
        [self.cellDataSource addObject:model];
    }
    
    NSArray *colorArr = [self createCountColor];
    CGFloat viewY = 100;
    CGFloat viewX = 15;
    for (int i = 0; i < self.cellDataSource.count; i++) {
        DBMainPepleModel *model = self.cellDataSource[i];
        NSString *text = [NSString stringWithFormat:@"%02d Lv", [model.level intValue]];
        PDPepleCountView *pepleCountView = [[PDPepleCountView alloc] initWithFrame:CGRectMake(viewX, viewY, 146, 80) WithColorArr:colorArr[i] andTitleName:text];
        pepleCountView.pepleCount = [model.count integerValue];
        [self.view addSubview:pepleCountView];
        if (i % 2 == 0) {
            viewX = viewX + pepleCountView.bounds.size.width + 29;
        } else {
            viewX = viewX - pepleCountView.bounds.size.width - 29;
            viewY = viewY + pepleCountView.bounds.size.height + 8;
        }
    }
}

- (NSArray *)createCountColor
{
    NSMutableArray *colorArr = [[NSMutableArray alloc] init];
    NSArray *color1 = @[
                        ColorWithHex(@"#ff8686"),
                        ColorWithHex(@"#ff4646"),
                        ColorWithHex(@"#f00505")
                        ];
    [colorArr addObject:color1];
    
    NSArray *color2 = @[
                        ColorWithHex(@"#44a9ff"),
                        ColorWithHex(@"#008aff"),
                        ColorWithHex(@"#0378db")
                        ];
    [colorArr addObject:color2];
    
    NSArray *color3 = @[
                        ColorWithHex(@"#00f5ec"),
                        ColorWithHex(@"#00dcd4"),
                        ColorWithHex(@"#00b3ac")
                        ];
    [colorArr addObject:color3];
    
    NSArray *color4 = @[
                        ColorWithHex(@"#ffce4b"),
                        ColorWithHex(@"#ffb900"),
                        ColorWithHex(@"#e3a500")
                        ];
    [colorArr addObject:color4];
    
    NSArray *color5 = @[
                        ColorWithHex(@"#ff8e68"),
                        ColorWithHex(@"#ff5a23"),
                        ColorWithHex(@"#eb3b00")
                        ];
    [colorArr addObject:color5];
    
    NSArray *color6 = @[
                        ColorWithHex(@"#ff9add"),
                        ColorWithHex(@"#ff66cc"),
                        ColorWithHex(@"#f100a1")
                        ];
    [colorArr addObject:color6];
    
    NSArray *color7 = @[
                        ColorWithHex(@"#7ee97e"),
                        ColorWithHex(@"#33cc33"),
                        ColorWithHex(@"#00b200")
                        ];
    [colorArr addObject:color7];
    
    NSArray *color8 = @[
                        ColorWithHex(@"#ff7d3c"),
                        ColorWithHex(@"#cc6633"),
                        ColorWithHex(@"#ab3900")
                        ];
    [colorArr addObject:color8];
    
    NSArray *color9 = @[
                        ColorWithHex(@"#c859ff"),
                        ColorWithHex(@"#9933cc"),
                        ColorWithHex(@"#630293")
                        ];
    [colorArr addObject:color9];
    
    NSArray *color10 = @[
                         ColorWithHex(@"#bc3333"),
                         ColorWithHex(@"#990000"),
                         ColorWithHex(@"#710202")
                         ];
    [colorArr addObject:color10];
    
    return colorArr;
}

@end
