//
//  WMViewController.m
//  WMHAVP
//
//  Created by 13260444370@163.com on 01/14/2022.
//  Copyright (c) 2022 13260444370@163.com. All rights reserved.
//

#import "WMViewController.h"
#import "WMHAVP.h"

@interface WMViewController ()

@end

@implementation WMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImageView *icon = [[UIImageView alloc] init];
    [self.view addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(162, 80));
    }];
    icon.backgroundColor = WM_LIGHTGRAY_COLOR;
    //图片名称要写全称
    //到指定目录
    NSURL *bundleURL = [[NSBundle mainBundle] URLForResource:@"Frameworks" withExtension:nil];
    bundleURL = [bundleURL URLByAppendingPathComponent:@"WMHAVP"];
    bundleURL = [bundleURL URLByAppendingPathExtension:@"framework"];
    if (bundleURL) {
        NSBundle *imgBundle = [NSBundle bundleWithURL:bundleURL];
        bundleURL = [imgBundle URLForResource:@"WMHAVP" withExtension:@"bundle"];
        if (bundleURL) {
            NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
            icon.image = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"btn_havplive_video@2x.png" ofType:nil]];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
