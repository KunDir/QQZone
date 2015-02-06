//
//  UIImage+FK.h
//  QQZone
//
//  Created by kun on 15/2/1.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FK)

+ (UIImage *)imageWithName:(NSString *)name;

+ (UIImage *)resizedImageWithName:(NSString *)name;

+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
@end
