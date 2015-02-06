//
//  FKTabBar.m
//  QQZone
//
//  Created by kun on 15/2/2.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKTabBar.h"
#import "FKCommon.h"
#import "FKTabBarButton.h"

@interface FKTabBar ()
@property (nonatomic, weak) FKTabBarButton *selectedButton;
@end

@implementation FKTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        // 初始化6个按钮
        [self setupButtonWithIcon:@"tab_bar_feed_icon" title:@"全部动态"];
        [self setupButtonWithIcon:@"tab_bar_passive_feed_icon" title:@"与我相关"];
        [self setupButtonWithIcon:@"tab_bar_pic_wall_icon" title:@"照片墙"];
        [self setupButtonWithIcon:@"tab_bar_e_album_icon" title:@"电子相框"];
        [self setupButtonWithIcon:@"tab_bar_friend_icon" title:@"好友"];
        [self setupButtonWithIcon:@"tab_bar_e_more_icon" title:@"更多"];
    }
    return self;
}

- (void)setupButtonWithIcon:(NSString *)icon title:(NSString *)title
{
    FKTabBarButton *button = [[FKTabBarButton alloc] init];
    
    button.tag = self.subviews.count;
    
    [button setImage:[UIImage imageWithName:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage resizedImageWithName:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
}

- (void)buttonClick:(FKTabBarButton *)button
{
    if([self.delegate respondsToSelector:@selector(tabBar:didSelectedFrom:to:)])
    {
        [self.delegate tabBar:self didSelectedFrom:self.selectedButton.tag to:button.tag];
    }
    
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
}

/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape
{
    int count = self.subviews.count;
    
    self.width = self.superview.width;
    
    self.height = FKBottomMenuButtonH * count;
    
    for(int index = 0; index < count; index++)
    {
        FKTabBarButton *button = self.subviews[index];
        button.width = self.width;
        button.height = FKTabBarButtonH;
        button.x = 0;
        button.y = index * button.height;
    }
}

- (void)unselect
{
    self.selectedButton.selected = NO;
}
@end
