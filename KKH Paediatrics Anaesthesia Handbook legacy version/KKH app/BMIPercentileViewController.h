//
//  BMIPercentileViewController.h
//  KKH app
//
//  Created by Sean Lim on 23/7/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "animationScheme.h"

@interface BMIPercentileViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *header;

@property (strong, nonatomic) IBOutlet UIButton *backB;
- (IBAction)back:(id)sender;

- (IBAction)didTap:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *textField;

@property (strong, nonatomic) IBOutlet UIButton *doneB;
- (IBAction)done:(id)sender;

@property (strong, nonatomic) IBOutlet UISegmentedControl *genderSegment;

@property (strong, nonatomic) IBOutlet UILabel *bmiLabel;
//disp result
@property (strong, nonatomic) IBOutlet UILabel *res;
//header
@property (strong, nonatomic) IBOutlet UILabel *resH;

@end
