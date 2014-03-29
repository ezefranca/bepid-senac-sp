//
//  OrvalhoViewController.m
//  RNFrostedSidebar
//
//  Created by Ezequiel Franca dos Santos on 28/03/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import "OrvalhoViewController.h"
#import "PNChart.h"
#import <math.h>

@interface OrvalhoViewController ()

@end

@implementation OrvalhoViewController

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
    
    // Valores que vem do arduino
    float Temperatura = 20, Umidade = 50;
    
    // Teste cálculo do ponto de orvalho
    
    // calculo veio daqui www.qsl.net/p/pp5vx//pp5tlm/pp5tlm-Rev5.pdf
    
    float a = 17.271;
    float b = 237.7;
    float temp = (a * Temperatura) / (b + Temperatura) + log(Umidade/100);
    float PontoDeOrvalho = (b * temp) / (a - temp);
    
    NSLog(@"Ponto de orvalho: %f", PontoDeOrvalho);
    
    UILabel * lineChartLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, SCREEN_WIDTH, 30)];
    lineChartLabel.text = @"Ponto de Orvalho";
    lineChartLabel.textColor = PNFreshGreen;
    lineChartLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:23.0];
    lineChartLabel.textAlignment = NSTextAlignmentCenter;
    
    PNLineChart * lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    lineChart.backgroundColor = [UIColor clearColor];
    [lineChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5",@"SEP 6",@"SEP 7"]];
    
    // Line Chart Nr.1
    NSArray * data01Array = @[@60.1, @160.1, @126.4, @262.2, @186.2, @127.2, @176.2];
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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
