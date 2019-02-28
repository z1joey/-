//
//  DetailViewController.m
//  团购项目
//
//  Created by Yi Zhang on 2019/2/27.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "DetailViewController.h"
#import "dealModel.h"
#import "UIImageView+WebCache.h"

@interface DetailViewController ()

- (IBAction)backClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:_md.deal_h5_url]];
    [_webView loadRequest:request];
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_md.image_url]];
}

// 只在该VC中隐藏导航栏
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBarHidden = NO;
}

- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
