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
    self.jsonData = [[NSData alloc] initWithContentsOfURL:
                             [NSURL URLWithString:@"http://172.246.16.27/arduino"]];
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
