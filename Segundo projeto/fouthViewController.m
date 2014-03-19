//
//  fouthViewController.m
//  shakeShop
//
//  Created by GABRIEL VIEIRA on 17/03/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "fouthViewController.h"

@interface fouthViewController ()
{
    NSMutableArray *_objects;
}
@end

@implementation fouthViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
     [_objects addObject:[NSDate date]];
    
    NSLog(@"%@", _objects);
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
   // UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
   // self.navigationItem.rightBarButtonItem = addButton;
  //  self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
     Carrinho  *c = [[Carrinho alloc]init ];
    
    NSLog(@"%@", c.produtosCarrinho);
    
    [self.tableView reloadData];

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 71;
}


- (void)insertNewObject:(id)sender
{
   
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
  //  [_objects insertObject:[NSDate date] atIndex:0];
    
    [_objects addObject:[NSDate date]];
    
    NSLog(@"pasasou")   ;
     /*
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
     */
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Carrinho  *c = [[Carrinho alloc]init ];
    return c.produtosCarrinho.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableCell" forIndexPath:indexPath];
    
    NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
     */

    Carrinho  *c = [[Carrinho alloc]init ];
    
    static NSString *CellIdentifier = @"CustomTableCell";
    RecipeTableCell *cell = (RecipeTableCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[RecipeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Produto *produto = [c.produtosCarrinho objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = produto.nome;
    cell.thumbnailImageView.image = produto.imagem ;
    cell.prepTimeLabel.text =  [NSString stringWithFormat:@"R$ %@" ,  produto.description];
    cell.outra.text = [NSString stringWithFormat:@"R$ %@" , produto.descricao];
    
    return cell;

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Carrinho *c = [[Carrinho alloc]init];
        
        
        [c.produtosCarrinho removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        
        /*
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
        */
         RecipeDetailViewController *destViewController = segue.destinationViewController;
        
        destViewController.podeColocar = NO;
    }
}

@end
