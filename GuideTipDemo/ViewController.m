//
//  ViewController.m
//  GuideTipDemo
//
//  Created by 铁拳科技 on 16/8/26.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "ViewController.h"
#import "TggGuideTipView.h"
#import "TestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TggGuideTipView *guideView = [TggGuideTipView guideTipView];
    guideView.frame = self.tabBarController.view.bounds;
    [self.tabBarController.view addSubview:guideView];
    
    [guideView addCircleMask:CGPointMake(180, 300) radius:20];
    
    self.view.backgroundColor = [UIColor yellowColor];
}







@end
