//
//  PNCircleChart.m
//  PNChartDemo
//
//  Created by kevinzhow on 13-11-30.
//  Copyright (c) 2013年 kevinzhow. All rights reserved.
//

#import "PNCircleChart.h"
#import "UICountingLabel.h"

@interface PNCircleChart ()
@property (strong) UILabel *titleLabel;
@end

@implementation PNCircleChart

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame count:@0 ofTotal:@0];
}


- (instancetype)initWithFrame:(CGRect)frame count:(NSNumber *)count ofTotal:(NSNumber *)total {
    self = [super initWithFrame:frame];

    if (self) {
        _total = total;
        _count = count;
        _strokeColor = [UIColor colorWithRed:0.180 green:0.800 blue:0.443 alpha:1.000];
        self.titleCount = @"";

        _lineWidth = [NSNumber numberWithFloat:8.0];
        UIBezierPath* circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.center.x,self.center.y) radius:self.frame.size.height*0.5 startAngle:DEGREES_TO_RADIANS(270) endAngle:DEGREES_TO_RADIANS(270.01) clockwise:NO];

        _circle               = [CAShapeLayer layer];
        _circle.path          = circlePath.CGPath;
        _circle.lineCap       = kCALineCapRound;
        _circle.fillColor     = [UIColor clearColor].CGColor;
        _circle.strokeColor   = _strokeColor.CGColor;
        _circle.lineWidth     = [_lineWidth floatValue];
        _circle.zPosition     = 1;

        UIView *background = [[UIView alloc] initWithFrame:frame];
        background.alpha = 0.5;
        background.layer.cornerRadius = frame.size.height/2;
        background.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];

        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50.0, 50.0)];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.titleLabel setNumberOfLines:2];
        [self.titleLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [self.titleLabel setTextColor:[UIColor whiteColor]];
        [self.titleLabel setCenter:CGPointMake(self.center.x,self.center.y)];

        [self addSubview:background];
        [self.layer addSublayer:_circle];
        [self addSubview:self.titleLabel];
        [self setBackgroundColor:[UIColor clearColor]];
    }

    return self;

}

-(void)strokeChart
{
    //Add count label
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ REPOSTS", self.titleCount]];
    [title addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20.0] range:NSMakeRange(0, self.titleCount.length)];
    [self.titleLabel setAttributedText:title];

    //Add circle params
    _circle.lineWidth   = [_lineWidth floatValue];
    _circle.strokeColor = _strokeColor.CGColor;

    //Add Animation
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:[_count floatValue]/[_total floatValue]];
    [_circle addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    _circle.strokeEnd   = [_count floatValue]/[_total floatValue];
}

@end
