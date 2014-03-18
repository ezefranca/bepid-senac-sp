//
//  SecondViewController.m
//  shakeShop
//
//  Created by GABRIEL VIEIRA on 10/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "SecondViewController.h"
#import "Buscape.h"
#import "Frete.h"
#import "ProdutosBuscados.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize spiner;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TESTE:(id)sender {
    [spiner setAlpha:1];
    [spiner startAnimating];
    [self performSelectorInBackground:@selector(consultaCorreio) withObject:nil];
    //Buscape *teste = [Buscape criarClasse];
    //NSLog(@"%f", teste.valorAPAGAR);
    
    /*
    [teste buscapeJson:@"tv"];
    [teste retornaDados:@"produtoNomeCurto"];
    [teste retornaDados:@"precoMinimo"];
    [teste retornaDados:@"imagemMiniatura"];
    [teste retornaDados:@"especificacao"];
    */
}

- (void)consultaCorreio{
    Frete *f = [[Frete alloc]init];
    // Peso sera calculado com base na quantidade de itens do carrinho
    fretes = [f calculaFrete:10 noEndereco:@"06900000"];
    NSString *valorPAC= [fretes objectForKey:@"pac"];
    NSString *valorSEDEX = [fretes objectForKey:@"sedex"];
    self.precoPac.text = [NSMutableString stringWithFormat:@"R$ %@", valorPAC];
    self.precoSedex.text = [NSMutableString stringWithFormat:@"R$ %@", valorSEDEX];
    [spiner stopAnimating];
    [spiner setAlpha:0];
    
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

// Use this method also if you want to hide keyboard when user touch in background

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

}

@end
