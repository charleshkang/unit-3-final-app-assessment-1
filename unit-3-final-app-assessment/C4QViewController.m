//
//  ViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 11/30/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QViewController.h"

@interface C4QViewController ()<C4QColorPickerViewControllerDelegate>

@end

@implementation C4QViewController

- (void)colorPickerViewController:(C4QColorPickerViewController *)vc didPickColorButton:(UIButton *)colorButton{
    
    self.view.backgroundColor = colorButton.backgroundColor;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqual: @"ColorPickerIdentifier"]) {
        C4QColorPickerViewController *colorPickerVC = segue.destinationViewController;
        colorPickerVC.delegate = self;
    }
}


@end
