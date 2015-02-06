//
//  FKNavigationController.m
//  QQZone
//
//  Created by kun on 15/2/4.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKNavigationController.h"
#import "FKCommon.h"

@implementation FKNavigationController

+ (void)initialize
{
    if(!iOS7)
    {
        UINavigationBar *bar = [UINavigationBar appearance];
        [bar setBackgroundImage:[UIImage resizedImageWithName:@"NavigationBar_Background.png"] forBarMetrics:UIBarMetricsDefault];
    }
}
@end
