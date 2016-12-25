//
//  MalignantHyperthermia.h
//  KKH app
//
//  Created by Guest User on 2/12/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "ViewController.h"

@interface MalignantHyperthermia : ViewController

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *secondaryMH;
@property (weak, nonatomic) IBOutlet UILabel *weightLabell;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonArray;
- (IBAction)recognition:(id)sender;
- (IBAction)diffD:(id)sender;
- (IBAction)immediateMan:(id)sender;
- (IBAction)Treatment:(id)sender;
- (IBAction)Monitoring:(id)sender;

//instructionView
@property (weak, nonatomic) IBOutlet UIView *instructonView;
@property (weak, nonatomic) IBOutlet UITextView *instructions;


//Treatment
@property (weak, nonatomic) IBOutlet UIView *treamentResView;
@property (weak, nonatomic) IBOutlet UILabel *dantrolenelabel;
@property (weak, nonatomic) IBOutlet UILabel *subsequentBoluses;

- (IBAction)back:(id)sender;
@end
