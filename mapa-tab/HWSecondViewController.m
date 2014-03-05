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
    CLLocationCoordinate2D loc1;
    CLLocationCoordinate2D loc2;
    CLLocationCoordinate2D loc3;
    CLLocationCoordinate2D loc4;
    
    MKPointAnnotation *ponto = [[MKPointAnnotation alloc]init];
    MKPointAnnotation *ponto1 = [[MKPointAnnotation alloc]init];
    MKPointAnnotation *ponto2 = [[MKPointAnnotation alloc]init];
    MKPointAnnotation *ponto3 = [[MKPointAnnotation alloc]init];
    MKPointAnnotation *ponto4 = [[MKPointAnnotation alloc]init];
    //MKAnnotationView *anotView;
    
    
    
    loc.latitude = -23.650;
    loc.longitude = -46.703;
    
    loc1.latitude = -23.640;
    loc1.longitude = -46.703;
    
    loc2.latitude = -23.630;
    loc2.longitude = -46.703;
    
    loc3.latitude = -23.650;
    loc3.longitude = -46.713;
    
    loc4.latitude = -23.650;
    loc4.longitude = -46.723;
    
    
    MKCoordinateRegion regiao;
    regiao.center = loc;
    
    ponto.coordinate = loc;
    ponto1.coordinate = loc1;
    ponto2.coordinate = loc2;
    ponto3.coordinate = loc3;
    ponto4.coordinate = loc4;
    //[self.mapa setDelegate:self];

    [self.mapa setRegion:regiao];
    [self.mapa addAnnotation:ponto];
    [self.mapa addAnnotation:ponto1];
    [self.mapa addAnnotation:ponto2];
    [self.mapa addAnnotation:ponto3];
    [self.mapa addAnnotation:ponto4];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(MKAnnotationView*)mapView:(MKMapView*)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    // If you are showing the users location on the map you don't want to change it
    MKAnnotationView *view = nil;
    if (annotation != mapView.userLocation) {
        // This is not the users location indicator (the blue dot)
        view = [mapView dequeueReusableAnnotationViewWithIdentifier:@"myAnnotationIdentifier"];
        if (!view) {
            // Could not reuse a view ...
            
            // Creating a new annotation view
            view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotationIdentifier"];
            
            // This will rescale the annotation view to fit the image
            view.image = [UIImage imageNamed:@"ico.png"];
        }
    }
    return view;
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
