//
//  SDbar.h
//  RNFrostedSidebar
//
//  Created by GABRIEL VIEIRA on 28/03/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Single.h"


@interface SDbar : NSObject

+(void)showSideBar : (id)delegate;

+(void)changeController : (int)index : (UIViewController *) controller;

@end
