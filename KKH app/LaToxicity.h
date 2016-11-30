//
//  LaToxicity.h
//  KKH app
//
//  Created by Sean Lim on 29/11/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "ViewController.h"

@interface LaToxicity : ViewController

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *secondaryLAviews;


@property (strong, nonatomic) IBOutlet UILabel *weightLabel;

@property (strong, nonatomic) IBOutlet UIButton *immediateManB;
- (IBAction)immediateManagement:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *checkListView_forImmediateManagement;
- (IBAction)IMdone:(id)sender;

- (IBAction)IM1:(id)sender;
- (IBAction)IM2:(id)sender;
- (IBAction)IM3:(id)sender;
- (IBAction)IM4:(id)sender;
- (IBAction)IM5:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *IM1;
@property (strong, nonatomic) IBOutlet UIButton *IM2;
@property (strong, nonatomic) IBOutlet UIButton *IM3;
@property (strong, nonatomic) IBOutlet UIButton *IM4;
@property (strong, nonatomic) IBOutlet UIButton *IM5;


@property (strong, nonatomic) IBOutlet UIButton *neuroTb;
- (IBAction)neuroToxicity:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *cardioTb;
- (IBAction)cardioToxicityPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *circulatoryArrest;
- (IBAction)hasCirculatoryArrest:(id)sender;
- (IBAction)NoCirculatoryArrest:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Carrest;
@property (strong, nonatomic) IBOutlet UIButton *Carrest2;




@property (strong, nonatomic) IBOutlet UIView *InstructionView;
@property (strong, nonatomic) IBOutlet UITextView *instructionTextView;


- (IBAction)back:(id)sender;

@end
