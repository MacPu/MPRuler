//
//  MPDateRulerView.h
//  MPRulerDemo
//
//  Created by MacPu on 16/1/3.
//  Copyright © 2016年 www.imxingzhe.com. All rights reserved.
//

#import "MPRulerView.h"

typedef void(^MPDataRulerViewDataChangedBlock)(NSInteger year, NSInteger month);

@interface MPDateRulerView : MPRulerView

@property (nonatomic, copy) MPDataRulerViewDataChangedBlock dataChangedBlock;

@end
