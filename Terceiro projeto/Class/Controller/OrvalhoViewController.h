//
//  OrvalhoViewController.h
//  RNFrostedSidebar
//
//  Created by Ezequiel Franca dos Santos on 28/03/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNFrostedSidebar.h"
#import "PNChart.h"

@interface OrvalhoViewController : UIViewController <RNFrostedSidebarDelegate>

@property int temperatutaInicial;
@property int temperaturaFinal;
- (IBAction)FinishButton:(id)sender;
- (IBAction)btn:(id)sender;
- (IBAction)BeginButton:(id)sender;

-(void)abrirMenu;

@end
