//
//  GraficoOrvalhoViewController.h
//  RNFrostedSidebar
//
//  Created by Ezequiel Franca dos Santos on 04/04/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNFrostedSidebar.h"
#import "PNChart.h"

@interface GraficoOrvalhoViewController : UIViewController <RNFrostedSidebarDelegate,PNChartDelegate>
{
    UILabel * LabelDeBaixo;
    float Tpo;
    float UR;
}
- (IBAction)btn:(id)sender;

@end
