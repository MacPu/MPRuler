//
//  MPRuler.m
//  MPRulerDemo
//
//  Created by MacPu on 16/1/2.
//  Copyright © 2016年 www.imxingzhe.com. All rights reserved.
//

#import "MPRulerView.h"

@interface MPRulerView ()

@property (nonatomic, strong) UIScrollView *mainView;
@property (nonatomic, strong) UIView *contentView;

@end

@implementation MPRulerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    UIScrollView *mainView = [[UIScrollView alloc] init];
    mainView.backgroundColor = [UIColor clearColor];
    [self addSubview:mainView];
    self.mainView = mainView;
    
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor clearColor];
    [mainView addSubview:contentView];
    self.contentView = contentView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect frame = self.frame;
    frame.origin = CGPointZero;
    self.mainView.frame = frame;
    self.mainView.contentSize = frame.size;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 0.5);//线条颜色
    CGContextMoveToPoint(context, 20, 20);
    CGContextAddLineToPoint(context, 20,50);
    CGContextMoveToPoint(context, 40, 20);
    CGContextAddLineToPoint(context, 40, 40);
    CGContextStrokePath(context);
}

@end
