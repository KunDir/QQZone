//
//  FKTabBar.h
//  QQZone
//
//  Created by kun on 15/2/2.
//  Copyright (c) 2015年 kun. All rights reserved.
//  工具栏（KFDock）中间的选项卡

#import <UIKit/UIKit.h>
@class FKTabBar;
@protocol FKTabBarDelegate <NSObject>

@optional
- (void)tabBar:(FKTabBar *)tabBar didSelectedFrom:(int)from to:(int)to;

@end

@interface FKTabBar : UIView
/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape;

- (void)unselect;

@property (nonatomic, weak) id<FKTabBarDelegate> delegate;
@end
