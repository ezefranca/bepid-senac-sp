//
//  HWData.h
//  mapa-tab
//
//  Created by Ezequiel Franca dos Santos on 07/03/14.
//  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface HWData : NSObject {
    NSString *str;
    MKPointAnnotation *ponto;
    MKPointAnnotation *ponto1;
    MKPointAnnotation *ponto2;
    MKPointAnnotation *ponto3;
    MKPointAnnotation *ponto4;
    CLLocationCoordinate2D loc, loc1, loc2, loc3, loc4;
    
    double x1, x2, x3, x4;
    double y1, y2, y3, y4;
}
@property(nonatomic,retain)NSString *str;
@property(nonatomic,retain)MKPointAnnotation *ponto;
@property(nonatomic,retain)MKPointAnnotation *ponto1;
@property(nonatomic,retain)MKPointAnnotation *ponto2;
@property(nonatomic,retain)MKPointAnnotation *ponto3;
@property(nonatomic,retain)MKPointAnnotation *ponto4;
@property(atomic)CLLocationCoordinate2D loc;
@property(atomic)CLLocationCoordinate2D loc1;
@property(nonatomic)CLLocationCoordinate2D loc2;
@property(nonatomic)CLLocationCoordinate2D loc3;
@property(nonatomic)CLLocationCoordinate2D loc4;
//
@property(atomic)double x1;
@property(atomic)double x2;
@property(nonatomic)double x3;
@property(nonatomic)double x4;
@property(nonatomic)double y1;
@property(nonatomic)double y2;
@property(nonatomic)double y3;
@property(nonatomic)double y4;

+(HWData*)pegarCoordenada;
@end
