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


- (NSInteger)numberOfSectionsInRulerView:(MPRulerView *)rulerView;

- (NSInteger)rulerView:(MPRulerView *)rulerView numberOfItemsInSection:(NSInteger)section;

- (MPRulerScale *)rulerView:(MPRulerView *)rulerView scaleForItemAtIndexPath:(NSIndexPath *)indexPath;
- (MPRulerScale *)rulerView:(MPRulerView *)rulerView scaleForSection:(NSInteger)section;

@end

@interface MPRulerView : UIView

@property (nonatomic, weak) id<MPRulerViewDelegate> delegate;

- (void)reloadData;

@end
