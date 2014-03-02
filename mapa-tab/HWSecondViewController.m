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
    //MKAnnotationView *anotView;
    
    loc.latitude = -23.650;
    loc.longitude = -46.703;
    
    MKCoordinateRegion regiao;
    regiao.center = loc;
    ponto.coordinate = loc;
    
    //[self.mapa setDelegate:self];
    
    
    
    [self.mapa setRegion:regiao];
    [self.mapa addAnnotation:ponto];
    
    
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
