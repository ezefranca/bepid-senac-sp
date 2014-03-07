//
//  HWData.m
//  mapa-tab
//
//  Created by Ezequiel Franca dos Santos on 07/03/14.
//  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//

#import "HWData.h"
#import <MapKit/MapKit.h>

@implementation HWData
@synthesize str;
@synthesize ponto;
@synthesize ponto1;
@synthesize ponto2;
@synthesize ponto3;
@synthesize ponto4;
@synthesize loc;
@synthesize loc1;
@synthesize loc2;
@synthesize loc3;
@synthesize loc4;
@synthesize x1;
@synthesize x2;
@synthesize x3;
@synthesize x4;
@synthesize y1;
@synthesize y2;
@synthesize y3;
@synthesize y4;
static HWData *instance =nil;
+(HWData *)pegarCoordenada;
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance= [HWData new];
        }
    }
    return instance;
}
@end