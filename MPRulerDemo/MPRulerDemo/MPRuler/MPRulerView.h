//
//  MPRuler.h
//  MPRulerDemo
//
//  Created by MacPu on 16/1/2.
//  Copyright © 2016年 www.imxingzhe.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPRulerScale.h"

@class MPRulerView;

@protocol MPRulerViewDelegate <NSObject>

- (NSInteger)numberOfItemsInRulerView:(MPRulerView *)rulerView;
- (MPRulerScale *)rulerView:(MPRulerView *)rulerView scaleForItem:(NSInteger)item;

- (void)rulerView:(MPRulerView *)rulerView didChangedIndicatorItem:(NSInteger)item;

@end

@interface MPRulerView : UIView

@property (nonatomic, weak) id<MPRulerViewDelegate> delegate;

@property (nonatomic, assign) BOOL autoAlign;

@property (nonatomic, strong) UIView *indicatorView;

@property (nonatomic, assign) NSInteger currentItemIndex;

- (void)reloadData;

- (void)scrollToItem:(NSInteger)item;

- (void)scrollToItem:(NSInteger)item withAnimate:(BOOL)animate;

@end
