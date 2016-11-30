//
//  LaToxicity.m
//  KKH app
//
//  Created by Sean Lim on 29/11/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "LaToxicity.h"

@interface LaToxicity ()

@end

@implementation LaToxicity
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}
-(void) setcolor {
    for (UIView *view in _secondaryLAviews) {
        [view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    }
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
    [_InstructionView setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
    [_circulatoryArrest setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setcolor];
    _InstructionView.alpha = 0;
    _circulatoryArrest.alpha = 0;
    _Carrest.layer.cornerRadius = 15.0f;
    _Carrest2.layer.cornerRadius = 15.0f;
    _checkListView_forImmediateManagement.alpha = 0;
    _checkListView_forImmediateManagement.clipsToBounds = YES; _checkListView_forImmediateManagement.layer.cornerRadius = 10.0f;
    weightLA = [[[NSUserDefaults standardUserDefaults] objectForKey:@"Cweight"] intValue];
    [_weightLabel setText:[NSString stringWithFormat:@"%@ KG",[[NSUserDefaults standardUserDefaults] objectForKey:@"Cweight"]]];
    _immediateManB.layer.cornerRadius = 15.0f; _neuroTb.layer.cornerRadius = 15.0f; _cardioTb.layer.cornerRadius = 15.0f;
}
int weightLA;
- (IBAction)immediateManagement:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _checkListView_forImmediateManagement.alpha = 1;
    }];
}
- (IBAction)IMdone:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{ _checkListView_forImmediateManagement.alpha = 0; }completion:^(BOOL s){
        [_IM1 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
        [_IM2 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
        [_IM3 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
        [_IM4 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
        [_IM5 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];

    }];
}

- (IBAction)IM1:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_IM1 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_IM1 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)IM2:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_IM2 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_IM2 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)IM3:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_IM3 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_IM3 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)IM4:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_IM4 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_IM4 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)IM5:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_IM5 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_IM5 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)neuroToxicity:(id)sender {
    float midazolam = weightLA * 0.05;
    float thiopentone = weightLA * 4;
    float propofol = weightLA * 1;
    [_instructionTextView setText:[NSString stringWithFormat:@"   Give benzodiazepine, thiopentone or propofol in small incremental doses \n\n  MIDAZOLAM, IV, 0.05/KG,   %0.01f MG in small incremental doses. \n\n  THIOPENTONE, IV, 4.00/KG,   %0.1f MG in small incremental doses. \n\n  PROPOFOL, IV, 1.00/KG,   %0.1f MG in small incremental doses.", midazolam, thiopentone, propofol]];
    [UIView animateWithDuration:0.3 animations:^{
        _InstructionView.alpha = 1;
    }];
}

- (IBAction)cardioToxicityPressed:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _circulatoryArrest.alpha = 1;
    }];
}
- (IBAction)hasCirculatoryArrest:(id)sender {
    float bolus = weightLA * 1.5;
    float infusion = weightLA * 15;
    float infusionDoubleRate = weightLA * 30;
    float limit = weightLA * 12;
    [_instructionTextView setText:[NSString stringWithFormat:@"  1. Start CPR.\n\n  2. INTRALIPID THERAPY\n (20 percent LIPID EMULSION) \n ** LAST treatment box (BLACK) located in MOT recovery & outside DSOT 2 \n\n\n   Immediate: \n\n   Bolus  (1.5ML/KG) IV  %0.1f ML Over 1 Minute \n\n  Infusion (15 ML/KG/H) IV %0.1f ML Over 1 Hour \n\n\n  After 5 Minutes, if cardiovascular stabilty is NOT restored : \n\n  1. Repeat bolus up to maximum of 2X (same dose) 5 minutes apart \n\n  2. Double rate of INFUSION: %0.1f ML Over 1 Hour \n\n  DO NOT EXCEED MAXIMUM CUMMULATIVE DOSE (12 ML/KG) = %0.1f ML", bolus, infusion, infusionDoubleRate, limit]];
    [UIView animateWithDuration:0.3 animations:^{
        _InstructionView.alpha = 1;
    }];
}

- (IBAction)NoCirculatoryArrest:(id)sender {
    float epinephrineMICRO = weightLA * 1;
    float epinephrineML = weightLA * 0.1;
    float bolus = weightLA * 1.5;
    float infusion = weightLA * 15;
    float infusionDoubleRate = weightLA * 30;
    float limit = weightLA * 12;
    [_instructionTextView setText:[NSString stringWithFormat:@"   Use conventional therapies to treat Hypotension, Bradycardia, Tachyarrhythmias. \n\n   HYPOTENSION: \n    Epinephrine IV %0.1f MICROgrams OR %0.1f ML\n\n   ARRHYTHMIA: \n   * Lignocaine should NOT be used as as antiarrhythmic therapy !\n   Avoid Calcium Channel Blockers and Beta Blockers. \n\n  Consider : INTRALIPID THERAPY\n (20 percent LIPID EMULSION) \n ** LAST treatment box (BLACK) located in MOT recovery & outside DSOT 2 \n\n\n   Immediate: \n\n   Bolus  (1.5ML/KG) IV  %0.1f ML Over 1 Minute \n\n  Infusion (15 ML/KG/H) IV %0.1f ML Over 1 Hour \n\n\n  After 5 Minutes, if cardiovascular stabilty is NOT restored : \n\n  1. Repeat bolus up to maximum of 2X (same dose) 5 minutes apart \n\n  2. Double rate of INFUSION: %0.1f ML Over 1 Hour \n\n  DO NOT EXCEED MAXIMUM CUMMULATIVE DOSE (12 ML/KG) = %0.1f ML",epinephrineMICRO, epinephrineML, bolus, infusion, infusionDoubleRate, limit]];
    [UIView animateWithDuration:0.3 animations:^{
        _InstructionView.alpha = 1;
    }];
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
