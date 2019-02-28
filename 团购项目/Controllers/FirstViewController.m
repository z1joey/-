//
//  FirstViewController.m
//  团购项目
//
//  Created by Yi Zhang on 2019/2/23.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "FirstViewController.h"
#import "NavItem.h"
#import "PopViewController.h"
#import "SecondPopViewController.h"
#import "CityGroupModel.h"
#import "CategoryModel.h"
#import "DPAPI.h"
#import "dealModel.h"
#import "MainCollectionViewCell.h"
#import "MJRefresh.h"
#import "DetailViewController.h"

@interface FirstViewController()<DPRequestDelegate>
{
    UIBarButtonItem *firstItem;
    UIBarButtonItem *secondItem;
    UIBarButtonItem *thirdItem;
    
    NSString *_selectedCityName;
    NSString *_selectedCategory;
    NSMutableArray *_dataSource;
}
@property (nonatomic, assign)NSInteger page;
@end

@implementation FirstViewController

static NSString * const reuseIdentifier = @"MainCell";

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(300, 300);
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    return [self initWithCollectionViewLayout:layout];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.alwaysBounceVertical = YES;
    
    _dataSource = [[NSMutableArray alloc] init];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MainCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self createRequest];
        [self.collectionView.header endRefreshing];
    }];
    
    self.collectionView.footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
        [self.collectionView.footer endRefreshing];
    }];
    
    [self createNavBar];
    [self addObservers];
}

#pragma mark - 创建监听
- (void)addObservers
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(categoryChange:) name:@"categoryDidChanged" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(subCategoryChange:) name:@"subCategoryDidChanged" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityChange:) name:@"cityDidChanged" object:nil];
}

#pragma mark - 屏幕旋转
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    int num = 2;
    if (size.width == 1024) {
        num = 3;
    }
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    CGFloat inset = (size.width - num*layout.itemSize.width)/(num+1);
    layout.sectionInset = UIEdgeInsetsMake(inset, inset, inset, inset);
    //上下间距
    layout.minimumLineSpacing = inset;
}

#pragma mark - 通知方法
- (void)categoryChange:(NSNotification*)noti
{
    CategoryModel *md = noti.userInfo[@"categoryModel"];
    NSLog(@"---左表---%@", md.name);
}

- (void)subCategoryChange:(NSNotification*)noti
{
    CategoryModel *md = noti.userInfo[@"categoryModel"];
    NSString *selectedSubName = noti.userInfo[@"subCategoryName"];
    NSLog(@"左表: %@------从表: %@", md.name, selectedSubName);
    
    if (!md.subcategories.count) {
        _selectedCategory = md.name;
    } else {
        if ([selectedSubName isEqualToString:@"全部"]) {
            _selectedCategory = md.name;
        } else {
            _selectedCategory = selectedSubName;
        }
    }
    NSLog(@"Category selected: %@", _selectedCategory);
    [self createRequest];
}

- (void)cityChange:(NSNotification*)noti
{
    _selectedCityName = noti.userInfo[@"cityName"];
    [self createRequest];
}

#pragma mark - 网络请求
- (void)createRequest
{
    _page = 1;
    [self request];
}

- (void)loadMoreData
{
    _page++;
    [self request];
}

- (void)request
{
    DPAPI *api = [[DPAPI alloc] init];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:_selectedCityName forKey:@"city"];
    [params setValue:_selectedCategory forKey:@"category"];
    params[@"limit"] = @6;
    params[@"page"] = @(self.page);
    [api requestWithURL:@"v1/deal/find_deals" params:(NSMutableDictionary *)params delegate:self];
}

#pragma mark - DPAPI delegate
- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result
{
    //NSLog(@"%@", result);
    NSDictionary *dict = result;
    dealModel *md = [[dealModel alloc]init];
    NSArray *arr = [md asignModelWithDict:dict];
    [_dataSource addObjectsFromArray:arr];
    [self.collectionView reloadData];
    //NSArray *modelArray = [md asignModelWithDict:dict];
    //NSLog(@"%lu === %@", _dataSource.count, [_dataSource[0] title]);
}

- (void)request:(DPRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
}

#pragma mark - 创建导航栏
- (void)createNavBar
{
    UIBarButtonItem *logo = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];

    NavItem *first = [NavItem makeItem];
    [first addTarget:self actioin:@selector(firstClick)];
    NavItem *second = [NavItem makeItem];
    [second addTarget:self actioin:@selector(secondClick)];
    NavItem *third = [NavItem makeItem];
    [third addTarget:self actioin:@selector(thirdClick)];
    
    firstItem = [[UIBarButtonItem alloc] initWithCustomView:first];
    secondItem = [[UIBarButtonItem alloc] initWithCustomView:second];
    thirdItem = [[UIBarButtonItem alloc] initWithCustomView:third];
    
    self.navigationItem.leftBarButtonItems = @[logo, firstItem, secondItem, thirdItem];
    
    // 如果不关autoresizing，横屏时nav item会错乱
    self.navigationController.navigationBar.autoresizingMask = UIViewAutoresizingNone;
}

#pragma mark - 点击事件
- (void)firstClick
{
    [self createPopver];
}

- (void)secondClick
{
    [self createSecondPopver];
}

- (void)thirdClick
{
    NSLog(@"1");
}

#pragma mark - 下拉菜单1
- (void)createPopver
{
    PopViewController *pvc = [[PopViewController alloc] init];
    UIPopoverController *pop = [[UIPopoverController alloc] initWithContentViewController:pvc];
    [pop presentPopoverFromBarButtonItem:firstItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

#pragma mark - 下拉菜单2
- (void)createSecondPopver
{
    SecondPopViewController *svc = [[SecondPopViewController alloc] initWithNibName:@"SecondPopViewController" bundle:nil];
    UIPopoverController *pop = [[UIPopoverController alloc] initWithContentViewController:svc];
    [pop presentPopoverFromBarButtonItem:secondItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    [self viewWillTransitionToSize:collectionView.frame.size withTransitionCoordinator:nil];
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 已注册，不需要用懒加载
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    // Configure the cell
    dealModel *md = _dataSource[indexPath.item];
    [cell showUIWithModel:md];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *dvc = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    dvc.md = _dataSource[indexPath.item];
    [self.navigationController pushViewController:dvc animated:YES];
}

//#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
