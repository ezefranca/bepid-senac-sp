//
//  MapaEntrega.h
//  shakeShop
//
//  Created by Ezequiel Franca dos Santos on 21/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MapaEntrega : NSObject

-(NSMutableDictionary *)calculaRota: (NSString *)cep;

@end
