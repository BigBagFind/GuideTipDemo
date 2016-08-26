//
//  GuideTipView.m
//  GuideTipDemo
//
//  Created by 铁拳科技 on 16/8/26.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "TggGuideTipView.h"


#define kScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight   [[UIScreen mainScreen] bounds].size.height

@implementation TggGuideTipView {
    id _target;
    SEL _action;
}


/** 类方法初始化并且弹出 */
+ (instancetype) presentGuideTipView {
    TggGuideTipView *guideView = [TggGuideTipView guideTipView];
    [[UIApplication sharedApplication].keyWindow addSubview:guideView];
    return guideView;
}

/** 类方法初始化 */
+ (instancetype)guideTipView {
    TggGuideTipView *guideView = [[TggGuideTipView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    guideView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    return guideView;
}

- (void)addTapTarget:(id)target action:(SEL)action {
    if (target == _target) {
        return;
    }
    _target = target;
    _action = action;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (_target) {
        if ([_target respondsToSelector:_action]) {
            [_target performSelector:_action withObject:self afterDelay:0.0];
        }
    }
}

/** 增加一个圆形矩形的镂空 */
- (void)addRoundedRectMask:(CGRect)maskRect
              cornerRadius:(CGFloat)cornerRadius {
    // 创建贝塞尔路径
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    // 镂空层矩形路径
    [bezierPath appendPath:[[UIBezierPath bezierPathWithRoundedRect:maskRect cornerRadius:cornerRadius] bezierPathByReversingPath]];
    // 创建图层
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezierPath.CGPath;
    [self.layer setMask:shapeLayer];
}

/** 增加一个圆形的镂空 */
- (void)addCircleMask:(CGPoint)arcCenter
               radius:(CGFloat)radius {
    // 创建贝塞尔路径
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    // 镂空层圆形路径
    [bezierPath appendPath:[UIBezierPath bezierPathWithArcCenter:arcCenter radius:radius startAngle:0 endAngle:2 * M_PI clockwise:NO]];
    // 创建图层
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezierPath.CGPath;
    [self.layer setMask:shapeLayer];
}







@end
