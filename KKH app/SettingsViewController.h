//
//  SettingsViewController.h
//  KKH app
//
//  Created by Sean Lim on 17/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

- (IBAction)infoB:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *startScreenView;
@property (strong, nonatomic) IBOutlet UIImageView *topSettingslogo;
//color indicator
@property (strong, nonatomic) IBOutlet UIView *SecondaryColorIndicator;
@property (strong, nonatomic) IBOutlet UIView *primaryColorIndicator;
@property (strong, nonatomic) IBOutlet UIView *colorSelectPadding;
- (IBAction)didTapColor:(id)sender;

@property (strong, nonatomic) IBOutlet UIVisualEffectView *blurView;
- (IBAction)blurTap:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *color1Primary;
@property (strong, nonatomic) IBOutlet UIView *color1Secondary;
- (IBAction)color1Tapped:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *color2Primary;
@property (strong, nonatomic) IBOutlet UIView *color2Secondary;
- (IBAction)color2Tapped:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *color3Primary;
@property (strong, nonatomic) IBOutlet UIView *Color3Seconday;
- (IBAction)color3Tapped:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *aboutUsView;
- (IBAction)aboutUsTapped:(id)sender;
- (IBAction)aboutUsbutton:(id)sender;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *secondaryViews;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *primaryViews;
@property (strong, nonatomic) IBOutlet UISegmentedControl *startUpSelection;
- (IBAction)didChangeStartup:(id)sender;

- (IBAction)auth:(id)sender;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *colorTapgesture;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *authTapped;

//bottom bar
- (IBAction)ref:(id)sender;
- (IBAction)calc:(id)sender;
- (IBAction)fav:(id)sender;
- (IBAction)settings:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *settingsLogo;

//auth view
@property (strong, nonatomic) IBOutlet UIView *authView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *pinButtons;
@property (strong, nonatomic) IBOutlet UITextField *pinDisp;

- (IBAction)one:(id)sender;
- (IBAction)two:(id)sender;
- (IBAction)three:(id)sender;
- (IBAction)four:(id)sender;
- (IBAction)five:(id)sender;
- (IBAction)six:(id)sender;
- (IBAction)seven:(id)sender;
- (IBAction)eight:(id)sender;
- (IBAction)nine:(id)sender;
- (IBAction)zero:(id)sender;


@end
