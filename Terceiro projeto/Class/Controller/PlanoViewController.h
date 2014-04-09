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

- (IBAction)btn:(id)sender;
- (IBAction)burguer:(id)sender;

@property int angulo;

@property BOOL podeComecar;

@property ArduinoWebservice *arduino;
@property NSTimer *timer;
@property float tamanhoDaLinha;
@property (weak, nonatomic) IBOutlet UIImageView *transferidor;


-(void)animar;
-(void)abrirMenu;
@end
