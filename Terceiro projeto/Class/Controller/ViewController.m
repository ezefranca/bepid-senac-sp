//
//  ViewController.m
//  RNFrostedSidebar
//
//  Created by Ryan Nystrom on 8/13/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//

#import "ViewController.h"
#import "tempViewController.h"
#import "SensoresViewController.h"
#import "PNChart.h"
#import "PlanoViewController.h"
#import "OrvalhoViewController.h"
#include "ArduinoWebservice.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableIndexSet *optionIndices;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *gestoPorra = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(abrirMenu)];
    [gestoPorra setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:gestoPorra];
    
   
}

-(void)viewDidAppear:(BOOL)animated
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 5;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;

    [[[self tut ]layer]addAnimation:rotationAnimation forKey:nil];
}

- (IBAction)botaoTeste:(id)sender {
    /*
    ArduinoWebservice *a = [[ArduinoWebservice alloc]init];
   [a initWithRequest];
   [a conectaEFiltra:@"temperatura"];
     */
}

-(void)abrirMenu
{
    //
    [SDbar showSideBar:self];
}

- (IBAction)onBurger:(id)sender {
    [self abrirMenu];
}

#pragma mark - RNFrostedSidebarDelegate

- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    
    [SDbar changeController:index :self ];
}

- (void)sidebar:(RNFrostedSidebar *)sidebar didEnable:(BOOL)itemEnabled itemAtIndex:(NSUInteger)index {
    if (itemEnabled) {
        [self.optionIndices addIndex:index];
        NSLog(@"colocou");
    }
    else {
        [self.optionIndices removeIndex:index];
        NSLog(@"tirou");
    }
    
  
}

@end
