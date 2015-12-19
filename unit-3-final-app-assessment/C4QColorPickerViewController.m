//
//  C4QColorPickerViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QColorPickerViewController.h"

@interface C4QColorPickerViewController ()

@property (weak, nonatomic) IBOutlet UIButton *blueButton;
@property (weak, nonatomic) IBOutlet UIButton *redButton;
@property (weak, nonatomic) IBOutlet UIButton *greenButton;

@end

@implementation C4QColorPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blueButton.backgroundColor = [UIColor blueColor];
    self.greenButton.backgroundColor = [UIColor greenColor];
    self.redButton.backgroundColor = [UIColor redColor];
}

- (IBAction)redButtonTapped:(id)sender {
    
    [self.delegate userDidPickColor:[UIColor redColor]];
    [self.navigationController popToRootViewControllerAnimated:YES];

}
- (IBAction)greenButtonTapped:(id)sender {
    
    [self.delegate userDidPickColor:[UIColor greenColor]];
    [self.navigationController popToRootViewControllerAnimated:YES];

}
- (IBAction)blueButtonTapped:(id)sender {
    
    [self.delegate userDidPickColor:[UIColor blueColor]];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
