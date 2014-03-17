//
// Frete.m
// calcula-frete
//
// Created by Ezequiel Franca dos Santos on 15/03/14.
// Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//

#import "Frete.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

@implementation Frete

-(void)calculaFrete: (NSInteger)peso noEndereco:(NSString *)cep{
    NSError *error;
    NSMutableString *url = [NSMutableString stringWithFormat:@"http://developers.agenciaideias.com.br/correios/frete/json/04696000/%@/%ld/100.0", cep, (long)peso];
    
    
    NSData *jsonFrete = [[NSData alloc] initWithContentsOfURL:
                         [NSURL URLWithString:url]];
    
    if (!jsonFrete) {
        return;
    }
    
    NSData *jsonFreteSerializado = [NSJSONSerialization
                                    JSONObjectWithData:jsonFrete
                                    options:NSJSONReadingMutableContainers
                                    error:&error];
    
    NSLog(@"%@", jsonFreteSerializado);
}

@end