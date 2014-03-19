//
//  Carrinho.m
//  shakeShop
//
//  Created by GABRIEL VIEIRA on 19/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "Carrinho.h"

@implementation Carrinho

+(Carrinho *) carrinhoSingle
{
    static Carrinho *sharedCarrinho = nil;
    
    if(!sharedCarrinho)
    {
        sharedCarrinho = [[super allocWithZone:nil] init];
        
    }
    
    return sharedCarrinho;
}

+(id) allocWithZone: (struct _NSZone *) zone
{
    return [self carrinhoSingle];
}

-(id)init
{
    self = [super init];
    
    if (self)
    {
        if (!self.produtosCarrinho)
        {
            self.produtosCarrinho = [[NSMutableArray alloc]init];
        }
    }
    
    return self;
}

@end
