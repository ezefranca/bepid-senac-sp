//
//  SecondViewController.h
//  shakeShop
//
//  Created by GABRIEL VIEIRA on 10/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface SecondViewController : UIViewController{
    NSMutableDictionary *fretes;
    NSMutableDictionary *rotas;
    IBOutlet UIActivityIndicatorView *spiner;
    CLLocationCoordinate2D destinoEntrega;
    MKPointAnnotation *ponto;
}
- (IBAction)botaoMapa:(id)sender;
- (IBAction)TESTE:(id)sender;
- (void)consultaCorreio;
@property (strong, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) IBOutlet UILabel *precoPac;
@property (strong, nonatomic) IBOutlet UILabel *precoSedex;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *spiner;
@property (weak, nonatomic) IBOutlet UITextField *labelCEP;
//@property CLLocationCoordinate2D destinoEntrega;

@end
