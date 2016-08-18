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

//BMI calculations
@property (strong, nonatomic) IBOutlet UIView *bmiView;
@property (strong, nonatomic) IBOutlet UITextField *weight;
@property (strong, nonatomic) IBOutlet UITextField *height;
- (IBAction)didTap:(id)sender;

//Gender and age
@property (strong, nonatomic) IBOutlet UIView *GenderView;
@property (strong, nonatomic) IBOutlet UITextField *ageField;
- (IBAction)genderSegment:(id)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *genderSegment;


@property (strong, nonatomic) IBOutlet animationScheme *NextButton;
- (IBAction)next:(id)sender;

@end
