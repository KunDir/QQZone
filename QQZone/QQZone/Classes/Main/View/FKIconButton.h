//
//  FKIconButton.h
//  QQZone
//
//  Created by kun on 15/2/2.
//  Copyright (c) 2015年 kun. All rights reserved.
//  工具栏（KFDock）顶部的头像

#import <UIKit/UIKit.h>

@interface FKIconButton : UIButton
/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape;
@end
