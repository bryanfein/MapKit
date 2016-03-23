//
//  WebViewViewController.h
//  Week 5 MAPS
//
//  Created by Bryan Fein on 8/11/15.
//  Copyright (c) 2015 Bryan Fein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>


@interface WebViewViewController : UIViewController <NSURLSessionDelegate, WKUIDelegate>



@property (nonatomic, strong) NSString *webUrl;
@property (nonatomic,strong) WKWebView *wkWebView;


@end
