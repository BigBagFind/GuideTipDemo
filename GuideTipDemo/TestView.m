//
//  GuideTipView.m
//  GuideTipDemo
//
//  Created by 铁拳科技 on 16/8/26.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "TestView.h"


#define kScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight   [[UIScreen mainScreen] bounds].size.height

@implementation TestView




- (void)drawRect:(CGRect)rect {
    //create path
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    // MARK: circlePath
    [bezierPath appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(kScreenWidth / 2, 200) radius:100 startAngle:0 endAngle:2*M_PI clockwise:NO]];
    
    // MARK: roundRectanglePath
    [bezierPath appendPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 300, kScreenWidth / 2, 100) cornerRadius:15] bezierPathByReversingPath]];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.path = bezierPath.CGPath;
    
    [self.layer setMask:shapeLayer];
}

- (void)drawMyRect {
    // 创建路径并获取句柄
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 指定矩形
    CGRect rectangle = CGRectMake(10.0f, 10.0f, 200.0f, 300.0f);
    
    // 将矩形添加到路径中
    CGPathAddRect(path, NULL, rectangle);
    
    // 获取上下文
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    // 将路径添加到上下文
    CGContextAddPath(currentContext, path);
    
    
    // 设置矩形填充色
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
    
    // 矩形边框颜色
    [[UIColor brownColor] setStroke];
    
    // 边框宽度
    CGContextSetLineWidth(currentContext,5.0f);
    
    // 绘制
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    
    // 释放路径
    CGPathRelease(path);
}



@end
