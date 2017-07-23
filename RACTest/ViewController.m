//
//  ViewController.m
//  RACTest
//
//  Created by 李亚军 on 17/7/22.
//  Copyright © 2017年 李亚军. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[self.textField rac_signalForControlEvents:UIControlEventEditingChanged] subscribeNext:^(id x) {
        UITextField *t = (UITextField *)x;
        NSLog(@"=====%@",t.text);
        NSLog(@"----%@",x);
    }];
    
    [[self.textField rac_textSignal] subscribeNext:^(NSString *x) {
        NSLog(@"文本框文字发生了改变：%@",x);
        
        
    }];
    
    RAC(self.label,text) = self.textField.rac_textSignal;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        NSLog(@"tap====++++");
    }];
    [self.view addGestureRecognizer:tap];
    
#pragma mark alertView
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"RAC" message:@"RACTEST" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"other",@"sure", nil];
    [[self rac_signalForSelector:@selector(alertView:clickedButtonAtIndex:) fromProtocol:@protocol(UIAlertViewDelegate)] subscribeNext:^(RACTuple *tuple) {
        NSLog(@"====1%@",tuple.first);
        NSLog(@"====2%@",tuple.second);
        NSLog(@"=====3%@",tuple.third);
    }];
    [alertView show];
    
    [[alertView rac_buttonClickedSignal] subscribeNext:^(id x) {
        NSLog(@"000000000%@",x);
    }];
    
    // 简化
    UIAlertView *alertView2 = [[UIAlertView alloc]initWithTitle:@"RAC" message:@"RACTEST" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"other",@"sure", nil];
    [[alertView2 rac_buttonClickedSignal] subscribeNext:^(id x) {
        NSLog(@"000000000%@",x);
    }];
    [alertView2 show];
    
    #pragma mark 通知
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"postData" object:nil] subscribeNext:^(NSNotification *x) {
        NSLog(@"%@----",x.name);
        NSLog(@"%@====",x.object);
    }];
    
    
}




















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
