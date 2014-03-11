//
//  Buscape.m
//  shakeShop
//
//  Created by Ezequiel Franca dos Santos on 10/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "Buscape.h"

@implementation Buscape

+(id)criarConexao{
    static dispatch_once_t pred;
    static Buscape *criaConexao = nil;
    dispatch_once(&pred, ^{
        criaConexao = [[Buscape alloc] init];
    });
    return criaConexao;

}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

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
    
    if ([caracteristica  isEqual: @"produtoNome"]) {
        NSString *produtoNome = [productSelected objectForKey:@"productname"];
        NSLog(@"%@", produtoNome);
        return produtoNome;
    }
    
    if ([caracteristica  isEqual: @"precoMaximo"]) {
        NSString *precoMaximo = [productSelected objectForKey:@"pricemax"];
        NSLog(@"%@", precoMaximo);
        return precoMaximo;
    }
    
    if ([caracteristica  isEqual: @"precoMinimo"]) {
        NSString *precoMinimo = [productSelected objectForKey:@"pricemin"];
        NSLog(@"%@", precoMinimo);
        return precoMinimo;
    }
    
    if ([caracteristica  isEqual: @"produtoNomeCurto"]) {
        NSString *produtoNomeCurto = [productSelected objectForKey:@"productshortname"];
        NSLog(@"%@", produtoNomeCurto);
        return produtoNomeCurto;
    }
    
    if ([caracteristica  isEqual: @"totalDeVendedores"]) {
        NSString *totalDeVendedores = [productSelected objectForKey:@"totalsellers"];
        NSLog(@"%@", totalDeVendedores);
        return totalDeVendedores;
    }
    
    if ([caracteristica  isEqual: @"imagemMiniatura"]) {
        NSString *imagemMiniatura = [[productSelected objectForKey:@"thumbnail"]objectForKey:@"url"];
        NSLog(@"%@", imagemMiniatura);
        return imagemMiniatura;
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
