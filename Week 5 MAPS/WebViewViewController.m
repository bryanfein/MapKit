//
//  WebViewViewController.m
//  Week 5 MAPS
//
//  Created by Bryan Fein on 8/11/15.
//  Copyright (c) 2015 Bryan Fein. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController ()

@end

@implementation WebViewViewController
@synthesize wkWebView;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.wkWebView = [[WKWebView alloc]initWithFrame:self.view.frame];
    
    NSURL *URL2 = [NSURL URLWithString:self.webUrl];
    
    [self setView:self.wkWebView];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL2];
    [self.wkWebView loadRequest:request];
}

@end
