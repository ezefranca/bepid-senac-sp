//
//  PlanoViewController.h
//  RNFrostedSidebar
//
//  Created by GABRIEL VIEIRA on 28/03/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNFrostedSidebar.h"

@interface PlanoViewController : UIViewController <RNFrostedSidebarDelegate>
@property UIDynamicAnimator *animator;

- (IBAction)btn:(id)sender;

@property int angulo;

@property BOOL podeComecar;

@property NSTimer *timer;

-(void)updateTimer;
-(void)animar;
-(void)abrirMenu;
@end
