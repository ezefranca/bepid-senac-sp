//
//  RecipeDetailViewController.m
//  RecipeApp
//
//  Created by Simon on 23/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "RecipeDetailViewController.h"

@interface RecipeDetailViewController ()

@end

@implementation RecipeDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.title = self.produto.nome;
   // self.prepTimeLabel.text = self.recipe.prepTime;
    self.recipeImageView.image = self.produto.imagem;
    
    self.produto.description = [self.produto.description stringByReplacingOccurrencesOfString:@"(" withString:@""];
    self.produto.description = [self.produto.description stringByReplacingOccurrencesOfString:@")" withString:@""];
    
    self.descriptionTextView.text = self.produto.description;
    
    //self.podeColocar = NO;
    /*
    NSMutableString *ingredientsText = [NSMutableString string];
    for (NSString* ingredient in self.recipe.ingredients) {
        [ingredientsText appendFormat:@"%@\n", ingredient];
    }
    self.ingredientsTextView.text = ingredientsText;
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        if (self.podeColocar == YES) {
            
            Carrinho *c = [[Carrinho alloc]init];
            
            [c.produtosCarrinho addObject:self.produto];
            
        }
        else
        {
            NSLog(@"Nao pode colocar");
        }
    }
}

@end
