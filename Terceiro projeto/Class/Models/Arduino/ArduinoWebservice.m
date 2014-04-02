//
//  ArduinoWebservice.m
//  RNFrostedSidebar
//
//  Created by EZEQUIEL FRANCA DOS SANTOS on 02/04/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import "ArduinoWebservice.h"

@implementation ArduinoWebservice




-(void)initWithRequest{
    NSLog(@"Inicializando...");
    jsonDados = [[NSData alloc] initWithContentsOfURL:
                 [NSURL URLWithString:@"192.168.1.177"]];
}



-(void)conectaEFiltra:(NSString*)qualSensor{

NSError *error;

NSMutableDictionary *jsonDadosSerializado = [NSJSONSerialization
                                         JSONObjectWithData:jsonDados
                                         options:NSJSONReadingMutableContainers
                                         error:&error];

    NSLog(@"%@", jsonDadosSerializado);
sensoresData = [jsonDadosSerializado objectForKey:@"sensores"];
    //ok


}

@end
