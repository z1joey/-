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

@interface PopViewController ()

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    popView *pop = [popView makePopView];
    [self.view addSubview:pop];
    pop.categoryArr = [self getData];
    pop.autoresizingMask = UIViewAutoresizingNone;
}

- (NSArray *)getData {
    CategoryModel *md = [[CategoryModel alloc] init];
    NSArray *categoryArray = [md loadPlistData];
    return categoryArray;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
