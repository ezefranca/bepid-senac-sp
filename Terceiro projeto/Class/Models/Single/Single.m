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
        
        if(!self.bar)
        {
            NSArray *images = @[
                                [UIImage imageNamed:@"gear"],
                                [UIImage imageNamed:@"globe"],
                                [UIImage imageNamed:@"profile"],
                                [UIImage imageNamed:@"star"],
                                [UIImage imageNamed:@"gear"]];
            
            
            NSArray *colors = @[
                                [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                                [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                                [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                                [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                                [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1]];
            
            self.bar = [[RNFrostedSidebar alloc] initWithImages:images selectedIndices: self.optionIndex borderColors:colors];

        }
    }
    
    return self;
}

-(RNFrostedSidebar *)returnBar
{
    return self.bar;
}


@end
