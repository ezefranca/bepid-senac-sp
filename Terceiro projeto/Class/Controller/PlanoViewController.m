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
        self.arduino = [[ArduinoWebservice alloc]init] ;
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
    [self.arduino reloadData];
    
    
    self.angulo = [self.arduino returnData:@"altura"];
    self.podeComecar = NO;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btn:(id)sender
{
    for (UIView *u in self.view.subviews) {
        if ([u class] != [UIButton class]) {
            [u removeFromSuperview];
        }
    }

    
    [self.arduino reloadData];
    self.angulo = [self.arduino returnData:@"altura"];
    self.tamanhoDaLinha = sin(DEGREES_TO_RADIANS(self.angulo))*1024;
    NSLog(@"%f", self.tamanhoDaLinha);
    
    if(self.angulo <= 45)
    {
        self.tamanhoDaLinha = 1004;
    }
    else if (self.angulo <= 70)
    {
        self.tamanhoDaLinha = 750;
    }
    else
    {
        self.tamanhoDaLinha = 700;
    }

    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 400, self.tamanhoDaLinha, 20)];
    line.backgroundColor = [UIColor yellowColor];
    [line setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(self.angulo))];
    [self.view addSubview:line];
    
    self.podeComecar = YES;
}



-(void)animar
{
    
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
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 400, self.tamanhoDaLinha, 20)];
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
    [elasticityBehavior setDensity:1];
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

-(void)abrirMenu
{
    [SDbar showSideBar:self];
}

- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    
    [SDbar changeController:index :self ];
}

- (IBAction)burguer:(id)sender {
    [SDbar showSideBar:self];
}
@end
