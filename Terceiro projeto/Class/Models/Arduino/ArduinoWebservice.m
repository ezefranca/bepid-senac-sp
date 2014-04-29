//
//  ArduinoWebservice.m
//  RNFrostedSidebar
//
//  Created by EZEQUIEL FRANCA DOS SANTOS on 02/04/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import "ArduinoWebservice.h"

@implementation ArduinoWebservice

- (id)init
{
    self = [super init];
    if (self) {
    
        self.jsonData = [[NSData alloc]init];

    }
    return self;
}

-(void)reloadData
{
    
    
    bool success = false;
    const char *host_name = [@"192.168.1.177"
                             cStringUsingEncoding:NSASCIIStringEncoding];
    
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL,
                                                                                host_name);
    SCNetworkReachabilityFlags flags;
    success = SCNetworkReachabilityGetFlags(reachability, &flags);
    bool isAvailable = success && (flags & kSCNetworkFlagsReachable) &&
    !(flags & kSCNetworkFlagsConnectionRequired);
    if (isAvailable) {
  //      NSLog(@"Servidor frifri online: %d", flags);
    }else{
        NSLog(@"Servidor frifri offline");
    }
    
    self.internetReachable = [Reachability reachabilityWithHostname:@"192.168.1.177"];

    self.internetReachable.reachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
          //  NSLog(@"internet esta funcionando");
        });
    };
    
    // Internet is not reachable
    self.internetReachable.unreachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Someone broke the internet :(");
        });
    };
    
     [self.internetReachable startNotifier];
    
    self.jsonData = [[NSData alloc] initWithContentsOfURL:
                             [NSURL URLWithString:@"http://192.168.1.177"]];
}

-(float)returnData:(NSString *)sensor
{
    
    NSError *error;
    
    NSMutableDictionary *jsonDadosSerializado = [NSJSONSerialization
                                                 JSONObjectWithData:self.jsonData
                                                 options:NSJSONReadingMutableContainers
                                                 error:&error];
    
    return  [[jsonDadosSerializado objectForKey:sensor] floatValue];

}


@end
