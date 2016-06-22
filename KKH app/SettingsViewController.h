//
//  SettingsViewController.h
//  KKH app
//
//  Created by Sean Lim on 17/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

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


@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *secondaryViews;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *primaryViews;


//bottom bar
- (IBAction)ref:(id)sender;
- (IBAction)calc:(id)sender;
- (IBAction)fav:(id)sender;
- (IBAction)settings:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *settingsLogo;


@end
