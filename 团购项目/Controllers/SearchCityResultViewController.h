//
//  SearchCityResultViewController.h
//  团购项目
//
//  Created by Yi Zhang on 2019/2/25.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchCityResultViewController : UITableViewController

@property (nonatomic, copy)NSString *searchText;
@property (nonatomic, strong)NSArray *citiesArray;

@end

NS_ASSUME_NONNULL_END
