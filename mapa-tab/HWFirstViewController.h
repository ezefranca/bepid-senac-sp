//
//  HWFirstViewController.h
//  mapa-tab
//
//  Created by Ezequiel Franca dos Santos on 27/02/14.
//  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//
#import "DataModelObject.h"
#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface HWFirstViewController : UIViewController <UINavigationControllerDelegate>  {
    UINavigationController *navController;
}
@property (strong, nonatomic) IBOutlet FBLoginView *loginview;
@property (weak, nonatomic) IBOutlet UIImageView *logoPrincipal;

@property (weak, nonatomic) IBOutlet UIImageView *splashImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) NSDictionary *jsonDictionary;
@property (strong,nonatomic) NSArray *arrayOfObjects; //passed to next contorller
@property (strong,nonatomic) DataModelObject *dataObject;


-(void)splashAction;

@end
