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
     self.tabBarController.tabBar.alpha = 0;
    
    NSThread *loadThread = [[NSThread alloc]initWithTarget:self selector:@selector(splashAction) object:nil];
    
    [loadThread start];
    
    NSString *fullURL = @"http://conecode.com";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_noticias loadRequest:requestObj];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)splashAction
{
    [NSThread sleepForTimeInterval:1.0];
    
    [UIView animateWithDuration:2 animations:^{
        [[self.splashImage layer]setOpacity:0];
    }] ;
    
    self.tabBarController.tabBar.alpha = 1;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
    // Dispose of any resources that can be recreated.
}

@end
