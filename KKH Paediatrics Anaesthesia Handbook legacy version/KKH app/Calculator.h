//
//  Calculator.h
//  KKH app
//
//  Created by Sean Lim on 7/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "animationScheme.h"
#import "KKH_app-Swift.h"
@interface Calculator : UIViewController
//
@property (strong, nonatomic) IBOutlet UILabel *header;
@property (strong, nonatomic) IBOutlet UIStackView *bottomStack;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *secondaryViews;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *primaryViews;
//
- (IBAction)doneButtonViewer:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *mainCardView;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *buttonsz;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;

@property (strong, nonatomic) IBOutlet UITextField *textFieldInput;
@property (strong, nonatomic) IBOutlet animationScheme *nextButtonView;
- (IBAction)didNext:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *nextPadding;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *blur;



- (IBAction)didTap1:(id)sender;

- (IBAction)didTap2:(id)sender;

- (IBAction)didTap3:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *VIEW;
@property (strong, nonatomic) IBOutlet UIButton *send;
- (IBAction)view:(id)sender;
- (IBAction)send:(id)sender;




//bottom bar
@property (strong, nonatomic) IBOutlet UIImageView *calclogo;
- (IBAction)refButton:(id)sender;
- (IBAction)listButton:(id)sender;
- (IBAction)settingsButton:(id)sender;

//NEW VARS
@property (strong, nonatomic) IBOutlet UIView *drugCALButton;
@property (strong, nonatomic) IBOutlet UIView *BMIButton;


@end
