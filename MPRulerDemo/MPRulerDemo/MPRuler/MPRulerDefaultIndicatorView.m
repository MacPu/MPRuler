//
//  MPRulerDefaultIndicatorView.m
//  MPRulerDemo
//
//  Created by MacPu on 16/1/4.
//  Copyright © 2016年 www.imxingzhe.com. All rights reserved.
//

#import "MPRulerDefaultIndicatorView.h"

@implementation MPRulerDefaultIndicatorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGPoint sPoints[3];
    sPoints[0] = CGPointMake(0, 0);
    sPoints[1] = CGPointMake(rect.size.width, 0);
    sPoints[2] = CGPointMake(rect.size.width / 2, rect.size.height);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddLines(context, sPoints, 3);
    CGContextClosePath(context);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextDrawPath(context, kCGPathFillStroke);
    
}

@end
