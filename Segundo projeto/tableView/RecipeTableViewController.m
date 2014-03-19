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
#import "Produto.h"
#import "Buscape.h"

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
    
    background = [[NSThread alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


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

//NOVO
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomTableCell";
    RecipeTableCell *cell = (RecipeTableCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[RecipeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    NSMutableDictionary *d = [self.b.productGeral objectAtIndex:indexPath.row];
    NSDictionary *produto = [d objectForKey:@"product"];
    
    
    NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[[produto objectForKey:@"thumbnail"]objectForKey:@"url"  ]]];
    //
    // if (data) {
    cell.thumbnailImageView.image = [UIImage imageWithData:data];
    // }
    
    cell.nameLabel.text = [produto objectForKey:@"productname"];
    //cell.thumbnailImageView.image = [UIImage imageWithData:data];
    cell.prepTimeLabel.text =  [NSString stringWithFormat:@"R$ %@" ,  [produto objectForKey:@"pricemin"]];
    //cell.outra.text = [NSString stringWithFormat:@"R$ %@" ,  [produto objectForKey:@"pricemax"]];
    
    
    
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 71;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        
        int i = -1; //para varrer o objeto a partir do indice 0;
        
        NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
        NSMutableDictionary *d = [self.b.productGeral objectAtIndex:indexPath.row];
        NSDictionary *produto = [d objectForKey:@"product"];
        
        RecipeDetailViewController *destViewController = segue.destinationViewController;
        
        Produto *p = [[Produto alloc]init];
        
        p.nome = [produto objectForKey:@"productname"];
        
        NSData *data = [[NSData alloc] initWithContentsOfURL:
                        [NSURL URLWithString:[[produto objectForKey:@"thumbnail"]objectForKey:@"url"  ]]];
        p.imagem = [UIImage imageWithData:data];
        
        p.descricao = [[produto objectForKey:@"specification"] objectForKey:@"item"];
        for (NSMutableString *descricao in p.descricao) {
            i++;
            p.description = [NSMutableString stringWithFormat:@"%@\n%@%@",p.description, [[p.descricao[i] objectForKey:@"item"]objectForKey:@"label"], [[p.descricao[i] objectForKey:@"item"]objectForKey:@"value"]];
        }
        
        p.precoMin = [NSString stringWithFormat:@"R$ %@" ,  [produto objectForKey:@"pricemin"]];
        
        destViewController.produto = p;
        
        destViewController.podeColocar = YES;
    }
}


-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    NSDictionary *d = @{@"string" :searchText, @"delegate":self };
    [self performSelectorInBackground:@selector(buscaBackground:) withObject:d];
    NSLog(@"tic");
}


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    NSDictionary *d = @{@"string" :searchString, @"delegate":self };
    //[self performSelectorInBackground:@selector(buscaBackground:) withObject:d];
    
    [self performSelector:@selector(buscaBackground:) onThread:background withObject:d waitUntilDone:NO];
    
    //[self buscaBackground:d];
    
    return NO;
}


-(void) terminouDebaixarAsParadsDoBuscape{
    NSLog(@"reload");
    [self.searchDisplayController.searchResultsTableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:YES];
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
}

@end