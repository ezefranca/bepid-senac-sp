//
//  MapaEntrega.m
//  shakeShop
//
//  Created by Ezequiel Franca dos Santos on 21/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "MapaEntrega.h"

@implementation MapaEntrega

-(NSMutableDictionary *)calculaRota: (NSString *)cep{
    NSLog(@"%@", cep);
    NSError *error;
    NSMutableString *url = [NSMutableString stringWithFormat:@"http://172.246.16.27/web_location.php?cep=%@", cep];
    
    
    NSData *jsonRota = [[NSData alloc] initWithContentsOfURL:
                         [NSURL URLWithString:url]];
    
    if (!jsonRota) {
        return nil;
    }
    
    NSMutableDictionary *jsonRotaSerializado = [NSJSONSerialization
                                                 JSONObjectWithData:jsonRota
                                                 options:NSJSONReadingMutableContainers
                                                 error:&error];
    
    NSLog(@"%@", jsonRotaSerializado);
    return jsonRotaSerializado;
}

@end
