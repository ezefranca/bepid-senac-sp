//
//  CustomTableViewController.h
//  CustomTable
//
//  Created by Simon on 7/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Buscape.h" 

@interface RecipeTableViewController : UITableViewController

-(void)buscaBackground: (NSString *) busca;

@property Buscape *b;

@end
