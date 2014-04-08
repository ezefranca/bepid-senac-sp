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
#import "SDbar.h"

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
    UISwipeGestureRecognizer *gestoPorra = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(abrirMenu)];
    [gestoPorra setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:gestoPorra];
    
    self.angulo = 30;
    self.podeComecar = NO;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)abrirMenu
{
    [SDbar showSideBar:self];
}

- (IBAction)btn:(id)sender
{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 400, 1004, 20)];
    line.backgroundColor = [UIColor yellowColor];
    [line setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(self.angulo))];
    [self.view addSubview:line];
    
    self.podeComecar = YES;
}

-(void)animar
{
    
}



- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    
    [SDbar changeController:index :self ];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPoint = [touch locationInView:self.view] ;
    
    
    //OBJETOS
    if (self.podeComecar) {
  
    //quadrado
        [self.animator removeAllBehaviors];
    
        for (UIView *u in self.view.subviews) {
            if ([u class] != [UIButton class]) {
                [u removeFromSuperview];
            }
        }

    
    //linha
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 400, 1004, 20)];
    line.backgroundColor = [UIColor yellowColor];
    [line setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(self.angulo))];
    [self.view addSubview:line];
    
    
    
    UIView *redSquare = [[UIView alloc]initWithFrame:CGRectMake(touchPoint.x, touchPoint.y, 50, 50)];
    redSquare.backgroundColor = [UIColor redColor];
    [redSquare setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(self.angulo
                                                                             ))];
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

}



//Per saperne di più: http://www.iprog.it/blog/objective-c-ios/nstimer-creare-un-cronometro-per-iphone/ | iProg
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
