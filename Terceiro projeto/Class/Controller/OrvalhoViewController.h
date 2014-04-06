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
#import "ArduinoWebservice.h"

@interface OrvalhoViewController : UIViewController <RNFrostedSidebarDelegate>

@property ArduinoWebservice *arduino;
@property float temperaturaInicial;
@property float temperaturaFinal;
@property NSTimer *time;

@property (strong, nonatomic) IBOutlet UILabel *inicialLabel;
@property (strong, nonatomic) IBOutlet UILabel *finalLabel;
@property (strong, nonatomic) IBOutlet UILabel *atualLabel;
@property (strong, nonatomic) IBOutlet UIButton *plotaGrafico;

- (IBAction)FinishButton:(id)sender;
- (IBAction)btn:(id)sender;
- (IBAction)BeginButton:(id)sender;
- (IBAction)plotaGrafico:(id)sender;

-(void)abrirMenu;
-(void)atualizadorLabel;
@end
