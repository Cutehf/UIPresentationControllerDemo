//
//  PresentedViewController.m
//  UIPresentationController转场动画测试
//
//  Created by 黄飞 on 16/4/20.
//  Copyright © 2016年 黄飞. All rights reserved.
//

#import "PresentedViewController.h"
#import "PresentedViewTransition.h"
#import "PopoverPresentationController.h"

@interface PresentedViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
    btn.backgroundColor=[UIColor yellowColor];
    [btn addTarget:self action:@selector(btnMenthod) forControlEvents:UIControlEventTouchUpInside];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        if ([self respondsToSelector:@selector(setTransitioningDelegate:)]) {
            self.modalPresentationStyle=UIModalPresentationCustom;
            self.transitioningDelegate=self;
        }
        
    }
    return self;
}

//动画的代理方法
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    PresentedViewTransition *transition = [[PresentedViewTransition alloc]init];
    transition.isShow=YES;
    
    return transition;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    PresentedViewTransition *transition = [[PresentedViewTransition alloc]init];
    transition.isShow=NO;
    
    return transition;
}

//展现视图的代理方法
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    return [[PopoverPresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    
}

-(void)btnMenthod{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
