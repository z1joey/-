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

@interface PopViewController ()<MyPopviewDataSource, MyPopviewDelegate>
{
    NSArray *_categoryArr;
    CategoryModel *_selectedModel;
}
@end

@implementation PopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    popView *pop = [popView makePopView];
    pop.dataSource = self;
    pop.delegate = self;
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

#pragma mark - popview delegate
- (void)popView:(popView *)popView didSelectRowAtLeftTable:(NSInteger)row
{
    //NSArray *categoryArray = [self getData];
    _selectedModel = _categoryArr[row];
    if (!_selectedModel.subcategories.count) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"categoryDidChanged" object:nil userInfo:@{@"categoryModel":_selectedModel}];
    }
}

- (void)popView:(popView *)popView didSelectRowAtRightTable:(NSInteger)row
{
    NSArray *subArray = _selectedModel.subcategories;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"categoryDidChanged" object:nil userInfo:@{@"subCategoryName":subArray[row]}];
}

@end
