//
//  Calculator.h
//  KKH app
//
//  Created by Sean Lim on 7/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "animationScheme.h"
@interface Calculator : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *header;
@property (strong, nonatomic) IBOutlet UIStackView *bottomStack;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *secondaryViews;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *primaryViews;

//bottom bar
@property (strong, nonatomic) IBOutlet UIImageView *calclogo;
- (IBAction)refButton:(id)sender;
- (IBAction)listButton:(id)sender;
- (IBAction)settingsButton:(id)sender;

//init
@property (strong, nonatomic) IBOutlet UIView *genderView;
@property (strong, nonatomic) IBOutlet UILabel *h4;

@property (strong, nonatomic) IBOutlet UIImageView *h5;
@property (strong, nonatomic) IBOutlet UILabel *h3;
@property (strong, nonatomic) IBOutlet UIImageView *h2;
@property (strong, nonatomic) IBOutlet UILabel *h1;
- (IBAction)femalePressed:(id)sender;
- (IBAction)malePressed:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *inputview;
@property (strong, nonatomic) IBOutlet UITextField *inputField;
@property (strong, nonatomic) IBOutlet animationScheme *animView;
- (IBAction)TappedNext:(id)sender;



@end
