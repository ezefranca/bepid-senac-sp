//
//  HWSecondViewController.h
//  mapa-tab
//
//  Created by Ezequiel Franca dos Santos on 27/02/14.
//  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface HWSecondViewController : UIViewController
- (IBAction)mapType:(id)sender;
@property (strong, nonatomic) IBOutlet MKMapView *mapa;

@end
