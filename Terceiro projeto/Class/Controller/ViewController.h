//
//  ViewController.h
//  RNFrostedSidebar
//
//  Created by Ryan Nystrom on 8/13/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNFrostedSidebar.h"
#import "SDbar.h"

@interface ViewController : UIViewController
<RNFrostedSidebarDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *tut;

-(void)abrirMenu;

@end
