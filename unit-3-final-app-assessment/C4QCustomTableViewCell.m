//
//  C4QCustomTableViewCell.m
//  unit-3-final-app-assessment
//
//  Created by Charles Kang on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCustomTableViewCell.h"

@implementation C4QCustomTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (IBAction)addCatFactTapped:(UIButton *)sender {
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"savedFacts"]) {
        NSArray *catFactArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedFacts"];
        NSMutableArray *catMut = [catFactArray mutableCopy];
        [catMut addObject:self.catFact];
        NSArray *catFactArrFinal = [catMut copy];
        [[NSUserDefaults standardUserDefaults] setObject:catFactArrFinal forKey:@"savedFacts"];
        
    }
    else{
        NSArray *catFactArray = [[NSArray alloc]initWithObjects:self.catFact, nil];
        [[NSUserDefaults standardUserDefaults] setObject:catFactArray forKey:@"savedFacts"];
    }
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Saved"
                                  message:@"New cat fact saved!"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    [alert dismissViewControllerAnimated:YES completion:nil];
                                    
                                }];
    
    [alert addAction:yesButton];
    
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    
}

@end
