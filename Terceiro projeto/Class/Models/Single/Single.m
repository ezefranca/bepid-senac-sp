//
//  Single.m
//  TutsGame2
//
//  Created by GABRIEL VIEIRA on 05/12/13.
//  Copyright (c) 2013 GABRIEL VIEIRA. All rights reserved.
//



#import "Single.h"

@implementation Single


+(Single *) sharedStore
{
    static Single *sharedStore = nil;
    
    
    if(!sharedStore)
    {
        sharedStore = [[super allocWithZone:nil] init];
        
    }
    
    return sharedStore;
}

+(id) allocWithZone: (struct _NSZone *) zone
{
    return [self sharedStore];
}

-(id)init
{
    self = [super init];
    
    if (self)
    {
        if (self.optionIndex) {
            self.optionIndex = [[NSIndexSet alloc]init];
        }
    }
    
    return self;
}


@end
