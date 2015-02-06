//
//  FKBottomMenu.m
//  QQZone
//
//  Created by kun on 15/2/2.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKBottomMenu.h"
#import "FKCommon.h"

@implementation FKBottomMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        // 初始化3个按钮
        [self setupButtonWithIcon:@"tabbar_mood" tag:FKBottomMenuButtonMood];
        [self setupButtonWithIcon:@"tabbar_photo" tag:FKBottomMenuButtonPhoto];
        [self setupButtonWithIcon:@"tabbar_blog" tag:FKBottomMenuButtonBlog];
    }
    return self;
}
/**
 *  创建一个按钮
 *
 *  @param icon 按钮内部的图标
 */
- (void)setupButtonWithIcon:(NSString *)icon tag:(FKBottomMenuButtonType)tag
{
    UIButton *button = [[UIButton alloc] init];
    button.tag = tag;
    [button setImage:[UIImage imageWithName:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage resizedImageWithName:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
}

- (void)buttonClick:(UIButton *)button
{
    if([self.delegate respondsToSelector:@selector(bottomMenu:didClickButton:)])
    {
        [self.delegate bottomMenu:self didClickButton:button.tag];
    }
}

/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape
{
    int count = self.subviews.count;
    if(lanscape)
    {
        self.width = FKBottomMenuButtonLanscapeW * count;
        self.height = FKBottomMenuButtonH;
        
        for(int index = 0; index < count; index++)
        {
            UIButton *button = self.subviews[index];
            button.x = index * FKBottomMenuButtonLanscapeW;
            button.y = 0;
            button.width = FKBottomMenuButtonLanscapeW;
            button.height = FKBottomMenuButtonH;
        }
    }
    else
    {
        self.width = FKBottomMenuButtonPortraitW;
        self.height = FKBottomMenuButtonH * count;
        
        for(int index = 0; index < count; index++)
        {
            UIButton *button = self.subviews[index];
            button.x = 0;
            button.y = index * FKBottomMenuButtonH;
            button.width = FKBottomMenuButtonPortraitW;
            button.height = FKBottomMenuButtonH;
        }
    }
    self.y = self.superview.height - self.height;
}
@end
