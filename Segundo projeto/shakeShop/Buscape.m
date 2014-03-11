//
//  Buscape.m
//  shakeShop
//
//  Created by Ezequiel Franca dos Santos on 10/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "Buscape.h"

@implementation Buscape

+(id)criarClasse{
    static Buscape *singleton = nil;
    if (!singleton) {
        singleton = [[super allocWithZone:nil] init];
    }
    
    return singleton;

}

+(id) allocWithZone:(struct _NSZone *)zone{
    return [self criarClasse];
}

- (id)init {
    self = [super init];
    
    if (!self.buscapeUrl) {
        self.buscapeUrl = [[NSMutableString alloc]init];
    }
    
    if (!self.jsonDados){
        self.jsonDados = [[NSMutableData alloc]init];
    }
    if(!self.jsonDadosSerializado){
        self.jsonDadosSerializado = [[NSMutableDictionary alloc]init];
    }
    if (!self.produtos){
        self.produtos = [[NSMutableArray alloc]init];
    }
    if (!self.productGeral) {
        self.productGeral = [[NSMutableArray alloc]init];
    }
    if(!self.productSelected){
        self.productSelected = [[NSMutableDictionary alloc]init];
    }
    if (!self.produtoNome) {
        self.produtoNome = [[NSMutableString alloc]init];
    }
    if (!self.precoMaximo) {
        self.precoMaximo = [[NSMutableString alloc]init];
    }
    if (!self.precoMinimo) {
        self.precoMinimo = [[NSMutableString alloc]init];
    }
    
            
    
    return self;
}

-(NSData *) buscapeJson: (NSString *)busca{
    
    self.buscapeUrl = [NSMutableString stringWithFormat:@"http://sandbox.buscape.com/service/findProductList/lomadee/564771466d477a4458664d3d/?keyword=%@&format=json", busca];
    
    self.jsonDados = [[self jsonDados]initWithContentsOfURL:[NSURL URLWithString:self.buscapeUrl]];
                        
    

    
    
    return [self jsonDados];
}

-(NSString *) retornaDados: (NSString *)caracteristica{
    
    NSError *error;
    
    if (!self.jsonDados) {
        return @"error";
    }
    
    self.jsonDadosSerializado = [NSJSONSerialization
                                                 JSONObjectWithData:self.jsonDados
                                                 options:NSJSONReadingMutableContainers
                                                 error:&error];
    
    self.productGeral = [self.jsonDadosSerializado objectForKey:@"product"];
    
    // Esse 1 tem que virar um parametro tambem
    self.productSelected = [self.productGeral[0] objectForKey:@"product"];
    
    if ([caracteristica  isEqual: @"produtoNome"]) {
        self.produtoNome = [self.productSelected objectForKey:@"productname"];
        NSLog(@"%@", self.produtoNome);
        return self.produtoNome;
    }
    
    if ([caracteristica  isEqual: @"precoMaximo"]) {
        self.precoMaximo = [self.productSelected objectForKey:@"pricemax"];
        NSLog(@"%@", self.precoMaximo);
        return self.precoMaximo;
    }
    
    if ([caracteristica  isEqual: @"precoMinimo"]) {
        self.precoMinimo = [self.productSelected objectForKey:@"pricemin"];
        NSLog(@"%@", self.precoMinimo);
        return self.precoMinimo;
    }
    
    if ([caracteristica  isEqual: @"produtoNomeCurto"]) {
        self.produtoNomeCurto = [self.productSelected objectForKey:@"productshortname"];
        NSLog(@"%@", self.produtoNomeCurto);
        return self.produtoNomeCurto;
    }
    
    if ([caracteristica  isEqual: @"totalDeVendedores"]) {
        self.totalDeVendedores = [self.productSelected objectForKey:@"totalsellers"];
        NSLog(@"%@", self.totalDeVendedores);
        return self.totalDeVendedores;
    }
    
    if ([caracteristica  isEqual: @"imagemMiniatura"]) {
        self.imagemMiniatura = [[self.productSelected objectForKey:@"thumbnail"]objectForKey:@"url"];
        NSLog(@"%@", _imagemMiniatura);
        return self.imagemMiniatura;
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
