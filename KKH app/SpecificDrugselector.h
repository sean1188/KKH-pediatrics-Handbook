//
//  SpecificDrugselector.h
//  KKH app
//
//  Created by Guest User on 5/12/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "ViewController.h"

@interface SpecificDrugselector : ViewController
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *pri;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *sec;

//select drug
@property (weak, nonatomic) IBOutlet UILabel *header1;
@property (weak, nonatomic) IBOutlet UIPickerView *Drugpicker;

- (IBAction)backb:(id)sender;
- (IBAction)nextB:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *backB;
@property (weak, nonatomic) IBOutlet UIButton *nextB;
@property (weak, nonatomic) IBOutlet UITextView *resView;



@end
