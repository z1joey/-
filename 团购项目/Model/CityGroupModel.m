//
//  CityGroupModel.m
//  团购项目
//
//  Created by Yi Zhang on 2019/2/25.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "CityGroupModel.h"

@implementation CityGroupModel
{
    NSArray *_plistArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadPlist];
    }
    return self;
}

- (void)loadPlist
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cityGroups" ofType:@"plist"];
    _plistArray = [NSArray arrayWithContentsOfFile:path];
}

- (NSArray *)getModelArray
{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in _plistArray) {
        CityGroupModel *md = [[CityGroupModel alloc] init];
        md.title = [dict objectForKey:@"title"];
        md.cities = [dict objectForKey:@"cities"];
        [dataArray addObject:md];
    }
    return dataArray;
}

@end
