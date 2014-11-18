//
//  RGPushViewController.m
//  RGCustomPushController
//
//  Created by ROBERA GELETA on 11/17/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import "RGPushViewController.h"

@interface RGPushViewController ()

@end

@implementation RGPushViewController


- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    NSArray *childViewControllers = self.childViewControllers;
    if(childViewControllers.count == 0)
    {
        [rootViewController willMoveToParentViewController:self];
        [self addChildViewController:rootViewController];
        [self.view addSubview:   rootViewController.view];
        [rootViewController didMoveToParentViewController:self];
    }
    return self;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Pushing and Poping 
- (void)pushViewController:(UIViewController *)viewController
{

    //invisible and scaled down
    viewController.view.frame = self.view.bounds;
    viewController.view.backgroundColor = [UIColor grayColor];
    viewController.view.transform = CGAffineTransformMakeScale(.5, .5);
    
    viewController.view.alpha = 0;
    
    [self addChildViewController:viewController];
    [self.view addSubview:viewController.view];
    [UIView animateWithDuration:.6
                     animations:^{
        viewController.view.transform = CGAffineTransformIdentity;
                         CGAffineTransform scaleTransform = CGAffineTransformMakeScale(.4, .4);
                         CGAffineTransform translationTransform = CGAffineTransformMakeTranslation(-self.view.bounds.size.width, 0);
                         CGAffineTransform scaleAndTranslate = CGAffineTransformConcat(scaleTransform,translationTransform);
                         [self bottomView].transform = scaleAndTranslate;
                         
        viewController.view.alpha = 1 ;

    } completion:^(BOOL finished) {
        [viewController didMoveToParentViewController:self];
        [self bottomView].transform = CGAffineTransformIdentity;
    }];
}

- (void)popViewController:(UIViewController *)viewController
{
    NSArray *childViewControllers = [self childViewControllers];
    UIViewController *topViewController = childViewControllers.lastObject;
    if(topViewController == viewController)//pop only if the user removes the top view Controller
    {
        [viewController willMoveToParentViewController:nil];
        [UIView animateWithDuration:.4
                         animations:^{
                             CGAffineTransform scaleTransform = CGAffineTransformMakeScale(.4, .4);
                             CGAffineTransform translationTransform = CGAffineTransformMakeTranslation(-self.view.bounds.size.width, 0);
                             CGAffineTransform scaleAndTranslate = CGAffineTransformConcat(scaleTransform,translationTransform);
                             viewController.view.transform = scaleAndTranslate;
                             viewController.view.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             [viewController.view removeFromSuperview];
                             [viewController removeFromParentViewController];
                             viewController.view.transform = CGAffineTransformIdentity;
                         }];
    }
}


- (UIView  *)bottomView
{
    NSArray *allChildren = [self childViewControllers];
    UIViewController *bottomViewController = allChildren.firstObject;
    return bottomViewController.view;
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

@implementation UIViewController (RGPushViewController)

- (RGPushViewController *)rgpushViewController
{
    return (RGPushViewController *)self.parentViewController;
}
@end

