//
//  ArduinoWebservice.h
//  RNFrostedSidebar
//
//  Created by EZEQUIEL FRANCA DOS SANTOS on 02/04/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArduinoWebservice : NSObject
{
    NSMutableArray *sensoresData;
    NSMutableArray *sensoresDataAuxiliar;
    NSData *jsonDados;
}

-(void)initWithRequest;
-(float)conectaEFiltra:(NSString*)qualSensor;

@end
