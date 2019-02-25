//
//  ChangeCityViewController.m
//  团购项目
//
//  Created by Yi Zhang on 2019/2/25.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "ChangeCityViewController.h"
#import "CityGroupModel.h"
#import "SearchCityResultViewController.h"
#import "UIView+AutoLayout.h"

@interface ChangeCityViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
{
    NSMutableArray *_dataArray;
}
@property (weak, nonatomic) IBOutlet UIView *coverView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) SearchCityResultViewController *searchResultVC;
@end

@implementation ChangeCityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"切换城市";
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_navigation_close"] style:UIBarButtonItemStyleDone target:self action:@selector(backToVC)];
    self.navigationItem.leftBarButtonItem = item;
    
    CityGroupModel *md = [[CityGroupModel alloc] init];
    _dataArray = [md getModelArray];
}

- (void)backToVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma - Tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_dataArray objectAtIndex:section] cities].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"tableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    CityGroupModel *md = [_dataArray objectAtIndex:indexPath.section];
    cell.textLabel.text = md.cities[indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CityGroupModel *md = [_dataArray objectAtIndex:section];
    return md.title;    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CityGroupModel *md = [_dataArray objectAtIndex:indexPath.section];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"cityDidChanged" object:nil userInfo:@{@"cityName":md.cities[indexPath.row]}];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UISearchBar delegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    self.coverView.hidden = NO;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    self.coverView.hidden = YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length) {
        self.searchResultVC.view.hidden = NO;
        self.searchResultVC.searchText = searchText;
    } else {
        self.searchResultVC.view.hidden = YES;
    }
}

#pragma mark - 创建搜索结果控制器
// Set
- (SearchCityResultViewController *)searchResultVC
{
    // 懒加载
    if (! _searchResultVC) {
        _searchResultVC = [[SearchCityResultViewController alloc] init];
        // 添加约束
        [self.view addSubview:_searchResultVC.view];
        [self.searchResultVC.view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.searchResultVC.view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.searchBar withOffset:0];
        //[self.searchResultVC.view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    }
    return _searchResultVC;
}

@end
