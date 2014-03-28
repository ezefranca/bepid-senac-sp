//
//  Single.h
//  TutsGame2
//
//  Created by GABRIEL VIEIRA on 05/12/13.
//  Copyright (c) 2013 GABRIEL VIEIRA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RNFrostedSidebar.h"


@class Single;
@interface Single : NSObject

@property NSIndexSet *optionIndex;


+(Single *) sharedStore;


@end
