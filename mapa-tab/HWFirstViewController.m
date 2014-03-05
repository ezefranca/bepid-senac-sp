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

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // inicializacao
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.splashImage.alpha = 1;
     self.tabBarController.tabBar.alpha = 0;
    
    NSThread *loadThread = [[NSThread alloc]initWithTarget:self selector:@selector(splashAction) object:nil];
    
    [loadThread start];
    
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear
{
    self.tabBarController.tabBar.alpha = 1;
    FBLoginView *loginview = [[FBLoginView alloc]init];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    loginview.frame = CGRectOffset(loginview.frame, screenWidth/6, screenHeight/2);
    [loginview sizeToFit];
    loginview.readPermissions = @[@"basic_info", @"email", @"user_likes"];
    [self.view addSubview:loginview];
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

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication fallbackHandler:^(FBAppCall *call){
                      NSLog(@"In fallback handler");
    }];
}

@end
