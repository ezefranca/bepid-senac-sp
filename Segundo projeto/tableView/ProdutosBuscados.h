//
//  ProdutosBuscados.h
//  shakeShop
//
//  Created by EZEQUIEL FRANCA DOS SANTOS on 12/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Buscape.h"

@interface ProdutosBuscados : NSObject

+(ProdutosBuscados *) singleProdutos ;

@property NSMutableArray *produtos;
@property int i;

@end
