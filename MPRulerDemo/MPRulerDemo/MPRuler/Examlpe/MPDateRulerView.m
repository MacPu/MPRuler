//
//  MPDateRulerView.m
//  MPRulerDemo
//
//  Created by MacPu on 16/1/3.
//  Copyright © 2016年 www.imxingzhe.com. All rights reserved.
//

#import "MPDateRulerView.h"

@interface MPDateRulerView() <MPRulerViewDelegate>

@end

@implementation MPDateRulerView

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
    self.delegate = self;
    self.autoAlign = YES;
    self.backgroundColor = [UIColor orangeColor];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self reloadData];
}

#pragma mark - MPRulerViewDelegate

- (NSInteger)numberOfItemsInRulerView:(MPRulerView *)rulerView
{
    return 50 * 12;
}

- (MPRulerScale *)rulerView:(MPRulerView *)rulerView scaleForItem:(NSInteger)item
{
    MPRulerScale *itemScale = [[MPRulerScale alloc] init];
    if(item % 12 == 0){
        itemScale.scaleColor = [UIColor whiteColor];
        itemScale.scaleWidth = 3;
        itemScale.scaleHeight = 15;
        itemScale.scaleMargin = UIEdgeInsetsMake(1, 3, 0, 3);
        itemScale.scaleValue = [NSString stringWithFormat:@"%ld",1970 + item / 12];
        itemScale.scaleValueColor = [UIColor whiteColor];
        
        if(item ==0){
            itemScale.scaleMargin = UIEdgeInsetsMake(1, (CGRectGetWidth(self.frame) - itemScale.scaleWidth) / 2, 0, 3);
        }
    }
    else{
        itemScale.scaleColor = [UIColor whiteColor];
        itemScale.scaleWidth = 1.5;
        itemScale.scaleHeight = 5;
        itemScale.scaleMargin = UIEdgeInsetsMake(1, 3, 0, 3);
        if(item == ([self numberOfItemsInRulerView:rulerView] - 1)){
            itemScale.scaleMargin = UIEdgeInsetsMake(1, 3, 0, (CGRectGetWidth(self.frame) - itemScale.scaleWidth) / 2);
        }
    }
    return itemScale;
}

- (void)rulerView:(MPRulerView *)rulerView didChangedIndicatorItem:(NSInteger)item
{
    if(_dataChangedBlock){
        _dataChangedBlock(1970 + item / 12,item % 12 + 1);
    }
}

@end
