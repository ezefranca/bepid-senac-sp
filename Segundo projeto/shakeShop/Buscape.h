//
//  Buscape.h
//  shakeShop
//
//  Created by Ezequiel Franca dos Santos on 10/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Buscape : NSObject
{
    NSMutableArray *catalogo;
    NSMutableArray *produtos;
    NSData *jsonDados;
}

-(NSError *) buscapeJson: (NSString *)busca;
-(NSMutableDictionary *) retornaDados: (NSString *)caracteristica;

+(id)criarConexao;

@end
