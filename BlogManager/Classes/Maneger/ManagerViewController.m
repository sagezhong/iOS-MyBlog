//
//  ManagerViewController.m
//  BlogManager
//
//  Created by 史莱斯 on 2018/7/27.
//  Copyright © 2018年 史莱斯. All rights reserved.
//

#import "ManagerViewController.h"
#import <WebKit/WebKit.h>
#import "NSURLProtocol+WKWebVIew.h"
#import "JWCacheURLProtocol.h"


@interface ManagerViewController () <WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@property (nonatomic, strong) UIWebView *mywebView;

@end

@implementation ManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   [JWCacheURLProtocol startListeningNetWorking];
  //  [NSURLProtocol wk_registerScheme:@"http"];
  //  [NSURLProtocol wk_registerScheme:@"https"];
    
   /*
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://sagezhong.top/admin/"]]];
    self.webView = webView;
    self.webView.navigationDelegate = self;
    
    
   
    [self.view addSubview:self.webView];
    
    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(back)] ;
    [self.webView addGestureRecognizer:swip];
    
 */
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://sagezhong.top/admin/"]]];
    self.mywebView = webView;
    [self.view addSubview:self.mywebView];
    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(back)] ;
    [self.mywebView addGestureRecognizer:swip];
    
    

  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)back {
    [self.webView goBack];
}
/*- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView evaluateJavaScript:@"var a = document.getElementsByTagName('a');for(var i=0;i<a.length;i++){a[i].setAttribute('target','');}" completionHandler:nil];
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}*/

- (void)viewDidDisappear:(BOOL)animated {
    
    [JWCacheURLProtocol cancelListeningNetWorking];
    
}


@end
