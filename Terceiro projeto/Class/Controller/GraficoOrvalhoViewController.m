//
//  GraficoOrvalhoViewController.m
//  RNFrostedSidebar
//
//  Created by Ezequiel Franca dos Santos on 04/04/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import "GraficoOrvalhoViewController.h"
#import "PNChart.h"
#import "Single.h"

@interface GraficoOrvalhoViewController ()

@end

@implementation GraficoOrvalhoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Single *dadosTemperatura = [[Single alloc]init];
    
    
    UILabel * lineChartLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 1004, 30)];
    lineChartLabel.text = @"Estimated Dew Point Curve";
    lineChartLabel.textColor = PNTwitterColor;
    lineChartLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:23.0];
    lineChartLabel.textAlignment = NSTextAlignmentCenter;
    
    PNLineChart * lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(200, 200, 1004, 500)];
    lineChart.backgroundColor = [UIColor clearColor];
    [lineChart setXLabels:@[@"Start Time", @"Final Time"]];
    [lineChart setYLabels:@[@"Temperature"]];
    
    // Line Chart Nr.1
    
    NSNumber *inicio = [[NSNumber alloc]initWithFloat:dadosTemperatura.temperatura.temperaturaInicial];
    NSNumber *final = [[NSNumber alloc]initWithFloat:dadosTemperatura.temperatura.TemperaturaFinal];
    NSArray * data01Array = [[NSArray alloc]initWithObjects: inicio, final, nil];
    
    
    
    PNLineChartData *data01 = [PNLineChartData new];
    data01.color = PNFreshGreen;
    data01.itemCount = lineChart.xLabels.count;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [[data01Array objectAtIndex:index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    lineChart.chartData = @[data01];
    [lineChart strokeChart];
    
    lineChart.delegate = self;
    
    [self.view addSubview:lineChartLabel];
    [self.view addSubview:lineChart];
    
    self.title = @"Dew Point";

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)userClickedOnLineKeyPoint:(CGPoint)point lineIndex:(NSInteger)lineIndex andPointIndex:(NSInteger)pointIndex{
    
    [LabelDeBaixo removeFromSuperview];
    LabelDeBaixo = [[UILabel alloc] initWithFrame:CGRectMake(0, 700, 1004, 30)];
    LabelDeBaixo.text = @"";
    NSString * textoEixoX = [NSString stringWithFormat:@"Value X: %f", point.x];
    NSString * textoEixoY = [NSString stringWithFormat:@"Value Y: %f", point.y];
    LabelDeBaixo.text = [NSString stringWithFormat:@"%@    %@", textoEixoX, textoEixoY];
    LabelDeBaixo.textColor = PNTwitterColor;
    LabelDeBaixo.font = [UIFont fontWithName:@"Avenir-Medium" size:30.0];
    LabelDeBaixo.textAlignment = NSTextAlignmentCenter;
    
    
    NSLog(@"Click Key on line %f, %f line index is %d and point index is %d",point.x, point.y,(int)lineIndex, (int)pointIndex);
    
     [self.view addSubview:LabelDeBaixo];
}

-(void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex{
    NSLog(@"Click on line %f, %f, line index is %d",point.x, point.y, (int)lineIndex);
    
    [LabelDeBaixo removeFromSuperview];
    LabelDeBaixo = [[UILabel alloc] initWithFrame:CGRectMake(0, 700, 1004, 30)];
    LabelDeBaixo.text = @"";
    NSString * textoEixoX = [NSString stringWithFormat:@"Value X: %f", point.x];
    NSString * textoEixoY = [NSString stringWithFormat:@"Value Y: %f", point.y];
    LabelDeBaixo.text = [NSString stringWithFormat:@"%@    %@", textoEixoX, textoEixoY];
    LabelDeBaixo.textColor = PNTwitterColor;
    LabelDeBaixo.font = [UIFont fontWithName:@"Avenir-Medium" size:30.0];
    LabelDeBaixo.textAlignment = NSTextAlignmentCenter;

     [self.view addSubview:LabelDeBaixo];
}


- (IBAction)btn:(id)sender {
}
@end
