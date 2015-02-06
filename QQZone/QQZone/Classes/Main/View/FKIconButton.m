//
//  FKIconButton.m
//  QQZone
//
//  Created by kun on 15/2/2.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKIconButton.h"
#import "FKCommon.h"

@implementation FKIconButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setImage:[UIImage imageWithName:@"lufy"] forState:UIControlStateNormal];
        [self setTitle:@"测试" forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.imageView.layer.cornerRadius = 10;
    }
    return self;
}

/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape
{
    if(lanscape)
    {
        self.y = 60;
        self.width = self.superview.width * 0.35;
        self.height = self.width + 40;
        self.x = (self.superview.width - self.width) * 0.5;
    }
    else
    {
        self.y = 40;
        self.x = 10;
        self.width = self.superview.width - self.x * 2;
        self.height = self.width;
    }
//    self.width = lanscape ? (FKDockLanscapeW * 0.35) : (FKDockPortaitW);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if(self.width > FKBottomMenuButtonPortraitW)
    {
        CGFloat imageW = self.width;
        CGFloat imageH = imageW;
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
        CGFloat titleX = 0;
        CGFloat titleY = self.width;
        CGFloat titleW = self.width;
        CGFloat titleH = self.height - titleY;
        return CGRectMake(titleX, titleY, titleW, titleH);
    }
    else
    {
        return CGRectZero;
    }
}
@end
