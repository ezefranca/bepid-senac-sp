//
//  RecipeDetailViewController.h
//  RecipeApp
//
//  Created by Simon on 23/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"
#import "Produto.h"
#import "Carrinho.h"

@interface RecipeDetailViewController : UIViewController{
    NSString *arrumado;
}

@property (weak, nonatomic) IBOutlet UIImageView *recipeImageView;

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

@property (nonatomic, strong) Recipe *recipe;

@property (nonatomic, strong) Produto *produto;

@property BOOL podeColocar;

- (void)unicodeConserta;

@end
