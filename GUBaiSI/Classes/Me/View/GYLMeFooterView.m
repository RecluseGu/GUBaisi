//
//  GYLMeFooterView.m
//  GUBaiSI
//
//  Created by 永亮 谷 on 7/28/16.
//  Copyright © 2016 Recluse. All rights reserved.
//

#import "GYLMeFooterView.h"
#import <AFNetworking.h>
#import "GYLMeSquare.h"
#import <MJExtension.h>
#import "UIView+GYLExtension.h"
#import "GYLMeSquareButton.h"
#import "GYLMeWebViewController.h"
#import <SafariServices/SafariServices.h>

@implementation GYLMeFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        
        NSString *api = @"http://api.budejie.com/api/api_open.php";
        
        [[AFHTTPSessionManager manager] GET:api parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//             GYLLog(@"请求成功 - %@", responseObject);
            
//            [responseObject writeToFile:@"/Users/Recluse/Desktop/square.plist" atomically:YES];
            
            NSArray *squares = [GYLMeSquare mj_objectArrayWithKeyValuesArray:responseObject [@"square_list"]];
            
            [self setupSquares:squares];
           
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           
            GYLLog(@"请求失败 - %@", error);
            
        }];
        
    }
    
    return self;
}


- (void)setupSquares:(NSArray *)squares
{
    NSUInteger count = squares.count;
    int maxCol = 5;
    CGFloat buttonW = self.gyl_width / maxCol;
    CGFloat buttonH = buttonW;
    
    for (NSUInteger i = 0; i < count; i++) {
        GYLMeSquare *square = squares[i];
        
        GYLMeSquareButton *button = [GYLMeSquareButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:button];
        
        //set frame
        button.gyl_x = (i % maxCol) * buttonW;
        button.gyl_y = (i / maxCol) * buttonH;
        button.gyl_width = buttonW;
        button.gyl_height = buttonH;
        
        //set data
        
        
        [button addTarget:self action:@selector(squareClick:) forControlEvents:UIControlEventTouchUpInside];
        button.square = square;
        
    }
    self.gyl_height = self.subviews.lastObject.gyl_bottom;
    
    UITableView *tableview = (UITableView *)self.superview;
    tableview.tableFooterView = self;
    [tableview reloadData]; //刷新表格 重新计算contentsize
    
//    tableview.contentSize = CGSizeMake(0, self.gyl_bottom);

}


- (void)squareClick:(GYLMeSquareButton *)button
{
    
    GYLMeSquare *square = button.square;
    if ([square.url hasPrefix:@"http"]) {
        
//        GYLLog(@"change to webview");
        GYLMeWebViewController *webview = [[GYLMeWebViewController alloc] init];
        webview.url = square.url;
        webview.title = square.name;
        
//        SFSafariViewController *webview = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:square.url]];
        
        UITabBarController *tabbarVc = (UITabBarController *)self.window.rootViewController;
        UINavigationController *nav = tabbarVc.selectedViewController;;
        [nav pushViewController:webview animated:YES];
        
        
    }else if([square.url hasPrefix:@"mod"]){
        if ([square.url hasSuffix:@"BDJ_To_Check"]) {
            GYLLog(@"审核");
        }
    }
}

@end
