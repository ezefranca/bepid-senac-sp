//
//  Buscape.m
//  shakeShop
//
//  Created by Ezequiel Franca dos Santos on 10/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "Buscape.h"

@implementation Buscape

-(NSData *) buscapeJson: (NSString *)busca{
    
    NSString *buscapeUrl = [NSString stringWithFormat:@"http://sandbox.buscape.com/service/findProductList/lomadee/564771466d477a4458664d3d/?keyword=%@&format=json",busca];
    
    jsonDados = [[NSData alloc] initWithContentsOfURL:
                 [NSURL URLWithString:buscapeUrl]];
    
    return jsonDados;
}

-(NSString *) retornaDados: (NSString *)caracteristica{
    
    NSError *error;
    
    NSMutableDictionary *jsonDadosSerializado = [NSJSONSerialization
                                                 JSONObjectWithData:jsonDados
                                                 options:NSJSONReadingMutableContainers
                                                 error:&error];
    
    NSMutableArray *productGeral = [jsonDadosSerializado objectForKey:@"product"];
    
    // Esse 1 tem que virar um parametro tambem
    NSMutableDictionary *productSelected = [productGeral[1] objectForKey:@"product"];
    
    if ([caracteristica  isEqual: @"precoMinimo"]) {
        NSString *precoMaximo = [productSelected objectForKey:@"pricemin"];
        return precoMaximo;
    }
    
    if ([caracteristica  isEqual: @"precoMaximo"]) {
        NSString *precoMaximo = [productSelected objectForKey:@"pricemax"];
        return precoMaximo;
    }

    return @"nada";
}
/*
 
    
    //NSLog(@"%@", jsonDadosSerializado);
 
    //NSLog(@"%@", productGeral);
    
    
    NSInteger quantidadeDeProdutos = productGeral.count;
    // NSLog(@"%ld", (long)quantidadeDeProdutos);
    
 
 
    NSString *precoMaximo = [productSelected objectForKey:@"pricemax"];
    NSString *precoMinimo = [productSelected objectForKey:@"pricemin"];
    NSLog(@"%@", precoMaximo);
    
} */

@end
