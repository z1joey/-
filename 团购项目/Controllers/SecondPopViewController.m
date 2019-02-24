//
//  SecondPopViewController.m
//  团购项目
//
//  Created by Yi Zhang on 2019/2/25.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "SecondPopViewController.h"
#import "ChangeCityViewController.h"
#import "MyNavController.h"

@interface SecondPopViewController ()

@end

@implementation SecondPopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)changeCityClick:(id)sender
{
    ChangeCityViewController *cvc = [[ChangeCityViewController alloc] initWithNibName:@"ChangeCityViewController" bundle:nil];
    MyNavController *nav = [[MyNavController alloc] initWithRootViewController:cvc];
    nav.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:nav animated:YES completion:nil];
}

@end
