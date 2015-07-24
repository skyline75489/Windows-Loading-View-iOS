//
//  ViewController.m
//  MyTestProject
//
//  Created by skyline on 15/7/24.
//  Copyright (c) 2015年 skyline. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arr  = [[NSMutableArray alloc] init];
    
    UIView *containerView = self.view;
    containerView.backgroundColor = [UIColor blackColor];
    
    for (int i=0; i<5; i++) {
        UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(-10, 300, 10, 10)];
        myView.backgroundColor = [UIColor whiteColor];
        myView.layer.cornerRadius = 5;
        [containerView addSubview:myView];
        [self.arr addObject:myView];
    }
    
    self.containerView = containerView;
}

- (void)addLoadingAnimationToView:(UIView *)view beginTimeOffset:(CGFloat) offset {
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
    animationGroup.duration = 5.0;
    animationGroup.repeatCount = INFINITY;
    animationGroup.beginTime = CACurrentMediaTime() + offset;
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGPoint startPoint = CGPointMake(0, view.frame.origin.y);
    CGPoint endPoint = CGPointMake(startPoint.x + 360, startPoint.y);
    [path moveToPoint:startPoint];
    
    [path addLineToPoint:endPoint];
    
    animation.path = path.CGPath;
    //animation.fillMode              = kCAFillModeForwards;
    animation.removedOnCompletion   = YES;
    animation.duration              = 3.0;
    //animation.beginTime = CACurrentMediaTime() + offset;
    animation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.0 :0.47 :1.0 :0.7];
    
    animationGroup.animations = @[animation];
    [view.layer addAnimation:animationGroup forKey:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    for (int i=0; i<5; i++) {
        [self addLoadingAnimationToView:[self.arr objectAtIndex:i] beginTimeOffset:i * 0.28];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
