//
//  SDbar.m
//  RNFrostedSidebar
//
//  Created by GABRIEL VIEIRA on 28/03/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import "SDbar.h"
#import "tempViewController.h"
#import "SensoresViewController.h"  
#import "PlanoViewController.h"
#import "OrvalhoViewController.h"
#import "biologiaViewController.h"
#import "GraficoOrvalhoViewController.h"
#import "ViewController.h"

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

+(void)changeController : (int)index : (UIViewController *) controller
{
    
    if (index == 0) {
        ViewController *t = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
        
        [controller presentViewController:t animated:NO completion:^{ NSLog(@"troquei"); }];
    }
    
    if (index == 1) {
        tempViewController *t = [[tempViewController alloc]initWithNibName:@"tempViewController" bundle:nil];
        
        [controller presentViewController:t animated:NO completion:^{ NSLog(@"troquei"); }];
    }
    
    if (index == 2) {
        SensoresViewController *s = [[SensoresViewController alloc]initWithNibName:@"SensoresViewController" bundle:nil];
        [controller presentViewController:s animated:NO completion:nil];
    }
    
    if (index == 3) {
        OrvalhoViewController *o = [[OrvalhoViewController alloc]initWithNibName:@"OrvalhoViewController" bundle:nil];
        [controller presentViewController:o animated:NO completion:nil];
    }
    
    if (index == 4) {
        PlanoViewController *s = [[PlanoViewController alloc]initWithNibName:@"PlanoViewController" bundle:nil];
        [controller presentViewController:s animated:NO completion:nil];
    }
    
    //-------------------> Biologia
    if (index == 5) {
        biologiaViewController *o = [[biologiaViewController alloc]initWithNibName:@"biologiaViewController" bundle:nil];
        [controller presentViewController:o animated:YES completion:nil];
    }
    
    //---------------------------- Grafico ponto orvalho
    if (index == 6) {
        GraficoOrvalhoViewController *o = [[GraficoOrvalhoViewController alloc]initWithNibName:@"GraficoOrvalhoViewController" bundle:nil];
        [controller presentViewController:o animated:YES completion:nil];
        
    }
}

@end
