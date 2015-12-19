//
//  ViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 11/30/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QViewController.h"
#import "C4QColorPickerViewController.h"

@interface C4QViewController () <ColorPassDelegate>

@end

@implementation C4QViewController

-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)userDidPickColor:(UIColor *)color {
    self.view.backgroundColor = color;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.destinationViewController isKindOfClass:[C4QColorPickerViewController class]]) {
        C4QColorPickerViewController *destinationVC= segue.destinationViewController;
        destinationVC.delegate = self;
    }
}


@end
