//
//  tempViewController.h
//  RNFrostedSidebar
//
//  Created by GABRIEL VIEIRA on 25/03/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNFrostedSidebar.h"
#import "PNChart.h"


@interface tempViewController : UIViewController <RNFrostedSidebarDelegate,PNChartDelegate>
@property (strong, nonatomic) IBOutlet UIView *view;

- (IBAction)btn:(id)sender;
@property (nonatomic, strong) NSMutableIndexSet *optionIndices;

@end
