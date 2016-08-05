//
//  GYLTabBar.m
//  GUBaiSI
//
//  Created by 永亮 谷 on 7/20/16.
//  Copyright © 2016 Recluse. All rights reserved.
//

#import "GYLTabBar.h"
#import "UIView+GYLExtension.h"

@interface GYLTabBar ()

@property(nonatomic, weak)UIButton *publishButton;

@end

@implementation GYLTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupPublishButton];
        
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setupAllTabBarButtonsFrame];
    [self setupPublishButtonFrame];
    
}

- (void)setupPublishButton
{
    UIButton *publishButton = [[UIButton alloc] init];
    [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
    
    [publishButton addTarget:self action:@selector(publishButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:publishButton];
    self.publishButton = publishButton;
}

- (void)setupAllTabBarButtonsFrame
{
    int index = 0;
    
    for (UIButton *tabBarButton in self.subviews) {
        
        if (tabBarButton.class  != NSClassFromString(@"UITabBarButton")) continue;
        
        [self setupSingleTabBarButtonFrame:tabBarButton atIndex:index];
        
        index ++;
    }
}

- (void)setupPublishButtonFrame
{
//    self.publishButton.frame = CGRectMake(0, 0, self.frame.size.width / 5, self.frame.size.height);
//    self.publishButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    
    self.publishButton.gyl_width = self.gyl_width / 5;
    self.publishButton.gyl_height = self.gyl_height;
    
    self.publishButton.gyl_center = CGPointMake(self.gyl_width * 0.5, self.gyl_height * 0.5);
    
}


- (void)setupSingleTabBarButtonFrame:(UIView *)tabBarButton atIndex:(int)index
{
    CGFloat buttonW = self.frame.size.width / 5;
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;
    CGFloat buttonX;
    
    if (index >= 2) {
        buttonX = buttonW * (index + 1);
    }else
    {
        buttonX = buttonW * index;
    }
    
    tabBarButton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
}

- (void)publishButtonClick
{
    GYLLog(@"publishButtonClick ----");
}

@end
