//
//  NavItem.h
//  团购项目
//
//  Created by Yi Zhang on 2019/2/23.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NavItem : UIView
+ (instancetype)makeItem;
- (void)addTarget:(id)target actioin:(SEL)action; 
@end

NS_ASSUME_NONNULL_END
