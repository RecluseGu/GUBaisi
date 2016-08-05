//
//  GYLMeWebViewController.m
//  GUBaiSI
//
//  Created by 永亮 谷 on 8/2/16.
//  Copyright © 2016 Recluse. All rights reserved.
//

#import "GYLMeWebViewController.h"

@interface GYLMeWebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardItem;

@end

@implementation GYLMeWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}
- (IBAction)back
{
    [self.webView goBack];
}

- (IBAction)forward
{
    [self.webView goForward];
}

- (IBAction)refresh
{
    [self.webView reload];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.backItem.enabled = webView.canGoBack;
    self.forwardItem.enabled = webView.canGoForward;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
