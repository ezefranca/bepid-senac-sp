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


@interface biologiaViewController ()

@end

@implementation biologiaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    chave = FALSE;
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    //For CircleChart
    
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

- (IBAction)ligar_lampada:(id)sender {
    if (chave == FALSE) {
        chave = TRUE;
        self.imagemLampada.image = [UIImage imageNamed:@"lampadaAcesa.png"];
    }
    else{
        chave = FALSE;
        self.imagemLampada.image = [UIImage imageNamed:@"lampada"];
    }
}


-(void)userClickedOnLineKeyPoint:(CGPoint)point lineIndex:(NSInteger)lineIndex andPointIndex:(NSInteger)pointIndex{
    NSLog(@"Click Key on line %f, %f line index is %d and point index is %d",point.x, point.y,(int)lineIndex, (int)pointIndex);
}

-(void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex{
    NSLog(@"Click on line %f, %f, line index is %d",point.x, point.y, (int)lineIndex);
}

@end
