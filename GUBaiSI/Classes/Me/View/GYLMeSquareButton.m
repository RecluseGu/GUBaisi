//
//  GYLMeSquareButton.m
//  GUBaiSI
//
//  Created by 永亮 谷 on 8/1/16.
//  Copyright © 2016 Recluse. All rights reserved.
//

#import "GYLMeSquareButton.h"
#import "UIView+GYLExtension.h"
#import "GYLMeSquare.h"

#import <UIButton+WebCache.h>

@implementation GYLMeSquareButton


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        
    }
    
    return self;
    
}

- (void)layoutSubviews
{

    [super layoutSubviews];
    
    self.imageView.gyl_y = self.gyl_height * 0.15;
    self.imageView.gyl_height = self.gyl_height * 0.5;
    self.imageView.gyl_width = self.imageView.gyl_height;
    self.imageView.gyl_centerX = self.gyl_width * 0.5;
    
    self.titleLabel.gyl_x = 0;
    self.titleLabel.gyl_y = self.imageView.gyl_bottom;
    self.titleLabel.gyl_width = self.gyl_width;
    self.titleLabel.gyl_height = self.gyl_height - self.titleLabel.gyl_y;
}

- (void)setSquare:(GYLMeSquare *)square
{
    _square = square;
    
    [self setTitle:square.name forState:UIControlStateNormal];
    [self sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"mine-icon-more"]];
    
}

@end
