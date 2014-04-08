//
//  Single.h
//  TutsGame2
//
//  Created by GABRIEL VIEIRA on 05/12/13.
//  Copyright (c) 2013 GABRIEL VIEIRA. All rights reserved.
//



// create structure to store function pointers
typedef struct
{
    float temperaturaInicial;
    float TemperaturaFinal;
    float temperaturaAtual;
}Temperatura;



#import <Foundation/Foundation.h>
#import "RNFrostedSidebar.h"


@class Single;
@interface Single : NSObject

@property NSIndexSet *optionIndex;
@property Temperatura temperatura;
@property RNFrostedSidebar *bar;

+(Single *) sharedStore;
-(RNFrostedSidebar *)returnBar;


@end
