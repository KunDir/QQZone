//
//  FKCommon.h
//  QQZone
//
//  Created by kun on 15/2/1.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#ifndef QQZone_FKCommon_h
#define QQZone_FKCommon_h

#import "UIView+FK.h"
#import "UIImage+FK.h"

#define FKColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define FKGlobalBgColor FKColor(55, 55, 55)


// 底部菜单按钮的尺寸
#define FKBottomMenuButtonPortraitW 70.0
#define FKBottomMenuButtonLanscapeW 90.0
#define FKBottomMenuButtonH 70.0

// tabbar按钮的高度
#define FKTabBarButtonH FKBottomMenuButtonH

// dock的宽度
#define FKDockPortaitW FKBottomMenuButtonPortraitW
#define FKDockLanscapeW (FKBottomMenuButtonLanscapeW * 3)

#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#endif
