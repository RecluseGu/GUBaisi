//
//  GYLSettingViewController.m
//  GUBaiSI
//
//  Created by 永亮 谷 on 7/21/16.
//  Copyright © 2016 Recluse. All rights reserved.
//

#import "GYLSettingViewController.h"
#import "GYLClearCacheCell.h"

@implementation GYLSettingViewController

static NSString * const GYLClearCacheCellID = @"ClearCache";
static NSString * const GYLSettingCellID = @"Setting";


- (instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = GYLBGColor;
    self.navigationItem.title = @"设置";
    
    [self.tableView registerClass:[GYLClearCacheCell class] forCellReuseIdentifier:GYLClearCacheCellID];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:GYLSettingCellID];
    
//    [self getCache];
    
}

//- (void)getCache
//{
//    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
//    NSString *dirPath = [cachePath stringByAppendingPathComponent:@"MP3"];
//    
//    GYLLog(@"%@", cachePath);
//    
//    unsigned long long size = 0;
//    
//    NSFileManager *mgr = [NSFileManager defaultManager];
//    NSArray *subPath = [mgr subpathsAtPath:dirPath];
//    
//    for (NSString *path in subPath) {
//        
//        NSString *fullPath = [dirPath stringByAppendingPathComponent:path];
//        
//        NSDictionary *attrs = [mgr attributesOfItemAtPath:fullPath error:nil];
//        
//        size += attrs.fileSize;
//    }
//    
//    GYLLog(@"%zd",size);
//}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString * ID = @"Setting";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//    }
//    
//    cell.textLabel.text = @"清除缓存(812KB)";
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    
//    return cell;
    
    if (indexPath.section == 0 && indexPath.row == 0) {
//        return [tableView dequeueReusableCellWithIdentifier:GYLClearCacheCellID];
        return [[GYLClearCacheCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:GYLClearCacheCellID];
        
    }
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:GYLSettingCellID];
    cell.textLabel.text = [NSString stringWithFormat:@"section-%zd,row--%zd",indexPath.section,indexPath.row];
    return cell;
}

@end
