//
//  C4QColorPickerViewController.h
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "C4QColorPickerViewControllerDelegate.h"


@interface C4QColorPickerViewController : UIViewController

@property (nonatomic, weak) id<C4QColorPickerViewControllerDelegate>delegate;


@end
