//
//  PNCircleChart.h
//  PNChartDemo
//
//  Created by kevinzhow on 13-11-30.
//  Copyright (c) 2013年 kevinzhow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNColor.h"


#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface PNCircleChart : UIView

-(void)strokeChart;
- (instancetype)initWithFrame:(CGRect)frame count:(NSNumber *)count ofTotal:(NSNumber *)total;

@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, strong) NSNumber *total;
@property (nonatomic, strong) NSNumber *count;
@property (nonatomic, strong) NSNumber *lineWidth;
@property (nonatomic, strong) NSString *titleCount;

@property(nonatomic,strong) CAShapeLayer *circle;
@property(nonatomic,strong) CAShapeLayer *circleBG;

@end
