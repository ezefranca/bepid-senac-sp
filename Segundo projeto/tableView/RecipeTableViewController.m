//
//  CustomTableViewController.m
//  CustomTable
//
//  Created by Simon on 7/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "RecipeTableViewController.h"
#import "RecipeTableCell.h"
#import "RecipeDetailViewController.h"
#import "Recipe.h"

@interface RecipeTableViewController ()

@end

@implementation RecipeTableViewController
{
    NSArray *recipes;
    NSArray *searchResults;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.b = [[Buscape alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 ANTIGO
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [recipes count];
}
*/
//NOVO
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    /*
     VOCE SERA USADO
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [recipes count];
    }
     */
    
    if(self.tableView == tableView){
        return 0;
    }
    
    NSLog(@">>>>>> %d", self.b.productGeral.count);
    return self.b.productGeral.count;

}



/*
 ANTIGO
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomTableCell";
    RecipeTableCell *cell = (RecipeTableCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[RecipeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Display recipe in the table cell
    Recipe *recipe = [recipes objectAtIndex:indexPath.row];
    cell.nameLabel.text = recipe.name;
    cell.thumbnailImageView.image = [UIImage imageNamed:recipe.image];
    cell.prepTimeLabel.text = recipe.prepTime;
    
    return cell;
}
 */
//NOVO
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomTableCell";
    RecipeTableCell *cell = (RecipeTableCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[RecipeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Display recipe in the table cell
    /*
    SERA USADO
    Recipe *recipe = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        recipe = [searchResults objectAtIindexPath.row];
    } else {
        recipe = [recipes objectAtIndex:indexPath.row];
    }
     */
    
//    NSLog(@"%@, %@", tableView, self.tableView);
    
    
    NSMutableDictionary *d = [self.b.productGeral objectAtIndex:indexPath.row];
    NSDictionary *produto = [d objectForKey:@"product"];
    
    
    NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[[produto objectForKey:@"thumbnail"]objectForKey:@"url"  ]]];
//    
    
    cell.nameLabel.text = [produto objectForKey:@"productname"];
    cell.thumbnailImageView.image = [UIImage imageWithData:data];
    cell.prepTimeLabel.text =  [NSString stringWithFormat:@"R$ %@" ,  [produto objectForKey:@"pricemin"]];
    cell.outra.text = [NSString stringWithFormat:@"R$ %@" ,  [produto objectForKey:@"pricemax"]];
        
    

    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 71;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        RecipeDetailViewController *destViewController = segue.destinationViewController;

        Recipe *recipe = [recipes objectAtIndex:indexPath.row];
        destViewController.recipe = recipe;
    }
}

//BUSCA


//-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
//{
//    [self filterContentForSearchText:searchString
//                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
//                                      objectAtIndex:[self.searchDisplayController.searchBar
//                                                     selectedScopeButtonIndex]]];
//    
//    return YES;
//}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
//    [self filterContentForSearchText:searchText
//                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
//                                      objectAtIndex:[self.searchDisplayController.searchBar
//                                                     selectedScopeButtonIndex]]];
    
    NSDictionary *d = @{@"string" :searchText, @"delegate":self };
    //    [self buscaBackground:d];
    [self performSelectorInBackground:@selector(buscaBackground:) withObject:d];
    NSLog(@"tic");
}

//-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
//    
//    NSDictionary *d = @{@"string" :searchString, @"delegate":self };
//    [self performSelectorInBackground:@selector(buscaBackground:) withObject:d];
//    return NO;
//}


-(void) terminouDebaixarAsParadsDoBuscape{
    NSLog(@"reload");
    [self.searchDisplayController.searchResultsTableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
//    [self.searchDisplayController.searchResultsTableView reloadData];
}

-(void)buscaBackground :(NSDictionary*) dict
{
    RecipeTableViewController *vc = [dict objectForKey:@"delegate" ];
    NSString *busca = [dict objectForKey:@"string" ];
    
     Buscape *b = [[Buscape alloc]init];
    [b buscapeJson:busca];
    [b retornaDados:@"produtoNomeCurto"];
    [b retornaDados:@"precoMinimo"];
    [b retornaDados:@"imagemMiniatura"];
    
    [vc terminouDebaixarAsParadsDoBuscape];
    //self.busqueiEstes = [[ProdutosBuscados alloc]init];
}

@end
