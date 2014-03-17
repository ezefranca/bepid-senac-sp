//
//  ProdutosBuscados.m
//  shakeShop
//
//  Created by EZEQUIEL FRANCA DOS SANTOS on 12/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "ProdutosBuscados.h"

@implementation ProdutosBuscados

+(ProdutosBuscados *) singleProdutos
{
    static ProdutosBuscados *singleProdutos = nil;
    
    if(!singleProdutos)
    {
        singleProdutos = [[super allocWithZone:nil] init];
    }
    
    return singleProdutos;
}

+(id) allocWithZone: (struct _NSZone *) zone
{
    return [self singleProdutos];
}

-(id)init
{
    self = [super init];
    
    if (self)
    {
        if (!self.produtos) {
            
            self.produtos = [[NSMutableArray alloc]init];
        }
    }
    
    return self;
}

@end
