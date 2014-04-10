//
//  OrvalhoViewController.m
//  RNFrostedSidebar
//
//  Created by Ezequiel Franca dos Santos on 28/03/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import "OrvalhoViewController.h"
#import "PNChart.h"
#import "SDbar.h"
#import "ArduinoWebservice.h"
#import <math.h>

@interface OrvalhoViewController ()

@end


@implementation OrvalhoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.arduino = [[ArduinoWebservice alloc]init];
        self.plotaGrafico.enabled = FALSE;
        self.plotaGrafico.alpha = 0;
        self.single = [[Single alloc]init];
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(atualizadorLabel) userInfo:nil repeats:YES];
    
    indiceTexto = 1;
    
    //gesto para abrir a barra lateral
    UISwipeGestureRecognizer *gestoPorra = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(abrirMenu)];
    [gestoPorra setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:gestoPorra];
    self.informacaoView.alpha = 0;
    
    self.turtleVisible = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidDisappear:(BOOL)animated
{
    [self.time invalidate];
    self.time = nil;
}

- (IBAction)nextTextInfo:(id)sender {
    if(indiceTexto > 5)
        indiceTexto = 1;
    NSNumber *z = [NSNumber numberWithInteger:indiceTexto];
    NSString *y = [z stringValue];
    self.textoInformativo.text = NSLocalizedString(y, nil);
    indiceTexto++;
}


- (IBAction)BeginButton:(id)sender
{
    
    if (self.startAndStop)
    {
        self.temperaturaFinal = [self.arduino returnData:@"temperatura"];
        self.finalLabel.text = [NSString stringWithFormat:@"%2f C" , self.temperaturaFinal];
        self.plotaGrafico.enabled = TRUE;
        self.plotaGrafico.alpha = 1;
        self.beginButton.titleLabel.text = @"CLICK TO GET INITIAL";
        self.startAndStop = FALSE;
    }
    else
    {
        self.beginButton.titleLabel.text = @"CLICK TO GET FINAL";
        self.temperaturaInicial = [self.arduino returnData:@"temperatura"];
        self.inicialLabel.text = [NSString stringWithFormat:@"%2f C" , self.temperaturaInicial];
        [self performSelectorOnMainThread:@selector(desenhaGelinho) withObject:nil waitUntilDone:NO];
        
        self.startAndStop = TRUE;
    }
    
    
    
    //[self desenhaGelinho];
}

- (IBAction)plotaGrafico:(id)sender {
   
    Temperatura temp = self.single.temperatura;
    temp.temperaturaAtual = self.temperaturaAtual;
    temp.TemperaturaFinal = self.temperaturaFinal;
    temp.temperaturaInicial = self.temperaturaInicial;
    
    self.single.temperatura = temp;
    
     [SDbar changeController:6 :self ];
}

- (IBAction)tartarugaInfo:(id)sender {
    
    if (self.turtleVisible)
    {
        [UIView animateWithDuration:1 animations:^{
            
            self.informacaoView.alpha = 0;
        }];
        self.informacaoView.hidden = YES;
        
        self.turtleVisible = NO;
    }
    else
    {
        [UIView animateWithDuration:1 animations:^{
             self.informacaoView.alpha = 1;
            self.informacaoView.hidden = NO;
        }];
        
        self.turtleVisible = YES;
    }
}

-(void)atualizadorLabel{
    
    
    [self performSelectorInBackground:@selector(atualizaBackground) withObject:nil];
    
}

-(void)atualizaBackground
{
    float temp;
    [self.arduino reloadData];
    temp = [self.arduino returnData:@"temperatura"];
    self.temperaturaAtual = temp;
    _atualLabel.text = [NSString stringWithFormat:@"%2f C", temp];
}

#pragma mark sidebarManager

-(void)abrirMenu
{
    [SDbar showSideBar:self];
}

- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    
    [SDbar changeController: index :self ];
}


- (IBAction)btn:(id)sender {
    [self abrirMenu];
}

-(void)desenhaGelinho{
    // INICIAR ANIMACAO
    [self.animator removeAllBehaviors];
    
    for (UIView *u in self.view.subviews) {
        if ([u class] == [UIView class]) {
            if (u != self.informacaoView && u != self.coliView && u != self.dadosexperimentoView)  {
                 [u removeFromSuperview];
            }
        }
    }
    
    
    
    //CUSTON
    UIImageView *redSquare = [[UIImageView alloc]initWithFrame:CGRectMake(800, 200, 50, 50)];
    redSquare.image = [UIImage imageNamed:@"gelo.png"];
   //
    [self.view addSubview:redSquare];
    
    //quadrado
    UIDynamicItemBehavior *elasticityBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[redSquare]];
    elasticityBehavior.elasticity = 0.5f;
    [elasticityBehavior setDensity:1.0];
    // [elasticityBehavior setElasticity:1.0   ];
    [self.animator addBehavior:elasticityBehavior];
    
    //colisaioasidoafhdjs
    UIDynamicItemBehavior *coisaPesada = [[UIDynamicItemBehavior alloc] initWithItems:@[self.coliView]];
    coisaPesada.elasticity = 0.0f;
    [coisaPesada setDensity:20000000000.0];
    [self.animator addBehavior:coisaPesada];
    
    
    //COLISAO E GRAEVIDADE
    UIGravityBehavior* gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[redSquare ]];
    [self.animator addBehavior:gravityBehavior];
    
    UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[redSquare, self.coliView ]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collisionBehavior];
}

@end
