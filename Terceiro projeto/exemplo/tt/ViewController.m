//
//  ViewController.m
//  tt
//
//  Created by GABRIEL VIEIRA on 31/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

#import "ViewController.h"
#import "RightSlidedown.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //OBJETOS
    
    RightSlidedown *r = [[RightSlidedown alloc]initWithTarget:self action:@selector(coisa)];
    [[self view ] addGestureRecognizer:r];
    //quadrado
    self.redSquare = [[UIView alloc]initWithFrame:CGRectMake(20, 242, 50, 50)];
    self.redSquare.backgroundColor = [UIColor redColor];
    [self.redSquare setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(20))];
    [self.view addSubview:self.redSquare];
    
    
    //linha
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, 300, 320, 20)];
    self.line.backgroundColor = [UIColor yellowColor];
    [self.line setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(20))];
    [self.view addSubview:self.line];
    
    // INICIAR ANIMACAO
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    
    //CUSTON
    
    //quadrado
    UIDynamicItemBehavior *elasticityBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.redSquare]];
    elasticityBehavior.elasticity = 0.0f;
    [elasticityBehavior setDensity:0.0];
    [self.animator addBehavior:elasticityBehavior];
    
    //linha
    UIDynamicItemBehavior *teste = [[UIDynamicItemBehavior alloc] initWithItems:@[self.line]];
    [teste setDensity:50000000.0];
    [teste setFriction:0.3];
    [self.animator addBehavior:teste];
    
    
    //COLISAO E GRAEVIDADE
    UIGravityBehavior* gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.redSquare ]];
    [self.animator addBehavior:gravityBehavior];
    
    UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.redSquare , self.line]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collisionBehavior];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)coisa
{
    [self.animator removeAllBehaviors];
    
    for (UIView *u in self.view.subviews) {
        if ([u class] != [UIButton class]) {
            [u removeFromSuperview];
        }
    }
    
    //OBJETOS
    
    //quadrado
    self.redSquare = [[UIView alloc]initWithFrame:CGRectMake(20, 200, 50, 50)];
    self.redSquare.backgroundColor = [UIColor redColor];
    [self.redSquare setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(20))];
    [self.view addSubview:self.redSquare];
    
    
    //linha
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, 300, 320, 20)];
    self.line.backgroundColor = [UIColor yellowColor];
    [self.line setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(20))];
    [self.view addSubview:self.line];
    
    // INICIAR ANIMACAO
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    
    
    //CUSTON
    
    //quadrado
    UIDynamicItemBehavior *elasticityBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.redSquare]];
    elasticityBehavior.elasticity = 0.0f;
    [elasticityBehavior setDensity:0.0];
    [self.animator addBehavior:elasticityBehavior];
    
    //linha
    UIDynamicItemBehavior *teste = [[UIDynamicItemBehavior alloc] initWithItems:@[self.line]];
    [teste setDensity:50000000.0];
    [teste setFriction:0.3];
    [self.animator addBehavior:teste];
    
    
    //COLISAO E GRAEVIDADE
    UIGravityBehavior* gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.redSquare]];
    [self.animator addBehavior:gravityBehavior];
    
    UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.redSquare , self.line]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collisionBehavior];

}

- (IBAction)zerar:(id)sender {
    [self coisa];
   }
@end
