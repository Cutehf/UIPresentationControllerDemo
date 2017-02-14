//
//  ViewController.m
//  UIPresentationController转场动画测试
//
//  Created by 黄飞 on 16/4/19.
//  Copyright © 2016年 黄飞. All rights reserved.
//

#import "ViewController.h"
#import "PresentedViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(btnMenthod) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)btnMenthod
{
    NSLog(@"按钮点击了");
    PresentedViewController *pre = [PresentedViewController new];
    [self presentViewController:pre animated:true completion:nil];
    
}

@end
