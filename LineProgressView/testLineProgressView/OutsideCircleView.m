//
//  OutsideCircleView.m
//  testLineProgressView
//
//  Created by AY on 2017/10/16.
//  Copyright © 2017年 ... All rights reserved.
//

#import "OutsideCircleView.h"

@implementation OutsideCircleView



- (void)drawRect:(CGRect)rect {
    // Drawing code
	

    CGPoint center = CGPointMake(145, 145);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:140 startAngle:M_PI * 0.72 endAngle: M_PI * 2.28 clockwise:YES];
   
    // 2.1 添加一条线到圆心
	path.lineWidth = 2;
	[[UIColor colorWithRed:235/255.0f green:193/255.0f blue:119/255.0f alpha:1]set];
    [path stroke];
	
	
}


@end
