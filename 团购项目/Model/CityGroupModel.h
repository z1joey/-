//
//  CityGroupModel.h
//  团购项目
//
//  Created by Yi Zhang on 2019/2/25.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CityGroupModel : NSObject

@property(nonatomic, strong)NSArray *cities;
@property(nonatomic, copy)NSString *title;

- (NSArray *)getModelArray;

@end

NS_ASSUME_NONNULL_END
