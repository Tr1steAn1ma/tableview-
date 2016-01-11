//
//  ScreenAdaptation.h
//  tableview展开菜单
//
//  Created by TiAmo_假情绪 on 16/1/11.
//  Copyright © 2016年 TiAmo_假情绪. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#define CGRectMakeEx(x,y,width,height) CGRectMakeAdaptation(x, y, width, height)
#define CGSizeMakeEx(width,height) CGSizeMakeAdaptation(width, height)
#define widthEx(width) widthAdaptation(width)
#define heightEx(height) heightAdaptation(height)
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height


@interface ScreenAdaptation : NSObject

///扩展函数适配Rect
CGRect CGRectMakeAdaptation(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
//扩展适应Size
CGSize CGSizeMakeAdaptation(CGFloat width, CGFloat height);
//适配高度
double heightAdaptation(double height);
//适配宽度
double widthAdaptation(double width);



@end
