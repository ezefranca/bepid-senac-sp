//
//  HWThirdViewController.m
//  mapa-tab
//
//  Created by Ezequiel Franca dos Santos on 27/02/14.
//  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//

#import "HWThirdViewController.h"

@interface HWThirdViewController ()

@end

@implementation HWThirdViewController

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
    
    self.map.showsUserLocation = TRUE;
    self.map.delegate = self;
    
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
    self.map.showsUserLocation = TRUE;
    
    loc.latitude = -23.650;
    loc.longitude = -46.703;
    
    loc1.latitude = -23.640;
    loc1.longitude = -46.703;
    
    loc2.latitude = -23.630;
    loc2.longitude = -46.703;
    
    loc3.latitude = -23.650;
    loc3.longitude = -46.713;
    
    loc4.latitude = -23.650;
    loc4.longitude = -23.723;
    
    
    MKCoordinateRegion regiao;
    regiao.center = loc;
    
    ponto.coordinate = loc;
    ponto1.coordinate = loc1;
    ponto2.coordinate = loc2;
    ponto3.coordinate = loc3;
    ponto4.coordinate = loc4;
    //[self.mapa setDelegate:self];
    
    [self.map setRegion:regiao];
    [self.map addAnnotation:ponto];
    [self.map addAnnotation:ponto1];
    [self.map addAnnotation:ponto2];
    [self.map addAnnotation:ponto3];
    [self.map addAnnotation:ponto4];
   // self.map.userLocation.location.coordinate
    
    
    NSLog(@"%@", self.map.userLocation.location);
    
    BOOL first = TRUE;
    double x1,x2,y1,y2;
    double dx ;
    double dy;
    double dist;
    double menor;
    CLLocationCoordinate2D c;
    
    x1 = self.map.userLocation.location.coordinate.latitude;
    y1 = self.map.userLocation.location.coordinate.longitude;
    
    for (CLLocation *l in self.map.annotations) {
        
        x2 = l.coordinate.latitude;
        y2 = l.coordinate.longitude;

        dx = (x2-x1);
        dy = (y2-y1);
        dist = sqrt(dx*dx + dy*dy);
        
        dist = dist * (-1);
        
        if (first) {
            
            menor = dist;
            c.latitude = x2;
            c.longitude = y2;
            first = FALSE;
        }
        else
        {
            if (dist < menor) {
                menor = dist;
                c.latitude = x2;
                c.longitude = y2;
            }
        }
    }
    
    MKDirectionsRequest *directionsRequest = [MKDirectionsRequest new];
    // Start at our current location
    MKMapItem *source = [MKMapItem mapItemForCurrentLocation];
    [directionsRequest setSource:source];
    // Make the destination
    CLLocationCoordinate2D destinationCoords = c;
    
    MKPlacemark *destinationPlacemark = [[MKPlacemark alloc] initWithCoordinate:destinationCoords addressDictionary:nil];
    MKMapItem *destination = [[MKMapItem alloc] initWithPlacemark:destinationPlacemark];
    [directionsRequest setDestination:destination];
    
    MKDirections *directions = [[MKDirections alloc] initWithRequest:directionsRequest];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        // We're done
        
        
        // Now handle the result
        if (error) {
            NSLog(@"There was an error getting your directions");
            return;
        }
        
        // So there wasn't an error - let's plot those routes
        _currentRoute = [response.routes firstObject];
        [self plotRouteOnMap:_currentRoute];
    }];
    
}




#pragma mark - Utility Methods
- (void)plotRouteOnMap:(MKRoute *)route
{
    if(_routeOverlay) {
        [self.map removeOverlay:_routeOverlay];
    }
    
    // Update the ivar
    _routeOverlay = route.polyline;
    
    // Add it to the map
    [self.map addOverlay:_routeOverlay];
    
}


#pragma mark - MKMapViewDelegate methods
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
    renderer.strokeColor = [UIColor redColor];
    renderer.lineWidth = 4.0;
    return  renderer;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
