//
//  FKBottomMenu.h
//  QQZone
//
//  Created by kun on 15/2/2.
//  Copyright (c) 2015年 kun. All rights reserved.
//  工具栏（KFDock）底部的菜单

#import <UIKit/UIKit.h>
@class FKBottomMenu;
typedef enum{
    FKBottomMenuButtonMood,
    FKBottomMenuButtonPhoto,
    FKBottomMenuButtonBlog
}FKBottomMenuButtonType;

@protocol FKBottomMenuDelegate <NSObject>
@optional
- (void)bottomMenu:(FKBottomMenu *)bottomMenu didClickButton:(FKBottomMenuButtonType)buttonType;

@end

@interface FKBottomMenu : UIView
/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape;

@property (nonatomic, weak) id <FKBottomMenuDelegate> delegate;
@end
