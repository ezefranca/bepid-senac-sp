//
//  ViewController.m
//  RNFrostedSidebar
//
//  Created by Ryan Nystrom on 8/13/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//

#import "ViewController.h"
#import "tempViewController.h"
#import "SensoresViewController.h"
#import "PNChart.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableIndexSet *optionIndices;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.optionIndices = [NSMutableIndexSet indexSetWithIndex:1];
}

- (IBAction)onBurger:(id)sender {
    NSArray *images = @[
                        [UIImage imageNamed:@"home"],
                        [UIImage imageNamed:@"perfil"],
                        [UIImage imageNamed:@"sensores"],
                        [UIImage imageNamed:@"controle"],
                        [UIImage imageNamed:@"configuracoes"]];
    
    
    NSArray *colors = @[
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1],
                        [UIColor colorWithRed:255/255.f green:137/255.f blue:167/255.f alpha:1],
                        [UIColor colorWithRed:126/255.f green:242/255.f blue:195/255.f alpha:1],
                        [UIColor colorWithRed:119/255.f green:152/255.f blue:255/255.f alpha:1],
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1]];
    
    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images selectedIndices:self.optionIndices borderColors:colors];
//    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images];
    callout.delegate = self;
//    callout.showFromRight = YES;
    [callout show];
}

#pragma mark - RNFrostedSidebarDelegate

- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    NSLog(@"Tapped item at index %i",index);
    
    
    if (index == 1) {
        tempViewController *t = [[tempViewController alloc]initWithNibName:@"tempViewController" bundle:nil];
        
        [self presentModalViewController:t animated:NO];
    }
    
    if (index == 2) {
        SensoresViewController *s = [[SensoresViewController alloc]initWithNibName:@"SensoresViewController" bundle:nil];
        [self presentViewController:s animated:NO completion:nil];
    }
}

- (void)sidebar:(RNFrostedSidebar *)sidebar didEnable:(BOOL)itemEnabled itemAtIndex:(NSUInteger)index {
    if (itemEnabled) {
        [self.optionIndices addIndex:index];
        NSLog(@"colocou");
    }
    else {
        [self.optionIndices removeIndex:index];
        NSLog(@"tirou");
    }
    
  
}

@end
