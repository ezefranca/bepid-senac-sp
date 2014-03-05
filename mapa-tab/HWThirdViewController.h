//
//  HWThirdViewController.h
//  mapa-tab
//
//  Created by Ezequiel Franca dos Santos on 27/02/14.
//  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface HWThirdViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic)  MKMapView *map;
@property (strong, nonatomic)  MKMapItem *inicio;

@property (strong, nonatomic)  MKMapItem *fim;
@property (strong, nonatomic)  MKPolygonRenderer *renderer;

-(void)obterDirecoes;
-(void)mostraRota : (MKDirectionsResponse *)response;

@end
