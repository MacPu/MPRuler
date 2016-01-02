//
//  MPRuler.m
//  MPRulerDemo
//
//  Created by MacPu on 16/1/2.
//  Copyright © 2016年 www.imxingzhe.com. All rights reserved.
//

#import "MPRulerView.h"

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
    
    contentView.rulerScales = [self loadData];
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

- (NSArray *)loadData
{
    NSMutableArray *scales = [[NSMutableArray alloc] init];
    if([self.delegate respondsToSelector:@selector(numberOfSectionsInRulerView:)]){
        NSInteger sectionNumber = [self.delegate numberOfSectionsInRulerView:self];
        for(NSInteger section = 0; section < sectionNumber; section ++){
            if([self.delegate respondsToSelector:@selector(rulerView:scaleForSection:)]){
                [scales addObject:[self.delegate rulerView:self scaleForSection:section]];
            }
            
            if([self.delegate respondsToSelector:@selector(rulerView:numberOfItemsInSection:)]){
                NSInteger itemNumber =[self.delegate rulerView:self numberOfItemsInSection:section];
                
                for(NSInteger item = 0;item < itemNumber; item ++){
                    if([self.delegate respondsToSelector:@selector(rulerView:scaleForItemAtIndexPath:)]){
                        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
                        [scales addObject:[self.delegate rulerView:self scaleForItemAtIndexPath:indexPath]];
                    }
                }
            }
        }
    }
    return scales;
}

- (void)reloadData
{
    self.contentView.rulerScales = [self loadData];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

@end
