//
//  webViewPDF\.h
//  KKH app
//
//  Created by Sean Lim on 10/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "animationScheme.h"

@interface webViewPDF_ : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *h1;
@property (strong, nonatomic) IBOutlet UIButton *favButton;
- (IBAction)favButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *h2;
@property (strong, nonatomic) IBOutlet UIView *buttonPadding;
@property (strong, nonatomic) IBOutlet animationScheme *animView;

@property (strong, nonatomic) IBOutlet UILabel *chotNameDisp;
- (IBAction)tappedButton:(id)sender;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGest;
- (IBAction)backButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UILabel *Ptz;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *primaryViews;

@property (strong, nonatomic) IBOutlet UIVisualEffectView *likedView;
@property (strong, nonatomic) IBOutlet UIImageView *favImg;
- (IBAction)favorite:(id)sender;

@end
