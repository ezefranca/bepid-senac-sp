//
//  SensoresViewController.m
//  RNFrostedSidebar
//
//  Created by EZEQUIEL FRANCA DOS SANTOS on 26/03/14.
//  Copyright (c) 2014 Ryan Nystrom. All rights reserved.
//

#import "SensoresViewController.h"

@interface SensoresViewController ()

@end

@implementation SensoresViewController
{
    NSArray *opcoesMenu;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView setContentInset:UIEdgeInsetsMake(self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height, 0, 0, 0)];
    
    
    
    opcoesMenu = [NSArray arrayWithObjects:@"Temperatura", @"Umidade", @"Luminosidade", @"Ruido", @"Tremor", @"Inclinacao", @"Chama", @"Presenca" , nil];
    self.title = @"Sensores";
    self.tableView.delegate = self;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [opcoesMenu count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [opcoesMenu objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"lampada"];

    
    return cell;
}

- (UIView *)headerView
{
    if(!headerView){
       [[NSBundle mainBundle] loadNibNamed:@"HeaderSensor" owner:self options:nil];
         NSLog(@"xxxxxxxx");
    }
     NSLog(@"uiuiuiui");
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [self headerView];
}

- (CGFloat) tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
   
    return [[self headerView] bounds].size.height;
    
}

@end
