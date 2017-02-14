//
//  PresentedViewTransition.m
//  UIPresentationController转场动画测试
//
//  Created by 黄飞 on 16/4/20.
//  Copyright © 2016年 黄飞. All rights reserved.
//

#import "PresentedViewTransition.h"

@implementation PresentedViewTransition

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    if (self.isShow) {
        
        
        UIView *containerView=[transitionContext containerView];
        
        /**
         *  UITransitionContextFromViewControllerKey    原来的视图
         *  UITransitionContextToViewControllerKey      将要展示的视图
         *  presentedView 将要展示的视图
         *  fromView 展示的视图的父视图
         */
        UIView *presentedView=[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
        UIView *fromView=[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
        
        //这句话添加视图，不可省去
        //这里有个重要的概念containerView，如果要对视图做转场动画，视图就必须要加入containerView中才能进行，可以理解containerView管理者所有做转场动画的视图
        [containerView addSubview:presentedView];
        //不能加下面这句话
        //    [containerView addSubview:fromView];
        
        //设置展示的视图的初始位置
        
        
        
        /**
            一个带有弹簧效果的动画
         
         */
        presentedView.transform=CGAffineTransformTranslate(CGAffineTransformIdentity, 0, -containerView.frame.size.height);
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0
             usingSpringWithDamping:0.6   //表示动画的弹簧的弹性大小，值越小弹簧的弹性越大，为1时表示无弹性
              initialSpringVelocity:0.3   //速度
                            options:UIViewAnimationOptionLayoutSubviews
                         animations:^{
                             presentedView.transform=CGAffineTransformIdentity;
                             fromView.transform = CGAffineTransformMakeScale(0.85, 0.85);
                         } completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
    }else{
        
        UIView *containerView=[transitionContext containerView];
        /**
         *  UITransitionContextFromViewControllerKey    原来的视图
         *  UITransitionContextToViewControllerKey      将要展示的视图
         *  不需要添加到视图中，已经在视图中
         */
        UIView *fromView=[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
        UIView *presentedView=[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
        
        
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0
             usingSpringWithDamping:0.6   //表示动画的弹簧的弹性大小，值越小弹簧的弹性越大，为1时表示无弹性
              initialSpringVelocity:0.3   //速度
                            options:UIViewAnimationOptionLayoutSubviews
                         animations:^{
                             
                             fromView.transform=CGAffineTransformIdentity;
                             
                             presentedView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, containerView.frame.size.height);
                             
                         } completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
        
    }
}
@end
