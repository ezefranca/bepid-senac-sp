//
//  SensoresViewController.m
//  RNFrostedSidebar
//
//  Created by EZEQUIEL FRANCA DOS SANTOS on 26/03/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import "SensoresViewController.h"
#import "SDbar.h"

@interface SensoresViewController ()

@end

@implementation SensoresViewController
{
    NSArray *opcoesMenu;
}

- (IBAction)biologiaBotao1:(id)sender {
    [SDbar changeController:5 :self ];
}
- (IBAction)botaoQuimica:(id)sender {
    [SDbar changeController:3 :self ];
}
- (IBAction)botaoFisica:(id)sender {
    [SDbar changeController:4 :self ];
}

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
