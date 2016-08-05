//
//  GYLTitleButton.m
//  GUBaiSI
//
//  Created by 永亮 谷 on 8/4/16.
//  Copyright © 2016 Recluse. All rights reserved.
//

#import "GYLTitleButton.h"

@implementation GYLTitleButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        
    }
    
    return self;
}

@end
