//
//  Simulation.m
//  RNFrostedSidebar
//
//  Created by GABRIEL VIEIRA on 02/04/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

#import "Simulation.h"

@implementation Simulation

-(id)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

-(void)start : (UIView *) view : (UIDynamicAnimator *) animator ;
{

    NSLog(@"%f   %f", view.bounds.size.height ,view.bounds.size.width );
    
    //OBJETOS

    //quadrado
    UIView *redSquare = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 50, 50)];
    redSquare.backgroundColor = [UIColor redColor];
    [redSquare setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(20))];
    [view addSubview:redSquare];
    
    
    //linha
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 300, 320, 20)];
    line.backgroundColor = [UIColor yellowColor];
    // [self.line setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(20))];
    [view addSubview:line];
    
    // INICIAR ANIMACAO
     animator = [[UIDynamicAnimator alloc] initWithReferenceView:view];
    
    //CUSTON
    
    //quadrado
    UIDynamicItemBehavior *elasticityBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[redSquare]];
    elasticityBehavior.elasticity = 0.0f;
    [elasticityBehavior setDensity:0.0];
    [elasticityBehavior setElasticity:1.0   ];
    [animator addBehavior:elasticityBehavior];
    
    //linha
    UIDynamicItemBehavior *teste = [[UIDynamicItemBehavior alloc] initWithItems:@[line]];
    [teste setDensity:50000000.0];
    [teste setFriction:0.3];
    [animator addBehavior:teste];
    
    
    //COLISAO E GRAEVIDADE
    UIGravityBehavior* gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[redSquare ]];
    [animator addBehavior:gravityBehavior];
    
    UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[redSquare , line]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:collisionBehavior];

}

@end
