//
//  CategoryModel.m
//  团购项目
//
//  Created by Yi Zhang on 2019/2/24.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

- (NSArray *)loadPlistData
{
    NSString *file = [[NSBundle mainBundle] pathForResource:@"categories" ofType:@"plist"];
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:file];
    NSArray *dataArray = [self getDataWithArray:plistArray];
    return dataArray;
}

- (void)makeModelWithDict: (NSDictionary *)dict
{
    self.highlighted_icon = [dict objectForKey:@"highlighted_icon"];
    self.icon = [dict objectForKey:@"icon"];
    self.small_highlighted_icon = [dict objectForKey:@"small_highlighted_icon"];
    self.small_icon = [dict objectForKey:@"small_icon"];
    self.name = [dict objectForKey:@"name"];
    self.subcategories = [dict objectForKey:@"subcategories"];
}

- (NSArray *)getDataWithArray: (NSArray *)array
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in array) {
        NSLog(@"%@", dict);
        CategoryModel *md = [[CategoryModel alloc] init];
        [md makeModelWithDict:dict];
        [arr addObject:md];
    }
    return arr;
}

@end
