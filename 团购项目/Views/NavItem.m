//
//  NavItem.m
//  团购项目
//
//  Created by Yi Zhang on 2019/2/23.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "NavItem.h"

@interface NavItem()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation NavItem

+ (instancetype)makeItem
{
    return [[[NSBundle mainBundle] loadNibNamed:@"NavItem" owner:self options:nil] firstObject];
}

- (void)addTarget:(id)target actioin:(SEL)action
{
    [self.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
