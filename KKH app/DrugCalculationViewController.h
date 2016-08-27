//
//  DrugCalculationViewController.h
//  KKH app
//
//  Created by Sean Lim on 20/7/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "animationScheme.h"

@interface DrugCalculationViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *resView;
- (IBAction)next:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet animationScheme *nextB;
@property (strong, nonatomic) IBOutlet UIImageView *drugimg;

- (IBAction)viewB:(id)sender;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)sendB:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *backB;

- (IBAction)back:(id)sender;

@end
