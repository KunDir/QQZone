//
//  FKTabBarButton.m
//  QQZone
//
//  Created by kun on 15/2/2.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKTabBarButton.h"
#import "FKCommon.h"

#define FKTabBarButtonLanscapeWRatio 0.4

@implementation FKTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:20];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if(self.width > FKBottomMenuButtonPortraitW)
    {
        CGFloat imageW = self.width * FKTabBarButtonLanscapeWRatio;
        CGFloat imageH = self.height;
        return CGRectMake(0, 0, imageW, imageH);
    }
    else
    {
        return self.bounds;
    }
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    if(self.width > FKBottomMenuButtonPortraitW)
    {
        CGFloat titleX = self.width * FKTabBarButtonLanscapeWRatio;
        CGFloat titleY = 0;
        CGFloat titleW = self.width - titleX;
        CGFloat titleH = self.height;
        return CGRectMake(titleX, titleY, titleW, titleH);
    }
    else
    {
        return CGRectZero;
    }
}
@end
