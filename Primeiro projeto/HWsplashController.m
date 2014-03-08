//
//  HWsplashController.m
//  mapa-tab
//
//  Created by Ezequiel Franca dos Santos on 27/02/14.
//  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//

#import "HWsplashController.h"
#import "HWmaster.h"
#import "HWFirstViewController.h"
#import "HWAppDelegate.h"

@interface HWsplashController ()

@end

@implementation HWsplashController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSThread *t = [[NSThread alloc]initWithTarget:self selector:@selector(nextView) object:nil];
    
   // [t start];
	// Do any additional setup after loading the view.
}

-(void)nextView
{
    [NSThread sleepForTimeInterval:3.0];
    HWAppDelegate *app = [[UIApplication sharedApplication]delegate];
    
    app.window.rootViewController = [[HWmaster alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
