//
//  RGPushViewController.h
//  RGCustomPushController
//
//  Created by ROBERA GELETA on 11/17/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGPushViewController : UIViewController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController;
- (void)pushViewController:(UIViewController *)viewController;
- (void)popViewController:(UIViewController *)viewController;

@end

@interface UIViewController (RGPushViewController)

- (RGPushViewController *)rgpushViewController;
@end