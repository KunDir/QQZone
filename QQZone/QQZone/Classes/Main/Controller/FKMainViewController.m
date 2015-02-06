//
//  FKMainViewController.m
//  QQZone
//
//  Created by kun on 15/2/1.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKMainViewController.h"
#import "FKDock.h"
#import "FKCommon.h"
#import "FKTabBar.h"
#import "FKIconButton.h"
#import "FKAllStatusViewController.h"
#import "FKNavigationController.h"
#import "FKBottomMenu.h"
#import "FKComposeViewController.h"

#define FKRandomColor [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0]
#define FKContentViewW 680

@class FKDock;

@interface FKMainViewController() <FKTabBarDelegate, FKBottomMenuDelegate>
@property (nonatomic, weak) FKDock *dock;
@property (nonatomic, weak) UIView *contentView;
@end

@implementation FKMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupDock];
    
    [self setupContentView];
    
    [self setupChildViewControllers];
    
    [self iconClick];
}

- (void)setupDock
{
    self.view.backgroundColor = FKGlobalBgColor;
    
    // 添加Dock
    FKDock *dock = [[FKDock alloc] init];
#warning 一定要添加
    dock.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    //    dock.frame = CGRectMake(0, 0, 0, self.view.height);
    dock.height = self.view.height;
    [self.view addSubview:dock];
    self.dock = dock;
    
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0.0];
    
    self.dock.tabBar.delegate = self;
    
    [self.dock.iconButton addTarget:self action:@selector(iconClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.dock.bottomMenu.delegate = self;
}

#pragma mark - FKBottomMenuButtonDelegate
- (void)bottomMenu:(FKBottomMenu *)bottomMenu didClickButton:(FKBottomMenuButtonType)buttonType
{
    switch (buttonType) {
        case FKBottomMenuButtonMood:
        {
            FKComposeViewController *compose = [[FKComposeViewController alloc] init];
            FKNavigationController *nav = [[FKNavigationController alloc] initWithRootViewController:compose];
            nav.modalPresentationStyle = UIModalPresentationPageSheet;
            [self presentViewController:nav animated:YES completion:nil];
            break;
        }
        case FKBottomMenuButtonPhoto:
            
            break;
        case FKBottomMenuButtonBlog:
            
            break;
            
        default:
            break;
    }
}

- (void)iconClick
{
    int count = self.childViewControllers.count;
    int index = count - 1;
    int from = 0;
    for(int i = 0; i < count; i++)
    {
        UIViewController *vc = self.childViewControllers[i];
        if(vc.view.superview)
        {
            from = i;
            break;
        }
    }
    [self tabBar:nil didSelectedFrom:from to:index];
    
    [self.dock.tabBar unselect];
}

- (void)setupContentView
{
    UIView *contentView = [[UIView alloc] init];
    contentView.width = FKContentViewW;
    contentView.height = self.view.height;
    contentView.x = self.dock.width;
    contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:contentView];
    
    self.contentView = contentView;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragContentView:)];
    [self.contentView addGestureRecognizer:pan];
}

- (void)dragContentView:(UIPanGestureRecognizer *)pan
{
    if(pan.state == UIGestureRecognizerStateEnded ||
       pan.state == UIGestureRecognizerStateCancelled)
    {
        [UIView animateWithDuration:0.25 animations:^{
            
            pan.view.transform = CGAffineTransformIdentity;
        }];
    }
    else
    {
        CGPoint transform = [pan translationInView:pan.view];
        pan.view.transform = CGAffineTransformMakeTranslation(transform.x * 0.3, 0);
    }
}

- (void)setupChildViewControllers
{
    FKAllStatusViewController *allStatus = [[FKAllStatusViewController alloc] init];
    [self setupOneChildViewController:allStatus];
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    [self setupOneChildViewController:vc1];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    [self setupOneChildViewController:vc2];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    [self setupOneChildViewController:vc3];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    [self setupOneChildViewController:vc4];
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    [self setupOneChildViewController:vc5];
    
    UIViewController *home = [[UIViewController alloc] init];
    [self setupOneChildViewController:home];
}

- (void)setupOneChildViewController:(UIViewController *)vc
{
    FKNavigationController *nav = [[FKNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

/**
 *  当屏幕即将旋转的时候调用
 *
 *  @param toInterfaceOrientation 旋转后的方向
 *  @param duration               旋转动画花费的时间
 */
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [UIView animateWithDuration:duration animations:^{
        
        [self.dock rotate:UIInterfaceOrientationIsLandscape(toInterfaceOrientation)];
        
        self.contentView.x = self.dock.width;
    }];
}


#pragma mark - FKTabBarDelegate
- (void)tabBar:(FKTabBar *)tabBar didSelectedFrom:(int)from to:(int)to
{
    UIViewController *newVc = self.childViewControllers[to];
    if(newVc.view.superview) return;
    
    newVc.view.frame = self.contentView.bounds;
    
    UIViewController *rootVc = [newVc.childViewControllers firstObject];
    rootVc.view.backgroundColor = FKColor(212, 212, 212);
    
    //    [self.contentView addSubview:newVc.view];
    
    UIViewController *oldVc = self.childViewControllers[from];
//    [oldVc.view removeFromSuperview];
    
    UIViewController *last = [self.childViewControllers lastObject];
    if(last.view.superview)
    {
        oldVc = last;
    }
    else
    {
        oldVc = self.childViewControllers[from];
    }
    
    if(oldVc.view.superview)
    {
        [UIView transitionFromView:oldVc.view toView:newVc.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
    }
    else
    {
        [self.contentView addSubview:newVc.view];
    }
}

@end
