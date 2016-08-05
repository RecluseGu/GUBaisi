//
//  GYLEssenceViewController.m
//  GUBaiSI
//
//  Created by 永亮 谷 on 7/21/16.
//  Copyright © 2016 Recluse. All rights reserved.
//

#import "GYLEssenceViewController.h"
#import "GYLTitleButton.h"
#import "GYLAllViewController.h"
#import "GYLVideoViewController.h"
#import "GYLVoiceViewController.h"
#import "GYLPictureViewController.h"
#import "GYLWordViewController.h"

@interface GYLEssenceViewController () <UIScrollViewDelegate>

@property(nonatomic, weak)GYLTitleButton *selectedButton;
@property(nonatomic, weak)UIView *underView;
@property(nonatomic, weak)UIScrollView *scrollView;
@property(nonatomic, weak)UIView *titlesView;

@end

@implementation GYLEssenceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = GYLRANDOMCOLOR;
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    UIButton *leftButton = [[UIButton alloc] init];
    [leftButton setImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    
    [leftButton sizeToFit];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    [self setupChildControllers];
    [self setupScrollView];
    [self setupTitlesView];
    
    [self addChildVCView];
    
}

- (void)setupChildControllers
{
    GYLAllViewController *all = [[GYLAllViewController alloc] init];
    [self addChildViewController:all];
    
    GYLVideoViewController *video = [[GYLVideoViewController alloc] init];
    [self addChildViewController:video];
    
    GYLVoiceViewController *voice = [[GYLVoiceViewController alloc] init];
    [self addChildViewController:voice];
    
    GYLPictureViewController *picture = [[GYLPictureViewController alloc] init];
    [self addChildViewController:picture];
    
    GYLWordViewController *word = [[GYLWordViewController alloc] init];
    [self addChildViewController:word];
}


- (void)setupScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = GYLRANDOMCOLOR;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    //set frame
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    
    scrollView.delegate = self;
    
    [self.view addSubview:scrollView];
    
//    NSUInteger count = self.childViewControllers.count;
//    for (NSUInteger i = 0; i < count; i ++) {
//        
//        UITableView *childView = (UITableView *)self.childViewControllers[i].view;
//        childView.backgroundColor = GYLRANDOMCOLOR;
//        
//        childView.gyl_x = i * scrollView.gyl_width;
//        childView.gyl_y = 0;
//        childView.gyl_height = scrollView.gyl_height;
//        
//        childView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
//        childView.scrollIndicatorInsets = childView.contentInset;
//        
//        [scrollView addSubview:childView];
//        
//    }
    
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.gyl_width, 0);
    
    
    self.scrollView = scrollView;
}

- (void)setupTitlesView
{
    UIView *titlesView = [[UIView alloc] init];
    
    titlesView.frame = CGRectMake(0, 64, self.view.gyl_width, 35);
    titlesView.backgroundColor = [UIColor whiteColor];
    self.titlesView = titlesView;
    
    [self.view addSubview:titlesView];
    
    
    NSArray *titles = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    
    CGFloat buttonW = titlesView.gyl_width / titles.count;
    CGFloat buttonH = titlesView.gyl_height;
    
    for (NSUInteger i = 0; i < titles.count; i++) {
        
        GYLTitleButton *button = [GYLTitleButton buttonWithType:UIButtonTypeCustom];
        
        button.tag = i;
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [titlesView addSubview:button];
        
        [button setTitle:titles[i] forState:UIControlStateNormal];
        
        button.frame = CGRectMake(i * buttonW, 0, buttonW, buttonH);
    }
    
    GYLTitleButton *firstButton = titlesView.subviews.firstObject;
    
    UIView *underView = [[UIView alloc] init];
    
    underView.gyl_height = 1;
    underView.gyl_y = titlesView.gyl_height - underView.gyl_height;
    underView.backgroundColor = [firstButton titleColorForState:UIControlStateSelected];
    
    [titlesView addSubview:underView];
    
    self.underView = underView;
    
    // 立刻根据文字内容计算label的宽度
    [firstButton.titleLabel sizeToFit];
    underView.gyl_width = firstButton.titleLabel.gyl_width;
    underView.gyl_centerX = firstButton.gyl_centerX;
    
    // 默认情况 : 选中最前面的标题按钮
    firstButton.selected = YES;
    self.selectedButton = firstButton;
    
}

- (void)buttonClick:(GYLTitleButton *)titleButton
{
    self.selectedButton.selected = NO;
    titleButton.selected = YES;
    self.selectedButton = titleButton;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.underView.gyl_width = titleButton.titleLabel.gyl_width;
        self.underView.gyl_centerX = titleButton.gyl_centerX;
        
    }];
    
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = titleButton.tag * self.scrollView.gyl_width;
    [self.scrollView setContentOffset:offset animated:YES];
    
    
}

- (void)addChildVCView
{
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.gyl_width;
    UIViewController *childVC = self.childViewControllers[index];
    
    if (childVC.view.superview) return;
    
    childVC.view.frame = self.scrollView.bounds;
//    self.scrollView.contentOffset = self.scrollView.bounds.origin;
    
    [self.scrollView addSubview:childVC.view];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addChildVCView];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.gyl_width;
    GYLTitleButton *button = self.titlesView.subviews[index];
    [self buttonClick:button];
    
    [self addChildVCView];
}

@end
