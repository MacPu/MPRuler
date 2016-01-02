//
//  MPRulerScale.h
//  MPRulerDemo
//
//  Created by MacPu on 16/1/2.
//  Copyright © 2016年 www.imxingzhe.com. All rights reserved.
//

#import <UIKit/UIKit.h>

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
