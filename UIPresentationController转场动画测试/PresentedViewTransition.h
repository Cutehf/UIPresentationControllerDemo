//
//  PresentedViewTransition.h
//  UIPresentationController转场动画测试
//
//  Created by 黄飞 on 16/4/20.
//  Copyright © 2016年 黄飞. All rights reserved.
// 

#import <UIKit/UIKit.h>
@interface PresentedViewTransition : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,assign) BOOL isShow;

@end
