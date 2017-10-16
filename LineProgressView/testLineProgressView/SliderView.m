//
//  SliderView.m
//  testLineProgressView
//
//  Created by AY on 2017/10/16.
//  Copyright © 2017年 ... All rights reserved.
//

#import "SliderView.h"

@implementation SliderView


- (void)drawRect:(CGRect)rect {
    // Drawing code
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetFlatness(context, 2.0);
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetShouldAntialias(context, true);
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
	
	CGContextSetLineWidth(context,2.0f);
	
	
	
	CGFloat x0 = 2;
	CGFloat y0 = 0;
	CGFloat padding = 8;
	CGFloat lineHeight = 30;
	// 底部 total
	for (int i = 0; i < self.total; i++) {
		CGFloat x = x0 + i * padding;
		CGFloat y = y0 + lineHeight;
		
		CGContextMoveToPoint(context, x0 + i * padding, y0);
		
		CGContextAddLineToPoint(context, x, y);
        CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:250/255.0f green:238/255.0f blue:218/255.0f alpha:1].CGColor);   //设置颜色
        CGContextSetFillColorWithColor(context, [UIColor colorWithRed:250/255.0f green:238/255.0f blue:218/255.0f alpha:1].CGColor);
        CGContextDrawPath(context, kCGPathFillStroke);
				
	}
	
	// 顶部 进度  process
	
	
	for (int i = 0; i < self.process; i++) {
		CGFloat x = x0 + i * padding;
		CGFloat y = y0 + lineHeight;
		
		CGContextMoveToPoint(context, x0 + i * padding, y0);
		
		CGContextAddLineToPoint(context, x, y);
        CGContextSetStrokeColorWithColor(context,  [UIColor colorWithRed:235/255.0f green:193/255.0f blue:119/255.0f alpha:1].CGColor);   //设置颜色
        CGContextSetFillColorWithColor(context,  [UIColor colorWithRed:235/255.0f green:193/255.0f blue:119/255.0f alpha:1].CGColor);
        CGContextDrawPath(context, kCGPathFillStroke);
				
	}
	
	
	
	
}


@end
