//
//  HWFirstViewController.h
//  mapa-tab
//
//  Created by Ezequiel Franca dos Santos on 27/02/14.
//  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface HWFirstViewController : UIViewController <UINavigationControllerDelegate> {
    UINavigationController *navController;
}
@property (weak, nonatomic) IBOutlet UIImageView *splashImage;
@property (strong, nonatomic) IBOutlet UILabel *facebookName;
@property (retain, nonatomic) IBOutlet FBProfilePictureView *profilePictureView;
@property (retain, nonatomic) IBOutlet UIView *profilePictureOuterView;


-(void)splashAction;

@end
