//
//  Cities.h
//  团购项目
//
//  Created by Yi Zhang on 2019/2/25.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cities : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *pinYin;
@property (nonatomic, copy)NSString *pinYinHead;
@property (nonatomic, strong)NSArray *region;

+(NSArray *)getCities;

@end

NS_ASSUME_NONNULL_END
