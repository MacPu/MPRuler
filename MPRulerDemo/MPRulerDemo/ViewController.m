//
//  ViewController.m
//  MPRulerDemo
//
//  Created by MacPu on 16/1/2.
//  Copyright © 2016年 www.imxingzhe.com. All rights reserved.
//

#import "ViewController.h"
#import "MPDateRulerView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MPDateRulerView *dateRulerView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [_dateRulerView setDataChangedBlock:^(NSInteger year, NSInteger month){
        _dateLabel.text = [NSString stringWithFormat:@"%ld年%ld月",year, month];
    }];
}
@end
