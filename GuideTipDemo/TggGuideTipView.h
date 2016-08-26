//
//  GuideTipView.h
//  GuideTipDemo
//
//  Created by 铁拳科技 on 16/8/26.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TggGuideTipView : UIView


/** 类方法初始化 */
+ (instancetype) guideTipView;

/** 类方法初始化并且弹出 */
+ (instancetype) presentGuideTipView;



/**
 *  增加一个圆形矩形的镂空
 *
 *  @param arcCenter 圆的中心
 *  @param radius    圆的半径
 */
- (void)addCircleMask:(CGPoint)arcCenter
               radius:(CGFloat)radius;



/**
 *  增加一个圆形矩形的镂空
 *
 *  @param maskRect     圆形矩形的Rect
 *  @param cornerRadius 切角的大小
 */
- (void)addRoundedRectMask:(CGRect)maskRect
              cornerRadius:(CGFloat)cornerRadius;





@end
