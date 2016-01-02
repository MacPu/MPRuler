//
//  MPRulerScale.m
//  MPRulerDemo
//
//  Created by MacPu on 16/1/2.
//  Copyright © 2016年 www.imxingzhe.com. All rights reserved.
//

#import "MPRulerScale.h"


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