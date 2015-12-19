//
//  C4QCatsTableViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "C4QCatFactsTableViewController.h"
#import "C4QCustomTableViewCell.h"
#import "C4QCatFactsDetailViewController.h"
#import "C4QSavedFactsTableViewController.h"

#define CAT_API_URL @"http://catfacts-api.appspot.com/api/facts?number=100"

@interface C4QCatFactsTableViewController ()

@property (nonatomic) NSMutableArray *catData;

@end

@implementation C4QCatFactsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 15.0;
    
    UINib *customCatNib = [UINib nibWithNibName:@"C4QCustomTableViewCell" bundle:nil];
    [self.tableView registerNib:customCatNib forCellReuseIdentifier:@"catFactIdentifier"];
    self.catData = [[NSMutableArray alloc] init];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager GET:CAT_API_URL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSError *error;
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        
        NSArray *facts = [jsonDict objectForKey:@"facts"];
        
        for ( NSString* fact in facts ) {
            
            [self.catData addObject:fact];
        }
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"fail:%@", error);
    }];
}

#pragma mark - API

- (IBAction)savedCatFactsTapped:(id)sender {
    
    C4QSavedFactsTableViewController *vc = (C4QSavedFactsTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier: @"savedCatFactDetailVC"];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:vc];
    navController.navigationBar.topItem.title =  @"Your Cat Facts";
    navController.navigationBar.topItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissView:)];
    
    [self.navigationController presentViewController:navController animated:YES completion:nil];
}

- (void) dismissView:(id)sender {
    
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.catData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    C4QCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"catFactIdentifier"];
    
    cell.catFact = [self.catData objectAtIndex:indexPath.row];
    cell.factLabel.text = [self.catData objectAtIndex:indexPath.row];
    cell.factLabel.textAlignment = NSTextAlignmentJustified;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    C4QCatFactsDetailViewController *controller = (C4QCatFactsDetailViewController *)[self.storyboard instantiateViewControllerWithIdentifier: @"catFactDetailVC"];
    controller.catFact = [self.catData objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
    
}

@end
