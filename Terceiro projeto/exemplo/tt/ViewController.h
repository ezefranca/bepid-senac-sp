//
//  ViewController.h
//  tt
//
//  Created by GABRIEL VIEIRA on 31/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property UIDynamicAnimator *animator;

@property  UIView *redSquare;
@property UIView *line;
@property (weak, nonatomic) IBOutlet UIButton *btn;

- (IBAction)zerar:(id)sender;
@end
