//
//  C4QCustomTableViewCell.h
//  unit-3-final-app-assessment
//
//  Created by Charles Kang on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface C4QCustomTableViewCell : UITableViewCell

@property (nonatomic) NSString *catFact;
@property (weak, nonatomic) IBOutlet UILabel *factLabel;


@end
