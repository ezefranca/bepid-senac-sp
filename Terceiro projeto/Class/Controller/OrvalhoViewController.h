//
//  OrvalhoViewController.h
//  RNFrostedSidebar
//
//  Created by Ezequiel Franca dos Santos on 28/03/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNFrostedSidebar.h"
#import "PNChart.h"
#import "Single.h"
#import "ArduinoWebservice.h"

@interface OrvalhoViewController : UIViewController <RNFrostedSidebarDelegate>

@property UIDynamicAnimator *animator;

@property ArduinoWebservice *arduino;
@property float temperaturaInicial;
@property float temperaturaFinal;
@property float temperaturaAtual;
@property Single *single;
@property NSTimer *time;

@property BOOL podeComecar;
@property int angulo;

@property (strong, nonatomic) IBOutlet UILabel *inicialLabel;
@property (strong, nonatomic) IBOutlet UILabel *finalLabel;
@property (strong, nonatomic) IBOutlet UILabel *atualLabel;
@property (strong, nonatomic) IBOutlet UIButton *plotaGrafico;
@property BOOL turtleVisible;

- (IBAction)FinishButton:(id)sender;
- (IBAction)btn:(id)sender;
- (IBAction)BeginButton:(id)sender;
- (IBAction)plotaGrafico:(id)sender;
- (IBAction)tartarugaInfo:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *informacaoView;

-(void)abrirMenu;
-(void)atualizadorLabel;
-(void)desenhaGelinho;

-(void)atualizaBackground;
@end
