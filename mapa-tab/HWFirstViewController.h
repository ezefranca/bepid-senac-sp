//
//  HWFirstViewController.h
//  mapa-tab
//
//  Created by Ezequiel Franca dos Santos on 27/02/14.
//  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWFirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *splashImage;
@property (strong, nonatomic) IBOutlet UIWebView *noticias;

-(void)splashAction;

@end
