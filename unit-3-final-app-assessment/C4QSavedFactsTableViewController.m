//
//  C4QSavedFactsTableViewController.m
//  unit-3-final-app-assessment
//
//  Created by Charles Kang on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QSavedFactsTableViewController.h"

@interface C4QSavedFactsTableViewController ()
@property (nonatomic) NSArray *savedCatFacts;
@end

@implementation C4QSavedFactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 15.0;

    self.savedCatFacts = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedFacts"];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.savedCatFacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"savedCatFactIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.savedCatFacts objectAtIndex:indexPath.row];
    
    return cell;
}

@end
