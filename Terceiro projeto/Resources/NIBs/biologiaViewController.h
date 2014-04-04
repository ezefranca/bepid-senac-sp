//
//  biologiaViewController.h
//  RNFrostedSidebar
//
//  Created by Ezequiel Franca dos Santos on 04/04/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNChartDelegate.h"
#import "PNChart.h"
#import "RNFrostedSidebar.h"
@interface biologiaViewController : UIViewController <RNFrostedSidebarDelegate, PNChartDelegate>
{
    BOOL chave;
}
- (IBAction)ligar_lampada:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *labelLuminosidade;

@property (strong, nonatomic) IBOutlet UIImageView *imagemLampada;

@end
