//
//  HWFirstViewController.m
//  mapa-tab
//
//  Created by Ezequiel Franca dos Santos on 27/02/14.
//  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//

#import "HWFirstViewController.h"
#import "HWAppDelegate.h"

#define kNavigationBarTitle @"Tagged";
#define kData @"data"
#define kFrom @"from"
#define kName @"name"
#define kMessage @"message"
#define kPicture @"picture"


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
    FBLoginView *loginview = [[FBLoginView alloc] initWithFrame:CGRectMake(0, 70, 240, 5)];
    loginview.frame = CGRectOffset(loginview.frame, 15, 5);
   // loginview.delegate = self;
    
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear
{
    self.tabBarController.tabBar.alpha = 1;
    _loginview.alpha = 1;
    _logoPrincipal.alpha = 1;
    _loginview.readPermissions = @[@"basic_info", @"email", @"user_likes"];
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

-(void)getData
{
    
    NSString *theWholeUrl = [NSString stringWithFormat:@"https://graph.facebook.com/search?q=modi&access_token=%@",FBSession.activeSession.accessTokenData];
    
    NSLog(@"Token = %@",[FBSession activeSession].accessTokenData);
    NSLog(@"TheWholeUrl: %@", theWholeUrl);
    NSURL *facebookUrl = [NSURL URLWithString:theWholeUrl];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^{
                       NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:facebookUrl];
                       [req setHTTPMethod:@"GET"];
                       
                       NSURLResponse *response;
                       NSError *err;
                       NSData *responseData = [NSURLConnection sendSynchronousRequest:req returningResponse:&response error:&err];
                       NSDictionary* json = [NSJSONSerialization
                                             JSONObjectWithData:responseData
                                             
                                             options:kNilOptions
                                             error:&err];
                       self.jsonDictionary = json;
                       NSLog(@"No of objects: %d", [[json objectForKey:@"data"] count]);
                       
                       NSString *content = [NSString stringWithUTF8String:[responseData bytes]];
                       [self parseData:self.jsonDictionary];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^{
                                          [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                                          //NSLog(@"responseData: %@", content);
                                      });
                   }
                   
                   );
}

-(void)parseData:(NSDictionary*)json
{
    NSArray *lArray = [NSArray array];
    lArray = [json objectForKey:kData];
   // NSLog(@"Name = %@",[[[lArray objectAtIndex:0] objectForKey:kFrom] objectForKey:kName]);
    
    NSMutableArray *arrayOfDataModelObjects = [NSMutableArray array];
    
    for (int i = 0; i < [lArray count]; i++)
    {
        self.dataObject = [[DataModelObject alloc] init];
        self.dataObject.name = [[[lArray objectAtIndex:i] objectForKey:kFrom] objectForKey:kName];
        self.dataObject.message = [[lArray objectAtIndex:i] objectForKey:kMessage];
        self.dataObject.picture = [[lArray objectAtIndex:i] objectForKey:kPicture];
        //NSLog(@"Data Object = %@",self.dataObject.picture);
        [arrayOfDataModelObjects addObject:self.dataObject];
    }
    self.arrayOfObjects = arrayOfDataModelObjects;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
    // Dispose of any resources that can be recreated.
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    self.nameLabel.hidden = NO;
    self.imageView.hidden = NO;
    
}
- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    self.nameLabel.hidden = NO;
    self.imageView.hidden = NO;
    self.nameLabel.text= user.name;
    
    NSLog(@"coco");
    
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    self.nameLabel.hidden = YES;
    self.imageView.hidden = YES;
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
