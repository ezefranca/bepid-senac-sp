//
//  FirstViewController.m
//  shakeShop
//
//  Created by GABRIEL VIEIRA on 10/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "FirstViewController.h"
#import "thirdViewController.h"
#import "Buscape.h"
#import "ProdutosBuscados.h"
#import "AppDelegate.h"
#import "RecipeDetailViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Com o codigo abaixo vc pode colocar uma imagem no topo igual o app da Amazon
    
    //self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"appcoda-logo.png"]];
    
    self.title = @"ShakeShop";
    
    
 //   NSLog(@"%@", )
   // Buscape *b = [[Buscape alloc]init];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:YES];
}



- (IBAction)btn:(id)sender {
    
    AppDelegate *app = [[UIApplication sharedApplication]delegate];
    
    UITabBarController *tab = app.window.rootViewController ;
    tab.selectedIndex = 1;
    //_buscarLabel.text = @"tv";

}
@end
