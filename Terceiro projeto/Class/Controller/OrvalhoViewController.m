//
//  OrvalhoViewController.m
//  RNFrostedSidebar
//
//  Created by Ezequiel Franca dos Santos on 28/03/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import "OrvalhoViewController.h"
#import "PNChart.h"
#import "SDbar.h"
#import "ArduinoWebservice.h"
#import <math.h>

@interface OrvalhoViewController ()

@end


@implementation OrvalhoViewController

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
    
    if(!a){
        a = [[ArduinoWebservice alloc]init];
    }
    
//    NSThread* corinthiana = [[NSThread alloc] initWithTarget:self
//                          
//                                                 selector:@selector(atualizadorLabel)
//                          
//                                                   object:nil];
//    
//    [corinthiana start];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(atualizadorLabel) userInfo:nil repeats:YES];
    
    UISwipeGestureRecognizer *gestoPorra = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(abrirMenu)];
    [gestoPorra setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:gestoPorra];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)FinishButton:(id)sender {
    
    [SDbar changeController:199 :self];
}

-(void)atualizador{
    
}



- (IBAction)BeginButton:(id)sender {
    //temperaturaInicial
    [a initWithRequest];
    temperaturaInicial = [a conectaEFiltra:@"temperatura"];
    _inicialLabel.text = [NSString stringWithFormat:@"%2f C", temperaturaInicial];
    NSLog(@"%@",_inicialLabel.text);
}

-(void)abrirMenu
{
    [SDbar showSideBar:self];
}

- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    
    [SDbar changeController:index :self ];
}


- (IBAction)btn:(id)sender {
    [self abrirMenu];
}

-(void)atualizadorLabel{
    float temp;
    [a initWithRequest];
    temp = [a conectaEFiltra:@"temperatura"];
    _atualLabel.text = [NSString stringWithFormat:@"%2f C", temp];
    NSLog(@"%f", temp);
}

@end
