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

@interface FirstViewController ()
{
    UIBarButtonItem *firstItem;
    UIBarButtonItem *secondItem;
    UIBarButtonItem *thirdItem;
}
@end

@implementation FirstViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self createNavBar];
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
//    CityGroupModel *md = [[CityGroupModel alloc] init];
//    NSArray *arr = [md getModelArray];
//    for (CityGroupModel *m in arr) {
//        NSLog(@"%@", m.title);
//    }
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

//#pragma mark <UICollectionViewDataSource>
//
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items
//    return 0;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//
//    // Configure the cell
//
//    return cell;
//}
//
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
