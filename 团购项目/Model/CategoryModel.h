//
//  CategoryModel.h
//  团购项目
//
//  Created by Yi Zhang on 2019/2/24.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CategoryModel : NSObject
@property (copy, nonatomic)NSString * highlighted_icon;
@property (copy, nonatomic)NSString * small_highlighted_icon;
@property (copy, nonatomic)NSString * icon;
@property (copy, nonatomic)NSString * small_icon;

@property (copy, nonatomic)NSString * name;

@property (copy, nonatomic)NSArray * subcategories;

- (NSArray *)loadPlistData;
@end

NS_ASSUME_NONNULL_END
