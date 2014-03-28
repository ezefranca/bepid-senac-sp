//
//  SDbar.m
//  RNFrostedSidebar
//
//  Created by GABRIEL VIEIRA on 28/03/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import "SDbar.h"

@implementation SDbar

+(void)showSideBar : (id)delegate
{
    
    Single *s = [[Single alloc]init];
    
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
    
    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images selectedIndices: s.optionIndex borderColors:colors];
    //    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images];
    callout.delegate = delegate;
    //    callout.showFromRight = YES;
    [callout show];
}

@end
