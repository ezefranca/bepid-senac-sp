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
    [_precoPac setAlpha:0];
    [_precoSedex setAlpha:0];
    _labelCEP.keyboardType = UIKeyboardTypeDecimalPad;
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
    NSString *cep =  [_labelCEP.text stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    if(cep.length == 8){
    
    fretes = [f calculaFrete:10 noEndereco:cep];
    NSString *valorPAC= [fretes objectForKey:@"pac"];
    NSString *valorSEDEX = [fretes objectForKey:@"sedex"];
    self.precoPac.text = [NSMutableString stringWithFormat:@"R$ %@", valorPAC];
    self.precoSedex.text = [NSMutableString stringWithFormat:@"R$ %@", valorSEDEX];
    [_precoPac setAlpha:1];
    [_precoSedex setAlpha:1];
    }
    else{
        UIAlertView *avisoErro = [[UIAlertView alloc]initWithTitle:@"CEP Invalido" message:@"Voce digiou um cep invalido" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [avisoErro show];
    }
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
    [[self view]endEditing:YES];
}

@end
