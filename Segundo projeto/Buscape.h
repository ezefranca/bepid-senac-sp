//
//  Buscape.h
//  shakeShop
//
//  Created by Ezequiel Franca dos Santos on 10/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

@interface Buscape : NSObject

@property    NSMutableArray *catalogo;
@property    NSMutableArray *produtos;
@property    NSMutableData *jsonDados;
@property    NSMutableDictionary *jsonDadosSerializado;
@property    NSMutableString *buscapeUrl;
@property    NSMutableArray *productGeral;
@property    NSMutableDictionary *productSelected;
@property    NSMutableDictionary *specification;
@property    NSMutableArray *specificationDetails;

@property    NSMutableString *produtoNome;
@property    NSMutableString *precoMaximo;
@property    NSMutableString *precoMinimo;
@property    NSMutableString *produtoNomeCurto;
@property    NSMutableString *totalDeVendedores;
@property    NSMutableString *imagemMiniatura;
@property    NSMutableString *especificacaoTexto;
    //double valorAPAGAR;

@property double valorAPAGAR;

-(NSError *) buscapeJson: (NSString *)busca;
-(NSMutableDictionary *) retornaDados: (NSString *)caracteristica;

+(id)criarClasse;

@end
