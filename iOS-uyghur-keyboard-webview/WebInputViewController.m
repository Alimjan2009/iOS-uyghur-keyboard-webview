//
//  WebInputViewController.m
//  Dinner
//
//  Created by alimjan on 15/5/4.
//  Copyright (c) 2015年 Alimjan. All rights reserved.
//

#import "WebInputViewController.h"
#import <UyghurSDK_iOS/UyghurSDK_iOS.h>
@interface WebInputViewController ()
{
    __weak IBOutlet UIPlaceHolderTextView *textView;
    UyghurKeyboard *keyboard;
}
@end

@implementation WebInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    keyboard = [[UyghurKeyboard alloc]init];
    [keyboard setTextView:textView];
    [keyboard setIsOneLineMode:YES];
    textView.font = FONTWITHSIZE(14);
    textView.layer.borderColor = [UIColor grayColor].CGColor;
    textView.layer.borderWidth = 1/[UIScreen mainScreen].scale;
    textView.placeholderColor = [UIColor grayColor];
    [keyboard setUyghurKeyboardReturnBlock:^(){
        [self onConfirmClicked:nil];
    }];
    if (self.textHint) {
        textView.placeholder  = self.textHint;
    }else
    textView.placeholder    = @"مەزمۇن كىرگۈزۈڭ...";

    
    if (self.textValue!=nil&&self.textValue.length>0) {
        textView.text = self.textValue;
        textView.lblPlaceHolder.hidden = YES;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onConfirmClicked:(id)sender {
    if (self.block) {
        NSString *str = textView.text;
        if ([str hasPrefix:@"\u202b"] ) {
            str = [str substringFromIndex:1];
        }
        self.block(str);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)onReturn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
