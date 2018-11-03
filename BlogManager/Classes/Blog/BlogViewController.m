//
//  BlogViewController.m
//  BlogManager
//
//  Created by 史莱斯 on 2018/7/27.
//  Copyright © 2018年 史莱斯. All rights reserved.
//

#import "BlogViewController.h"
#import <WebKit/WebKit.h>
#import "NSURLProtocol+WKWebVIew.h"
#import "JWCacheURLProtocol.h"

@interface BlogViewController () <WKNavigationDelegate,WKUIDelegate>

@property (nonatomic, strong) WKWebView *webView;

@property (nonatomic, strong) NSURL *currentUrl;

@property (nonatomic, strong) NSURLRequest *currenRq;

@end

@implementation BlogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //开始拦截
    [JWCacheURLProtocol startListeningNetWorking];
    [NSURLProtocol wk_registerScheme:@"http"];
   // [NSURLProtocol wk_registerScheme:@"https"];
    // Do any additional setup after loading the view.
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://sagezhong.top"]]];
    self.webView = webView;
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    self.webView.allowsBackForwardNavigationGestures = YES;
    
   
    
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    cancleButton.frame = CGRectMake(0, 0, 80, 40);
    [cancleButton setTitle:@"刷新" forState:UIControlStateNormal];
    [cancleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(relord) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:cancleButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    

    
    
    
    
    [self.view addSubview:self.webView];
    
   //  UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(back)] ;
 //   [self.webView addGestureRecognizer:swip];
    


    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) relord {
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.currentUrl]];
   // NSLog(@"%@",self.currenRq);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)viewWillAppear:(BOOL)animated {
    // [self deleteWebCache];

}
- (void)viewWillDisappear:(BOOL)animated {
    
}

- (void)viewDidDisappear:(BOOL)animated {
    
     [JWCacheURLProtocol cancelListeningNetWorking];
    
    
}

/*
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    self.currentUrl = webView.URL;
    
    NSLog(@"%@",self.currentUrl);
}
*/
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    
    self.currentUrl = webView.URL;
    NSLog(@"%@",self.currentUrl);
}


- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
{

    self.currenRq = navigationAction.request;
    WKFrameInfo *frameInfo = navigationAction.targetFrame;
    if (![frameInfo isMainFrame]) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}

/*  清除所有缓存
- (void)deleteWebCache {
    //allWebsiteDataTypes清除所有缓存
    NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
    
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        
    }];
}
*/




- (void)back {
    [self.webView goBack];
}

@end
