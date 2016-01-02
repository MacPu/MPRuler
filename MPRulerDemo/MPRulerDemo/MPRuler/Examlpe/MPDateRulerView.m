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
    self.backgroundColor = [UIColor orangeColor];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self reloadData];
}

#pragma mark - MPRulerViewDelegate

- (NSInteger)numberOfSectionsInRulerView:(MPRulerView *)rulerView
{
    return 50;
}

- (NSInteger)rulerView:(MPRulerView *)rulerView numberOfItemsInSection:(NSInteger)section
{
    return 11;
}

- (MPRulerScale *)rulerView:(MPRulerView *)rulerView scaleForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MPRulerScale *itemScale = [[MPRulerScale alloc] init];
    itemScale.scaleColor = [UIColor whiteColor];
    itemScale.scaleWidth = 1.5;
    itemScale.scaleHeight = 5;
    itemScale.scaleMargin = UIEdgeInsetsMake(1, 3, 0, 3);
    if(indexPath.section == 49 && indexPath.item == 10){
        itemScale.scaleMargin = UIEdgeInsetsMake(1, 3, 0, (CGRectGetWidth(self.frame) - itemScale.scaleWidth) / 2);
    }
    
    
    return itemScale;
}

- (MPRulerScale *)rulerView:(MPRulerView *)rulerView scaleForSection:(NSInteger)section
{
    MPRulerScale *sectionScale = [[MPRulerScale alloc] init];
    sectionScale.scaleColor = [UIColor whiteColor];
    sectionScale.scaleWidth = 3;
    sectionScale.scaleHeight = 15;
    sectionScale.scaleMargin = UIEdgeInsetsMake(1, 3, 0, 3);
    sectionScale.scaleValue = [NSString stringWithFormat:@"%ld",1970+section];
    sectionScale.scaleValueColor = [UIColor whiteColor];
    
    if(section ==0){
        sectionScale.scaleMargin = UIEdgeInsetsMake(1, (CGRectGetWidth(self.frame) - sectionScale.scaleWidth) / 2, 0, 3);
    }
    return sectionScale;
}

@end
