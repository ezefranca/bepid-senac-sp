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
            first = FALSE;
        }
        else
        {
            if (dist < menor) {
                menor = dist;
            }
        }
        
        NSLog(@"%f - %f", l.coordinate.latitude , l.coordinate.longitude);
    }
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
