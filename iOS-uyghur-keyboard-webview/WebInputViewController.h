//
//  WebInputViewController.h
//  Dinner
//
//  Created by alimjan on 15/5/4.
//  Copyright (c) 2015年 Alimjan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebInputViewController : UIViewController
typedef void(^onConfirmClick)(NSString *);
@property(nonatomic,strong)onConfirmClick block;
@property(nonatomic,strong)NSString *textHint;
@property(nonatomic,strong)NSString *textValue;

@end
