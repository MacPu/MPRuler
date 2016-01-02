//
//  MPRuler.m
//  MPRulerDemo
//
//  Created by MacPu on 16/1/2.
//  Copyright © 2016年 www.imxingzhe.com. All rights reserved.
//

#import "MPRulerView.h"

@interface MPRulerScale : NSObject

@property (nonatomic, copy) NSString *scaleValue;
@property (nonatomic, strong) UIColor *scaleValueColor;
@property (nonatomic, strong) UIFont *scaleValueFont;
@property (nonatomic, assign) UIOffset scaleValueOffset;

@property (nonatomic, strong) UIColor *scaleColor;
@property (nonatomic, assign) CGFloat scaleWidth;
@property (nonatomic, assign) CGFloat scaleHeight;
@property (nonatomic, assign) UIEdgeInsets scaleMargin;

@end

@implementation MPRulerScale

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.scaleColor = [UIColor blackColor];
        self.scaleHeight = 10;
        self.scaleWidth = 2;
        self.scaleMargin = UIEdgeInsetsMake(0, 3, 0, 3);
        
        self.scaleValueColor = [UIColor greenColor];
        self.scaleValueFont = [UIFont systemFontOfSize:10];
        self.scaleValueOffset = UIOffsetMake(0, 5);
    }
    return self;
}

@end

@interface MPRulerContentView : UIView

@property (nonatomic, strong) NSArray<MPRulerScale *> *rulerScales;

@end

@implementation MPRulerContentView

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
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGFloat x = 0;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    for(MPRulerScale *scale in self.rulerScales){
        CGContextSetLineWidth(context, scale.scaleWidth);
        CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha =0.0;
        [scale.scaleColor getRed:&red green:&green blue:&blue alpha:&alpha];
        CGContextSetRGBStrokeColor(context, red, green, blue, alpha);
        CGContextMoveToPoint(context, x + scale.scaleMargin.left, scale.scaleMargin.top);
        CGContextAddLineToPoint(context, x + scale.scaleMargin.left, scale.scaleMargin.top + scale.scaleHeight);
        CGContextStrokePath(context);
        
        if(scale.scaleValue){
            NSDictionary *attributes = @{NSForegroundColorAttributeName:scale.scaleValueColor,
                                         NSFontAttributeName:scale.scaleValueFont};
            CGSize valueSize = [scale.scaleValue sizeWithAttributes:attributes];
            CGRect rect = CGRectMake(x + scale.scaleMargin.left + scale.scaleValueOffset.horizontal + (scale.scaleWidth - valueSize.width) / 2,
                                     scale.scaleMargin.top + scale.scaleHeight + scale.scaleValueOffset.vertical,
                                     valueSize.width, valueSize.height);
            [scale.scaleValue drawInRect:rect withAttributes:attributes];
            
        }
        x += scale.scaleMargin.left + scale.scaleMargin.right + scale.scaleWidth;
    }
    
}

- (void)sizeToFit
{
    [super sizeToFit];
    CGFloat x = 0;
    for(MPRulerScale *scale in self.rulerScales){
        x += scale.scaleMargin.left + scale.scaleMargin.right + scale.scaleWidth;
    }
    
    CGRect frame = self.frame;
    frame.size.width = x;
    self.frame = frame;
}

@end

@interface MPRulerView ()

@property (nonatomic, strong) UIScrollView *mainView;
@property (nonatomic, strong) MPRulerContentView *contentView;

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
    mainView.alwaysBounceHorizontal = YES;
    [self addSubview:mainView];
    self.mainView = mainView;
    
    MPRulerContentView *contentView = [[MPRulerContentView alloc] init];
    [mainView addSubview:contentView];
    self.contentView = contentView;
    
    NSMutableArray *scales = [[NSMutableArray alloc] init];
    for(NSInteger i = 0; i< 100;i++){
        MPRulerScale *scale = [[MPRulerScale alloc] init];
        scale.scaleMargin = UIEdgeInsetsMake(5, 10, 0, 10);
        [scales addObject:scale];
        if(i % 3 == 0){
            scale.scaleHeight = 15;
            scale.scaleColor = [UIColor blueColor];
            scale.scaleValue = [NSString stringWithFormat:@"%ld",1970 + i / 3];
        }
    }
    contentView.rulerScales = scales;
    
    self.backgroundColor = [UIColor orangeColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect frame = self.frame;
    frame.origin = CGPointZero;
    self.mainView.frame = frame;
    self.contentView.frame = frame;
    [self.contentView sizeToFit];
    
    CGSize contentSize = frame.size;
    contentSize.width = MAX(contentSize.width, self.contentView.frame.size.width);
    self.mainView.contentSize = contentSize;
}

@end
