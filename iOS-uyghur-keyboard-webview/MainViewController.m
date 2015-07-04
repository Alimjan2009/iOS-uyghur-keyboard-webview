//
//  MainViewController.m
//  Dinner
//
//  Created by alimjan on 15/4/30.
//  Copyright (c) 2015年 Alimjan. All rights reserved.
//

#import "MainViewController.h"
#import "WebInputViewController.h"
#import <UyghurSDK_iOS/UyghurSDK_iOS.h>


//#define LOAD_URL @"http://192.168.1.7/mweb/veglist.aspx?sid=75769EB9399A0E892F06B98EE4F6EE1D&tm=150508190209221&id=105"
//#define LOAD_URL @"http://www.mulazim.com/mweb/index.aspx"
//#define LOAD_URL @"http://192.168.1.7/mweb/"
#define LOAD_URL @"http://www.mulazim.com/"

@interface MainViewController ()<UIWebViewDelegate>{

}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    webView.delegate=self;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:LOAD_URL]]];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:filePath]];
}
/**=========================== webView链接 中调用 OC===============================*/
/**webView的代理方法:加载页面有关. 当直接返回为NO时,会调用JS方法
 其中request参数与发送请求有关*/
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
   
    NSString *urlStr = request.URL.absoluteString;
    urlStr = [urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSLog(@"%@",urlStr = [urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] );
    // 格式 neng://loadUrl/blog.csdn.net  协议/方法/网址
    //判断链接中的协议头,如果是neng://, 则进行相关操作
    if ([urlStr hasPrefix:@"almas:"]) {
        //拿到除去协议头的后部
        NSArray *array = [urlStr componentsSeparatedByString:@":"];
        NSString *input_id = [array objectAtIndex:1];
        WebInputViewController *wiVC = [self.storyboard instantiateViewControllerWithIdentifier:@"WebInputViewController"];
        wiVC.textValue = [array objectAtIndex:2];
        wiVC.textHint = [array objectAtIndex:3];
        [wiVC setBlock:^(NSString *result){
            NSString *func =  [NSString stringWithFormat:@"settext(\'%@\',\'%@\')",input_id,result];
            [webView stringByEvaluatingJavaScriptFromString:func];
        }];
        [self presentViewController:wiVC animated:YES completion:nil];
        
        return NO;
    }  
    
    return YES;  
}


@end
