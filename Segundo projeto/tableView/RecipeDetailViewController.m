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
    
    [self.produto.description appendString:[self.produto.description stringByReplacingOccurrencesOfString:@"(" withString:@""]];
    [self.produto.description appendString:[self.produto.description stringByReplacingOccurrencesOfString:@")" withString:@""]];
    
    [self.produto.description appendString:[self.produto.description stringByReplacingOccurrencesOfString:@"(null)" withString:@"--------"]];
    
    arrumado = [NSString stringWithFormat:@"Descricão do Produto \n %@", self.produto.description];
    
    
    
    self.descriptionTextView.text = arrumado;
   //self.descriptionTextView.text = self.produto.description;
   // [corretorUTF valueForKey: [NSString stringWithCString:[self.produto.description cStringUsingEncoding:NSISOLatin1StringEncoding] encoding:NSUTF8StringEncoding]];
 
    
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
            NSLog(@"Compra finalizada");
        }
    }
}

/*
- (void)unicodeConserta{

    NSInteger indice = 0;
    NSArray* unicode =[NSArray arrayWithObjects:@"\u00e1", @"\u00e0", @"\u00e2", @"\u00e3",
                       @"\u00e4", @"\u00c1", @"\u00c0", @"\u00c2", @"\u00c3", @"\u00c4", @"\u00e9", @"\u00e8",
                       @"\u00ea", @"\u00ea", @"\u00c9", @"\u00c8", @"\u00ca", @"\u00cb", @"\u00ed", @"\u00ec",
                       @"\u00ee", @"\u00ef", @"\u00cd", @"\u00cc", @"\u00ce", @"\u00cf", @"\u00f3", @"\u00f2",
                       @"\u00f4", @"\u00f5", @"\u00f6", @"\u00d3", @"\u00d2", @"\u00d4", @"\u00d5", @"\u00d6",
                       @"\u00fa", @"\u00f9", @"\u00fb", @"\u00fc", @"\u00da", @"\u00d9", @"\u00db", @"\u00e7", @"\u00c7", @"\u00f1", @"\\u00d1", @"\\u0026", @"\\u0027" , nil ];
    NSArray* unicodeMaiusculo = [NSArray arrayWithObjects:@"\\U00e1",
                                 @"\\U00e0",
                                 @"\\U00e2",
                                 @"\\U00e3",
                                 @"\\U00e4",
                                 @"\\U00c1",
                                 @"\\U00c0",
                                 @"\\U00c2",
                                 @"\\U00c3",
                                 @"\\U00c4",
                                 @"\\U00e9",
                                 @"\\U00e8",
                                 @"\\U00ea",
                                 @"\\U00ea",
                                 @"\\U00c9",
                                 @"\\U00c8",
                                 @"\\U00ca",
                                 @"\\U00cb",
                                 @"\\U00ed",
                                 @"\\U00ec",
                                 @"\\U00ee",
                                 @"\\U00ef",
                                 @"\\U00cd",
                                 @"\\U00cc",
                                 @"\\U00ce",
                                 @"\\U00cf",
                                 @"\\U00f3",
                                 @"\\U00f2",
                                 @"\\U00f4",
                                 @"\\U00f5",
                                 @"\\U00f6",
                                 @"\\U00d3",
                                 @"\\U00d2",
                                 @"\\U00d4",
                                 @"\\U00d5",
                                 @"\\U00d6",
                                 @"\\U00fa",
                                 @"\\U00f9",
                                 @"\\U00fb",
                                 @"\\U00fc",
                                 @"\\U00da",
                                 @"\\U00d9",
                                 @"\\U00db",
                                 @"\\U00e7",
                                 @"\\U00c7",
                                 @"\\U00f1",
                                 @"\\U00d1",
                                 @"\\U0026",
                                 @"\\U0027",nil];
    NSArray* codificado = [NSArray arrayWithObjects:@"á",
                           @"à",
                           @"â",
                           @"ã",
                           @"ä",
                           @"Á",
                           @"À",
                           @"Â",
                           @"Ã",
                           @"Ä",
                           @"é",
                           @"è",
                           @"ê",
                           @"ê",
                           @"É",
                           @"È",
                           @"Ê",
                           @"Ë",
                           @"í",
                           @"ì",
                           @"î",
                           @"ï",
                           @"Í",
                           @"Ì",
                           @"Î",
                           @"Ï",
                           @"ó",
                           @"ò",
                           @"ô",
                           @"õ",
                           @"ö",
                           @"Ó",
                           @"Ò",
                           @"Ô",
                           @"Õ",
                           @"Ö",
                           @"ú",
                           @"ù",
                           @"û",
                           @"ü",
                           @"Ú",
                           @"Ù",
                           @"Û",
                           @"ç",
                           @"Ç",
                           @"ñ",
                           @"Ñ", 
                           @"&", 
                           @"'", nil];
    
    for (NSString *n in unicode){
     [self.produto.description stringByReplacingOccurrencesOfString:[unicode objectAtIndex:indice] withString:[codificado objectAtIndex:indice]];
        
     [self.produto.description stringByReplacingOccurrencesOfString:[unicodeMaiusculo objectAtIndex:indice] withString:[codificado objectAtIndex:indice] ];
    }
}
*/
 
@end
