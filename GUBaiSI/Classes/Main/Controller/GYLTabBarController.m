//
//  GYLTabBarController.m
//  GUBaiSI
//
//  Created by 永亮 谷 on 7/19/16.
//  Copyright © 2016 Recluse. All rights reserved.
//

#define GYLTABBARCOUNT 4

#import "GYLTabBarController.h"
#import "GYLTabBar.h"
#import "GYLNavigationController.h"
#import "GYLEssenceViewController.h"
#import "GYLNewViewController.h"
#import "GYLFollowViewController.h"
#import "GYLMeViewController.h"

@implementation GYLTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    [self setupAllChildViewControllers];
    [self setupCustomTabBar];
    
    
}

- (void)setupCustomTabBar
{
    GYLTabBar *customTabBar = [[GYLTabBar alloc] init];
    
    [self setValue:customTabBar forKeyPath:@"tabBar"];
}

/**
 *  创建所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    [self setupOneChildViewController:[[GYLEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setupOneChildViewController:[[GYLNewViewController alloc] init] title:@"最新" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    [self setupOneChildViewController:[[GYLFollowViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    [self setupOneChildViewController:[[GYLMeViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
}

- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.tabBarItem.title = title;
    
    //设置文字
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [vc.tabBarItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [vc.tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    //设置图片
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    GYLNavigationController * nav = [[GYLNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}
@end
