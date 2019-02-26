//
//  MyLabel.m
//  团购项目
//
//  Created by Yi Zhang on 2019/2/26.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "MyLabel.h"

@implementation MyLabel


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, rect.size.height/2);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height/2);
    CGContextStrokePath(context);
}


@end
