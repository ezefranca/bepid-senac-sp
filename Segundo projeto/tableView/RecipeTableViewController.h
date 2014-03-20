//
//  CustomTableViewController.h
//  CustomTable
//
//  Created by Simon on 7/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Buscape.h" 
#import "ProdutosBuscados.h"

@interface RecipeTableViewController : UITableViewController < UISearchBarDelegate, UISearchDisplayDelegate>
{
    NSThread *background;
}
-(void)buscaBackground: (NSDictionary *) busca;

@property Buscape *b;

@property NSArray *produtosTabela;
@property NSArray *produtosFiltrados;
@property NSOperationQueue *fila;


@end
