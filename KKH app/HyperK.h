//
//  HyperK.h
//  KKH app
//
//  Created by Guest User on 2/12/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "ViewController.h"

@interface HyperK : ViewController

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *secondaryViewHK;

@property (weak, nonatomic) IBOutlet UILabel *weightLabel;

@property (weak, nonatomic) IBOutlet UIButton *managementAlgorithm_Button;
- (IBAction)managementAlgorithm_Pressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *AlgorithmBlur;
@property (weak, nonatomic) IBOutlet UIScrollView *algorithmView;
@property (weak, nonatomic) IBOutlet UIImageView *algorithmImg;


@property (weak, nonatomic) IBOutlet UIButton *treatmentB;
- (IBAction)treatment:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *checkListView;
- (IBAction)checkListNext_Pressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *instructView;
@property (weak, nonatomic) IBOutlet UITextView *instructTextview;

//checklist
@property (weak, nonatomic) IBOutlet UIButton *c1;
@property (weak, nonatomic) IBOutlet UIButton *c2;
@property (weak, nonatomic) IBOutlet UIButton *c3;
@property (weak, nonatomic) IBOutlet UIButton *c4;
@property (weak, nonatomic) IBOutlet UIButton *c5;
@property (weak, nonatomic) IBOutlet UIButton *c6;
@property (weak, nonatomic) IBOutlet UIButton *c7;
@property (weak, nonatomic) IBOutlet UIButton *c8;

- (IBAction)check1a:(id)sender;
- (IBAction)check2:(id)sender;
- (IBAction)check3:(id)sender;
- (IBAction)check4:(id)sender;
- (IBAction)check5:(id)sender;
- (IBAction)check6:(id)sender;
- (IBAction)check7:(id)sender;
- (IBAction)check8:(id)sender;



@property (weak, nonatomic) IBOutlet UIButton *blurViewBack;
- (IBAction)blurViewBack:(id)sender;

- (IBAction)back:(id)sender;

@end
