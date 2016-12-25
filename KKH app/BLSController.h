//
//  BLSController.h
//  KKH app
//
//  Created by Sean Lim on 27/11/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "ViewController.h"

@interface BLSController : ViewController

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *priViews;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *secondViews;

@property (strong, nonatomic) IBOutlet UILabel *stateLabel;
@property (strong, nonatomic) IBOutlet UILabel *instructions;
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
- (IBAction)button1:(id)sender;
- (IBAction)button2:(id)sender;

@property (strong, nonatomic) IBOutlet UITextView *resText;
- (IBAction)back:(id)sender;


@end
