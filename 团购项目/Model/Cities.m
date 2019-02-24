//
//  Cities.m
//  团购项目
//
//  Created by Yi Zhang on 2019/2/25.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "Cities.h"

@implementation Cities

+ (NSArray *)getCities
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"cities" ofType:@"plist"];
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *modelArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in plistArray) {
        Cities *cityModel = [[Cities alloc] init];
        cityModel.name = [dict objectForKey:@"name"];
        cityModel.pinYin = [dict objectForKey:@"pinYin"];
        cityModel.pinYinHead = [dict objectForKey:@"pinYinHead"];
        cityModel.region = [dict objectForKey:@"region"];
        [modelArray addObject:cityModel];
    }
    return modelArray;
}

@end
