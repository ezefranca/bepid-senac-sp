//
//  biologiaViewController.m
//  RNFrostedSidebar
//
//  Created by Ezequiel Franca dos Santos on 04/04/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import "biologiaViewController.h"
#import "SDbar.h"
#import "PNChart.h"
#import "OrvalhoViewController.h"


@interface biologiaViewController ()

@end

@implementation biologiaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.arduino = [[ArduinoWebservice alloc]init] ;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    self.swithLamp.on = FALSE;
    
    self.time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(atualizadorLabel) userInfo:nil repeats:YES];
    //For CircleChart
    
    UISwipeGestureRecognizer *gestoPorra = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(abrirMenu)];
    [gestoPorra setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:gestoPorra];
    
    PNCircleChart * circleChart = [[PNCircleChart alloc] initWithFrame:CGRectMake(50, 150.0, SCREEN_WIDTH, 150.0) andTotal:[NSNumber numberWithInt:100] andCurrent:[NSNumber numberWithInt:60] andClockwise:YES];
    circleChart.backgroundColor = [UIColor clearColor];
    [circleChart setStrokeColor:PNYellow];
    [circleChart strokeChart];
    
    [[self view]addSubview:circleChart];
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

- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    
    [SDbar changeController:index :self ];
}


-(void)userClickedOnLineKeyPoint:(CGPoint)point lineIndex:(NSInteger)lineIndex andPointIndex:(NSInteger)pointIndex{
    NSLog(@"Click Key on line %f, %f line index is %d and point index is %d",point.x, point.y,(int)lineIndex, (int)pointIndex);
}

-(void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex{
    NSLog(@"Click on line %f, %f, line index is %d",point.x, point.y, (int)lineIndex);
}

-(void)atualizadorLabel
{
    [self.arduino reloadData];
    self.labelLuminosidade.text = [NSString stringWithFormat:@"%2f C", [self.arduino returnData:@"luminosidade"]];
}

- (IBAction)onLamp:(id)sender
{
    UISwitch *s = sender;
     if (s.on) {
    
     self.imagemLampada.image = [UIImage imageNamed:@"lampadaAcesa.png"];
     }
     else{
     
     self.imagemLampada.image = [UIImage imageNamed:@"lampada"];
     }
    
}
- (IBAction)btnBar:(id)sender {
    [SDbar showSideBar:self];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [self.time invalidate];
    self.time = nil;
}
@end
