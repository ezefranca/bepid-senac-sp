//
//  PlanoViewController.h
//  RNFrostedSidebar
//
//  Created by GABRIEL VIEIRA on 28/03/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNFrostedSidebar.h"
#import "ArduinoWebservice.h"

@interface PlanoViewController : UIViewController <RNFrostedSidebarDelegate>
@property UIDynamicAnimator *animator;

- (IBAction)nextBtn:(id)sender;
- (IBAction)btn:(id)sender;
- (IBAction)burguer:(id)sender;
- (IBAction)tartarugaInfo:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *informacaoView;
@property (strong, nonatomic) IBOutlet UITextView *textoInformativo;
@property BOOL turtleVisible;

@property int angulo;

@property BOOL podeComecar;

@property ArduinoWebservice *arduino;
@property NSTimer *timer;
@property float tamanhoDaLinha;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (weak, nonatomic) IBOutlet UILabel *anguloLabel;


-(void)animar;
-(void)abrirMenu;
@end
