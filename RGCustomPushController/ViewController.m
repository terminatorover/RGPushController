//
//  ViewController.m
//  RGCustomPushController
//
//  Created by ROBERA GELETA on 11/17/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import "ViewController.h"
#import "RGPushViewController.h"
#import "NextViewController.h"
@interface ViewController ()
@property (nonatomic) NextViewController *nextViewController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    CGRect mainFrame = self.view.frame;
    UIButton *next = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMidX(mainFrame), CGRectGetMidY(mainFrame), 100, 100)];
    next.backgroundColor = [UIColor blueColor];
    [next addTarget:self action:@selector(goToNextViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goToNextViewController
{
    [self.rgpushViewController pushViewController:self.nextViewController];
}

- (NextViewController *)nextViewController
{
    if(!_nextViewController)
    {
        _nextViewController  = [[NextViewController alloc]init];
    }
   return _nextViewController;
}
@end
