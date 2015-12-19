
#import <Foundation/Foundation.h>
#import "C4QColorPickerViewController.h"

@class C4QColorPickerViewController;

@protocol C4QColorPickerViewControllerDelegate <NSObject>

- (void)colorPickerViewController:(C4QColorPickerViewController *)vc didPickColorButton:(UIButton *)colorButton;

@end