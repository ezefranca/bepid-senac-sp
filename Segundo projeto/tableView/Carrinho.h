//
//  Carrinho.h
//  shakeShop
//
//  Created by GABRIEL VIEIRA on 19/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Carrinho;

@interface Carrinho : NSObject

+(Carrinho *) carrinhoSingle;

@property NSMutableArray *produtosCarrinho;
@end


