//
//  PopViewController.m
//  团购项目
//
//  Created by Yi Zhang on 2019/2/23.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "PopViewController.h"
#import "popView.h"
#import "CategoryModel.h"

@interface PopViewController ()<MyPopviewDataSource>
{
    NSArray *_categoryArr;
}
@end

@implementation PopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    popView *pop = [popView makePopView];
    pop.dataSource = self;
    [self.view addSubview:pop];
    //pop.categoryArr = [self getData];
    pop.autoresizingMask = UIViewAutoresizingNone;
    self.preferredContentSize = pop.frame.size;
    _categoryArr = [self getData];
    
}

- (NSArray *)getData
{
    CategoryModel *md = [[CategoryModel alloc] init];
    NSArray *categoryArray = [md loadPlistData];
    return categoryArray;
}

#pragma mark - popview dataSource
- (NSInteger)numberOfRowsInLeftTable:(popView *)popView
{
    return _categoryArr.count;
}

- (NSString *)popView:(popView *)popView titleForRow:(NSInteger)row
{
    return [_categoryArr[row] name];
}

- (NSString *)popView:(popView *)popView imageForRow:(NSInteger)row
{
    return [_categoryArr[row] small_icon];
}

- (NSArray *)popView:(popView *)popView subDataForRow:(NSInteger)row
{
    return [_categoryArr[row] subcategories];
}

@end
