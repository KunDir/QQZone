//
//  FKDock.m
//  QQZone
//
//  Created by kun on 15/2/1.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKDock.h"
#import "FKIconButton.h"
#import "FKTabBar.h"
#import "FKBottomMenu.h"

@interface FKDock ()

@end

@implementation FKDock

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        // 1.底部菜单
        [self setupBottomMenu];
        
        // 2.头像
        [self setupIconButton];
        
        // 3.选项卡
        [self setupTabBar];
        
        
    }
    return self;
}

/**
 *  头像
 */
- (void)setupIconButton
{
    FKIconButton *iconButton = [[FKIconButton alloc] init];
    [self addSubview:iconButton];
    _iconButton = iconButton;
}

/**
 *  选项卡
 */
- (void)setupTabBar
{
    FKTabBar *tabBar = [[FKTabBar alloc] init];
    tabBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self addSubview:tabBar];
    _tabBar = tabBar;
}

/**
 *  底部菜单
 */
- (void)setupBottomMenu
{
    FKBottomMenu *bottomMenu = [[FKBottomMenu alloc] init];
    bottomMenu.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self addSubview:bottomMenu];
    _bottomMenu = bottomMenu;
}

/**
 *  旋转(调整控件内部的情况)
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape
{
    // 1.底部菜单
    [self.bottomMenu rotate:lanscape];
    
    // 2.设置dock自己的属性
    self.width = self.bottomMenu.width;
    
    // 3.选项卡
    [self.tabBar rotate:lanscape];
    self.tabBar.y = self.bottomMenu.y - self.tabBar.height;
    
    // 4.调整头像
    [self.iconButton rotate:lanscape];
    
    
    
}
@end
