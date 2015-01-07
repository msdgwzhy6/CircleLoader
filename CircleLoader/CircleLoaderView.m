//
//  CircleLoaderView.m
//  Test
//
//  Created by xueying on 15/1/7.
//  Copyright (c) 2015年 Waitur Corporation. All rights reserved.
//

#import "CircleLoaderView.h"

@interface CircleLoaderView ()
@property (nonatomic, strong) CAShapeLayer *backgroundLayer;
@end
@implementation CircleLoaderView

- (void)awakeFromNib {
    [self setup];
    [self startAnimation];
}

- (void)setup {
    self.backgroundColor = [UIColor clearColor];
    self.backgroundLayer = [CAShapeLayer layer];
    _backgroundLayer.strokeColor = [UIColor colorWithRed:0.129 green:0.455 blue:0.627 alpha:1.0].CGColor;
    _backgroundLayer.fillColor = self.backgroundColor.CGColor;
    _backgroundLayer.lineCap = kCALineCapRound;
    _backgroundLayer.lineWidth = 1;
    [self.layer addSublayer:_backgroundLayer];
}

- (void)startAnimation {
    CGFloat startAngle = - ((float)M_PI / 2);
    CGFloat endAngle = (1.8f * (float)M_PI) + startAngle;
    
    UIBezierPath *processBackgroundPath = [UIBezierPath bezierPath];
    processBackgroundPath.lineWidth = 1;
    [processBackgroundPath addArcWithCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)
                                     radius:(self.bounds.size.width - 1)/2
                                 startAngle:startAngle
                                   endAngle:endAngle
                                  clockwise:YES];
    _backgroundLayer.path = processBackgroundPath.CGPath;
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
    rotationAnimation.duration = 1;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    [_backgroundLayer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)drawRect:(CGRect)rect {
    _backgroundLayer.frame = self.bounds;
}

@end
