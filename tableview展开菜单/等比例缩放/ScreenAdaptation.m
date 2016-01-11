//
//  ScreenAdaptation.m
//  tableview展开菜单
//
//  Created by TiAmo_假情绪 on 16/1/11.
//  Copyright © 2016年 TiAmo_假情绪. All rights reserved.
//

#import "ScreenAdaptation.h"

@implementation ScreenAdaptation

static double autoSizeScaleX;
static double autoSizeScaleY;
//此方法在类加载的时候执行
+ (void)load;
{
    //NSLog(@"ZJScreenAdaptation load");
    
    //获取屏幕大小
    CGSize size = [[UIScreen mainScreen] bounds].size;
    
    if (ScreenHeight == 480) {
        autoSizeScaleX = size.width/375;
        autoSizeScaleY = size.width/375;
    }
    else {
        autoSizeScaleX = size.width/375;
        autoSizeScaleY = size.height/667;
    }
}

CGRect CGRectMakeAdaptation(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    CGRect rect;
    rect.origin.x = x * autoSizeScaleX;
    rect.origin.y = y * autoSizeScaleY;
    rect.size.width = width * autoSizeScaleX;
    rect.size.height = height * autoSizeScaleY;
    return rect;
}
CGSize CGSizeMakeAdaptation(CGFloat width, CGFloat height)
{
    CGSize size;
    size.width = autoSizeScaleX * width;
    size.height = autoSizeScaleY * height;
    return size;
}
//适配高度
double heightAdaptation(double height)
{
    return height * autoSizeScaleY;
}
//适配宽度
double widthAdaptation(double width)
{
    return width * autoSizeScaleX;
}

@end
