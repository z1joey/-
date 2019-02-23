//
//  popView.m
//  团购项目
//
//  Created by Yi Zhang on 2019/2/23.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "popView.h"

@implementation popView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (popView *)makePopView {
    return [[NSBundle mainBundle] loadNibNamed:@"popView" owner:self options:nil];
}

@end
