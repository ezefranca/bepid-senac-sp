//
//  SecondViewController.h
//  shakeShop
//
//  Created by GABRIEL VIEIRA on 10/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController{
    NSMutableDictionary *fretes;
}
- (IBAction)TESTE:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *precoPac;
@property (strong, nonatomic) IBOutlet UILabel *precoSedex;

@end
