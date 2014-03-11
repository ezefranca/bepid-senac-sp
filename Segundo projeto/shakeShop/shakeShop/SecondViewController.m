//
//  SecondViewController.m
//  shakeShop
//
//  Created by GABRIEL VIEIRA on 10/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "SecondViewController.h"
#import "Buscape.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
    Buscape *teste = [Buscape criarConexao];
    [teste buscapeJson:@"tv"];
     [teste retornaDados:@"produtoNomeCurto"];
    [teste retornaDados:@"precoMinimo"];
     [teste retornaDados:@"imagemMiniatura"];
    
}
@end
