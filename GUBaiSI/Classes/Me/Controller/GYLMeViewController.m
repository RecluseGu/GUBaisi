//
//  GYLMeViewController.m
//  GUBaiSI
//
//  Created by 永亮 谷 on 7/21/16.
//  Copyright © 2016 Recluse. All rights reserved.
//

#import "GYLMeViewController.h"
#import "GYLSettingViewController.h"
#import "GYLMeCell.h"
#import "GYLMeFooterView.h"

@implementation GYLMeViewController

- (instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    
    UIButton *settingButton = [[UIButton alloc] init];
    [settingButton setImage:[UIImage imageNamed:@"mine-setting-icon"] forState:UIControlStateNormal];
    [settingButton setImage:[UIImage imageNamed:@"mine-setting-icon-click"] forState:UIControlStateHighlighted];
    
    [settingButton sizeToFit];
    [settingButton addTarget:self action:@selector(settingClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *settingItem = [[UIBarButtonItem alloc] initWithCustomView:settingButton];
    
    
    UIButton *moonButton = [[UIButton alloc] init];
    [moonButton setImage:[UIImage imageNamed:@"mine-moon-icon"] forState:UIControlStateNormal];
    [moonButton setImage:[UIImage imageNamed:@"mine-moon-icon-click"] forState:UIControlStateHighlighted];
    
    [moonButton sizeToFit];
    UIBarButtonItem *moonItem = [[UIBarButtonItem alloc] initWithCustomView:moonButton];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
    
    self.tableView.backgroundColor = GYLBGColor;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = GYLMARGIN;
    self.tableView.contentInset = UIEdgeInsetsMake(GYLMARGIN - 35, 0, 0, 0);
    
    //set footerview
    self.tableView.tableFooterView = [[GYLMeFooterView alloc] init];
}

- (void)settingClick
{
    [self.navigationController pushViewController:[[GYLSettingViewController alloc] init] animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ME";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"注册/登录";
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
    }else{
        cell.textLabel.text = @"离线下载";
        cell.imageView.image = nil;
    }
    
    return cell;
}

@end

