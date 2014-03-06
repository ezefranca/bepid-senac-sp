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
    c.latitude = -23.668991;
    c.longitude = -46.701891;
    
    NSLog(@"%f - %f", c.latitude , c.longitude);
    
    MKPlacemark *place = [[MKPlacemark alloc]initWithCoordinate:self.map.userLocation.coordinate addressDictionary:nil];
        
    self.inicio = [[MKMapItem alloc]initWithPlacemark:place];
    
    MKPlacemark *place2 = [[MKPlacemark alloc]initWithCoordinate:c addressDictionary:nil];
    
    self.fim = [[MKMapItem alloc]initWithPlacemark:place2];
    
    [self obterDirecoes];
    
    
    if (self.inicio != nil && self.fim != nil) {
        _inicio = nil;
        _fim = nil;
        [_map removeOverlays:_map.overlays];
    }
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    self.renderer = [[MKPolygonRenderer alloc]initWithOverlay:overlay];
    self.renderer.strokeColor = [UIColor blueColor];
    self.renderer.lineWidth = 5.0;
    return self.renderer;
}

-(void)obterDirecoes
{
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc]init];
    request.source = self.inicio;
    request.destination = self.fim;
    request.requestsAlternateRoutes = YES;
    
   MKDirections *direcoes =  [[MKDirections alloc] initWithRequest:request];
    
    [direcoes calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        
        if (error) {
            NSLog(@"%@", error);
            NSLog(@"errro ao calcular a rota");
        }
        else
        {
            [self mostraRota:response];
        }
    }];
}


-(void)mostraRota:(MKDirectionsResponse *)response
{
    for (MKRoute *rota in response.routes) {
        
        [self.map addOverlay:rota.polyline level:MKOverlayLevelAboveRoads];
        
        for (MKRouteStep *step in rota.steps) {
            NSLog(@"%@", step.instructions);
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
