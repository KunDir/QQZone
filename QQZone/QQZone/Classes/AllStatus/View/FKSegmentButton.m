//
//  FKSegmentButton.m
//  QQZone
//
//  Created by kun on 15/2/4.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKSegmentButton.h"

@implementation FKSegmentButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}
@end
