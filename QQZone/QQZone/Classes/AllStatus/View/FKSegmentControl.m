//
//  FKSegmentControl.m
//  QQZone
//
//  Created by kun on 15/2/4.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKSegmentControl.h"
#import "FKCommon.h"
#import "FKSegmentButton.h"

@interface FKSegmentControl ()
@property (nonatomic, weak) FKSegmentButton *selectedButton;
@end

@implementation FKSegmentControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        
    }
    return self;
}

- (void)setItems:(NSArray *)items
{
    _items = items;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    int count = items.count;
    for(int i = 0; i < count; i++)
    {
        FKSegmentButton *button = [[FKSegmentButton alloc] init];
        button.tag = i;
        
        [button setTitle:items[i] forState:UIControlStateNormal];
        NSString *bgName = nil;
        NSString *selectedName = nil;
        if(i == 0)
        {
            bgName = @"SegmentedControl_Left_Normal";
            selectedName = @"SegmentedControl_Left_Selected";
        }
        else if (i == count - 1)
        {
            bgName = @"SegmentedControl_Right_Normal";
            selectedName = @"SegmentedControl_Right_Selected";
        }
        else
        {
            bgName = @"SegmentedControl_Normal";
            selectedName = @"SegmentedControl_Selected";
        }
        [button setBackgroundImage:[UIImage resizedImageWithName:bgName] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage resizedImageWithName:selectedName] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:button];
    }
}

- (void)buttonClick:(FKSegmentButton *)button
{
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = self.subviews.count;
    CGFloat buttonW = self.width / count;
    CGFloat buttonH = self.height;
    for(int i = 0; i < count; i++)
    {
        FKSegmentButton *button = self.subviews[i];
        button.width = buttonW;
        button.height = buttonH;
        button.y = 0;
        button.x = i * buttonW;
    }
}

- (void)setSelectedSegmentIndex:(int)selectedSegmentIndex
{
    int count = self.items.count;
    if(selectedSegmentIndex < 0 || selectedSegmentIndex >= count) return;
    
    FKSegmentButton *segment = self.subviews[selectedSegmentIndex];
    
    [self buttonClick:segment];
}

- (int)selectedSegmentIndex
{
    return self.selectedButton.tag;
}
@end
