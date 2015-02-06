//
//  FKDock.h
//  QQZone
//
//  Created by kun on 15/2/1.
//  Copyright (c) 2015年 kun. All rights reserved.
//  左边工具栏



#import <UIKit/UIKit.h>
#import "FKCommon.h"
@class FKTabBar, FKIconButton, FKBottomMenu;

@interface FKDock : UIView

/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape;


@property (nonatomic, weak, readonly) FKTabBar *tabBar;
@property (nonatomic, weak, readonly) FKIconButton *iconButton;
@property (nonatomic, weak, readonly) FKBottomMenu *bottomMenu;
@end
