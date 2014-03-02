//
//  HWFirstViewController.m
//  mapa-tab
//
//  Created by Ezequiel Franca dos Santos on 27/02/14.
//  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//

#import "HWFirstViewController.h"

@interface HWFirstViewController ()

@end

@implementation HWFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.splashImage.alpha = 1;
     self.tabBarController.tabBar.alpha = 0;
    self.labelWelcome.alpha = 0;
    
    NSThread *loadThread = [[NSThread alloc]initWithTarget:self selector:@selector(splashAction) object:nil];
    
    [loadThread start];
    
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear
{
    self.tabBarController.tabBar.alpha = 1;
    self.labelWelcome.alpha = 1;
}

-(void)splashAction
{
    [NSThread sleepForTimeInterval:1];
    
    [UIView animateWithDuration:2 animations:^{
        [[self.splashImage layer]setOpacity:0];
    }] ;
    
    double delayInSeconds = 1.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self viewDidAppear];
    });
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
    // Dispose of any resources that can be recreated.
}

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [viewController viewWillAppear:animated];
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [viewController viewDidAppear:animated];
}

@end
