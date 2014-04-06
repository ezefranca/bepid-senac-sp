//
//  ArduinoWebservice.h
//  RNFrostedSidebar
//
//  Created by EZEQUIEL FRANCA DOS SANTOS on 02/04/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArduinoWebservice : NSObject

@property NSMutableArray *sensoresData;
@property NSData *jsonData;

-(float)returnData:(NSString*) sensor;

-(void)reloadData;

@end
