//
//  PopoverPresentationController.m
//  UIPresentationController转场动画测试
//
//  Created by 黄飞 on 16/4/19.
//  Copyright © 2016年 黄飞. All rights reserved.
//

#import "PopoverPresentationController.h"

@implementation PopoverPresentationController
{
    /**
     *  蒙版
     */
     UIView *dimmingView;
}


//初始化方法，可以做一些初始化的操作，这里没做任何操作
- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{

    if(self=[super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController]){
    
        
    }
    return self;
}

//在呈现过渡即将开始的时候被调用的
- (void)presentationTransitionWillBegin
{
    
    //初始化蒙版
    dimmingView = [[UIView alloc] init];
    dimmingView.backgroundColor = [UIColor redColor];
    dimmingView.alpha = 0.0;
    dimmingView.frame = self.containerView.bounds;
    [self.containerView addSubview:dimmingView];
    

    //在展示视图的动画内做的操作
    id<UIViewControllerTransitionCoordinator> coordinator = self.presentingViewController.transitionCoordinator;
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        dimmingView.alpha = 0.5;
    } completion:nil];
}

//在呈现过渡结束时被调用的
- (void)presentationTransitionDidEnd:(BOOL)completed
{
    //如果没有结束就将视图移除
    if(!completed){
        [dimmingView removeFromSuperview];
    }
}

//在退出过渡即将开始的时候被调用的
- (void)dismissalTransitionWillBegin
{
    id<UIViewControllerTransitionCoordinator> coordinator = self.presentingViewController.transitionCoordinator;
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        dimmingView.alpha = 0.0;
    } completion:nil];
}

//在退出的过渡结束时被调用的
- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    if(completed){
        [dimmingView removeFromSuperview];
    }
}

//呈现出的视图的frame
- (CGRect)frameOfPresentedViewInContainerView
{
    return CGRectMake((self.containerView.frame.size.width-300)/2, (self.containerView.frame.size.height-300)/2, 300.f, 300);
}

//加载子视图的可以进行相关的操作
- (void)containerViewWillLayoutSubviews
{
    //设置展示视图的frame
    self.presentedView.frame=[self frameOfPresentedViewInContainerView];
    self.presentedView.backgroundColor=[UIColor greenColor];
    self.presentedView.layer.cornerRadius = 20.f;
    self.presentedView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.presentedView.layer.shadowOffset = CGSizeMake(0, 10);
    self.presentedView.layer.shadowRadius = 10;
    self.presentedView.layer.shadowOpacity = 0.5;

}

@end
