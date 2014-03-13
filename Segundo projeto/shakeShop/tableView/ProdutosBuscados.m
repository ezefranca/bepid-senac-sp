//
//  ProdutosBuscados.m
//  shakeShop
//
//  Created by EZEQUIEL FRANCA DOS SANTOS on 12/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "ProdutosBuscados.h"

@implementation ProdutosBuscados

+(id)singletonClasse: (Buscape *) busquinha{
    static ProdutosBuscados *buscados = nil;
    if (!buscados) {
        buscados = [[super allocWithZone:nil] init];
        }
    
    for (int i = 0; i <= busquinha.productGeral.count; i++)
        buscados[i] = busquinha.productGeral[i];
    return buscados;
    
}


-(id)init {
    self = [super init];
    return self;
}

+(id) allocWithZone:(struct _NSZone *)zone{
    Buscape *busquinha = [[Buscape alloc]init];
    return [self singletonClasse:busquinha];
}

@end
