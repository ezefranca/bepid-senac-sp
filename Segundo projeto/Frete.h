//
//  Frete.h
//  calcula-frete
//
//  Created by Ezequiel Franca dos Santos on 15/03/14.
//  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Frete : NSObject

-(NSMutableDictionary *)calculaFrete: (NSInteger)peso noEndereco:(NSString *)cep;

@end
