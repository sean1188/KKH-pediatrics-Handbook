//
//  Anaphylaxis.h
//  KKH app
//
//  Created by Guest User on 2/12/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "ViewController.h"

@interface Anaphylaxis : ViewController

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *secondaryphy;
@property (weak, nonatomic) IBOutlet UILabel *weightLabelll;

@property (weak, nonatomic) IBOutlet UIButton *immediateB;
@property (weak, nonatomic) IBOutlet UIButton *seocndaryB;
- (IBAction)immediate:(id)sender;
- (IBAction)secondary:(id)sender;

//checklistView
@property (weak, nonatomic) IBOutlet UIView *checklistView;
@property (weak, nonatomic) IBOutlet UIStackView *stack1;
@property (weak, nonatomic) IBOutlet UIStackView *stack2;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *blurview;
- (IBAction)Next:(id)sender;

//instructionView
@property (weak, nonatomic) IBOutlet UIView *instrcutionView;
@property (weak, nonatomic) IBOutlet UITextView *textViewINS;


//checklistButtons
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonCollection;


- (IBAction)b1:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *b1;
- (IBAction)b2:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *b2;
- (IBAction)b3:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *b3;
- (IBAction)b4:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *b4;
- (IBAction)b5:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *b5;
- (IBAction)b6:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *b6;
- (IBAction)b7:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *b7;
- (IBAction)b8:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *b8;
- (IBAction)b9:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *b9;
- (IBAction)b10:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *b10;
- (IBAction)b11:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *b11;
- (IBAction)b12:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *b12;
- (IBAction)b13:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *b13;
- (IBAction)b14:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *b14;


- (IBAction)back:(id)sender;
@end
