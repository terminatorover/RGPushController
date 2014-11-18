//
//  NextViewController.m
//  RGCustomPushController
//
//  Created by ROBERA GELETA on 11/17/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import "NextViewController.h"
#import "RGPushViewController.h"
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    UIImage *image = [UIImage imageNamed:@"showThis"];
    imageView.image = image;
    [self.view addSubview:imageView];
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 30, 40)];
    
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    backButton.backgroundColor = [UIColor blueColor];
    [backButton addTarget:self action:@selector(goBackToPreviousController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}

-(void)viewWillAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goBackToPreviousController
{
    [self.rgpushViewController popViewController:self];
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
