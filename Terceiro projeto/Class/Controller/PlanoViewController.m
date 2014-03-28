//
//  PlanoViewController.m
//  RNFrostedSidebar
//
//  Created by GABRIEL VIEIRA on 28/03/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import "PlanoViewController.h"

@interface PlanoViewController ()

@end

@implementation PlanoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)slide:(id)sender {
     UISlider *s = sender;
    CGPoint c = CGPointMake(500, 200);
    
    // Change the position explicitly.
    CABasicAnimation* theAnim = [CABasicAnimation animationWithKeyPath:@"position"];
    theAnim.fromValue = [NSValue valueWithCGPoint:self.tut.layer.position];
    theAnim.toValue = [NSValue valueWithCGPoint:c];
    theAnim.duration = s.value * 6;
    theAnim.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.3 :0 :1 :0.3 ];
    theAnim.removedOnCompletion = NO;
    
    [[[self tut]layer]addAnimation:theAnim forKey:@"coco"];
    
    
   
    
    NSLog(@"%f", s.value);

}
@end
