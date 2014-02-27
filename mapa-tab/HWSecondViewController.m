//
//  HWSecondViewController.m
//  mapa-tab
//
//  Created by Ezequiel Franca dos Santos on 27/02/14.
//  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//

#import "HWSecondViewController.h"

@interface HWSecondViewController ()

@end

@implementation HWSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CLLocationCoordinate2D loc;
    MKPointAnnotation *ponto = [[MKPointAnnotation alloc]init];
    
    loc.latitude = -23.650;
    loc.longitude = -46.703;
    
    MKCoordinateRegion regiao;
    regiao.center = loc;
    ponto.coordinate = loc;
    
    [self.mapa setRegion:regiao];
    [self.mapa addAnnotation:ponto];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mapType:(id)sender {
    NSInteger opcaoescolhida = [sender selectedSegmentIndex];
    switch (opcaoescolhida) {
        case 0:
            [[self mapa] setMapType:MKMapTypeStandard];
            break;
        case 1:
            [[self mapa] setMapType:MKMapTypeSatellite];
            break;
        case 2:
            [[self mapa] setMapType:MKMapTypeHybrid];
            break;
        default:
            break;
    }
}
@end
