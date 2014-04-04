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
        NSLog(@"Arduino Criado");
    }
    return self;
}


-(void)initWithRequest{
 //   NSLog(@"Conectando ao arduino...");
   jsonDados = [[NSData alloc] initWithContentsOfURL:
                 [NSURL URLWithString:@"http://192.168.1.177"]];
}



-(float)conectaEFiltra:(NSString*)qualSensor{

    float sensor;
NSError *error;

NSMutableDictionary *jsonDadosSerializado = [NSJSONSerialization
                                         JSONObjectWithData:jsonDados
                                         options:NSJSONReadingMutableContainers
                                         error:&error];

  //  NSLog(@"%@", jsonDadosSerializado);
    sensoresData = [jsonDadosSerializado objectForKey:qualSensor];
    sensor = [[jsonDadosSerializado objectForKey:qualSensor] floatValue];
 //   NSLog(@"-----%f", sensor);
    return sensor;
    //ok
}

@end
