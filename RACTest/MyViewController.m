//
//  MyViewController.m
//  RACTest
//
//  Created by 李亚军 on 17/7/22.
//  Copyright © 2017年 李亚军. All rights reserved.
//

#import "MyViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>


@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *dataArr = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"postData" object:dataArr];
    
    
    #pragma mark scrollView
    UIScrollView *scrolView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 200, 400)];
    scrolView.contentSize = CGSizeMake(200, 800);
    scrolView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:scrolView];
    [RACObserve(scrolView, contentOffset) subscribeNext:^(id x) {
        NSLog(@"success--%@",x);
    }];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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

@end
