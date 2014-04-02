//
//  PlanoViewController.m
//  RNFrostedSidebar
//
//  Created by GABRIEL VIEIRA on 28/03/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#import "PlanoViewController.h"
#import "Simulation.h"

@interface PlanoViewController ()

@end

@implementation PlanoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.animator = [[UIDynamicAnimator alloc]init];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn:(id)sender {
    [self animar];
}

-(void)animar
{
    NSLog(@"%f   %f", self.view.bounds.size.height ,self.view.bounds.size.width );
    
    //OBJETOS
    
    //quadrado
    [self.animator removeAllBehaviors];
    
    for (UIView *u in self.view.subviews) {
        if ([u class] != [UIButton class]) {
            [u removeFromSuperview];
        }
    }
    
    float rotacao = 40;
    
    //linha
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 400, 1024, 20)];
    line.backgroundColor = [UIColor yellowColor];
    [line setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(rotacao))];
    [self.view addSubview:line];
    
    
    float x = 1024* cos(DEGREES_TO_RADIANS(rotacao));
    float y = 1024* sin(DEGREES_TO_RADIANS(rotacao));
    
    NSLog(@"%d   %d -  %f   %f",  0 , 400 , x , y);
    
    
    UIView *redSquare = [[UIView alloc]initWithFrame:CGRectMake((x - 1024) *(-1), y, 50, 50)];
    redSquare.backgroundColor = [UIColor redColor];
    [redSquare setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(rotacao))];
    [self.view addSubview:redSquare];

    // INICIAR ANIMACAO
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    //CUSTON
    
    //quadrado
    UIDynamicItemBehavior *elasticityBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[redSquare]];
    elasticityBehavior.elasticity = 0.0f;
    [elasticityBehavior setDensity:20.0];
   // [elasticityBehavior setElasticity:1.0   ];
    [self.animator addBehavior:elasticityBehavior];
    
    //linha
    UIDynamicItemBehavior *teste = [[UIDynamicItemBehavior alloc] initWithItems:@[line]];
    [teste setDensity:50000000.0];
    [teste setFriction:0.3];
    [self.animator addBehavior:teste];
    
    
    //COLISAO E GRAEVIDADE
    UIGravityBehavior* gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[redSquare ]];
    [self.animator addBehavior:gravityBehavior];
    
    UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[redSquare , line]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collisionBehavior];
}

/*
- (IBAction)slide:(id)sender {
    UISlider *s = sender;
    CGPoint c = CGPointMake(500, 200);
    
    // Change the position explicitly.
    CABasicAnimation* theAnim = [CABasicAnimation animationWithKeyPath:@"position"];
    theAnim.fromValue = [NSValue valueWithCGPoint:self.tut.layer.position];
    theAnim.toValue = [NSValue valueWithCGPoint:c];
    theAnim.duration = s.value * 6;
    theAnim.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.3 :0 :1 :0.3 ];
    theAnim.removedOnCompletion = NO;
    
    [[[self tut]layer]addAnimation:theAnim forKey:@"coco"];
    
    NSLog(@"%f", s.value);

}
 */
@end
