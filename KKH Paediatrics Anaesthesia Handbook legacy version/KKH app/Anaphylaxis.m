//
//  Anaphylaxis.m
//  KKH app
//
//  Created by Guest User on 2/12/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "Anaphylaxis.h"

@interface Anaphylaxis ()

@end

@implementation Anaphylaxis
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}
-(void) setcolor {
    for (UIView *view in _secondaryphy) {
        [view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    }
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
    [self.instrcutionView setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setcolor];
    [_weightLabelll setText:[NSString stringWithFormat:@"%i KG",[[[NSUserDefaults standardUserDefaults] objectForKey:@"Cweight"] intValue]]];
    _checklistView.layer.cornerRadius = 10.0f;
    _immediateB.layer.cornerRadius = 15.0f;
    _seocndaryB.layer.cornerRadius = 15.0f;
    _stack2.alpha = 0; _blurview.alpha = 0;
    _instrcutionView.alpha = 0;
}

#pragma  mark-
- (IBAction)immediate:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _blurview.alpha =1;
    }];
}

- (IBAction)secondary:(id)sender {
    int weight = [[[NSUserDefaults standardUserDefaults] objectForKey:@"Cweight"] intValue];
    float Hydrocor = weight *2;
    float phenylephrine = weight *10;
    float vasopressin = weight *0.03;
    float aminophylline = weight *10;
    float diphenhyramine = weight * 1;
    float ranitidine = weight *1;
    [_textViewINS setText:[NSString stringWithFormat:@"SECONDARY TREATMENT \n\nAnti-Inflammatory Hydrocortisone: IV/IO   BOLUS  %0.1f MILLIgram \n\nConsider if hypotension persist despite epinephrine: \n  Phenylephrine:  IV/IO  BOLUS  %0.1f MICROgram \n  Vasopressin:  IV/IO  BOLUS  %0.02f UNITS \n  NOREPINEPHRINE infusion at 0.01-0.2 MICROgram/KG/MIN \n\nConsider if bronchospasm: \n  Salbutamol Inhaler: 4-10 puffs \n  Aminophylline:  IV/IO  SLOW BOLUS (1 Hour)  %0.1f MILLIgram\n  Diphenhydramine:  IV/IO  SLOW BOLUS  %0.1f MILLIgram \n  Ranitidine:  IV/IO  BOLUS  %0.1f MILLIgram ",Hydrocor,phenylephrine,vasopressin,aminophylline,diphenhyramine,ranitidine]];
    [UIView animateWithDuration:0.3 animations:^{
        _instrcutionView.alpha = 1;
    }];
}

- (IBAction)Next:(id)sender {
    if (_stack2.alpha == 0) {
        [UIView animateWithDuration:0.3 animations:^{
            _stack1.alpha = 0;
        }completion:^(BOOL s ){
            [UIView animateWithDuration:0.3 animations:^{
                _stack2.alpha = 1;
            }];
        }];
    }
    else{
        //init for immediate treatment
        int weight = [[[NSUserDefaults standardUserDefaults] objectForKey:@"Cweight"] intValue];
        float NSRL = weight *10;
        float EpinephrineIMmirco = weight *10;
        float EpinephrineIMML = weight *0.1;
        float EpinePhrineIVIOmicro = weight *1;
        float EpinePhrineIVIOML = weight *0.1;
        [_textViewINS setText:[NSString stringWithFormat:@"IMMEDIATE TREATMENT \n\nNS/RL: IV  BOLUS  :  %0.1f ML \n\nEPINEPHRINE \n  IM  BOLUS  %0.1f MIRCOgrams or %0.1f ML \n  IV/VO  BOLUS  %0.1f MICROgrams or %0.1f ML \n\n0.02-0.2 MICROgram/KG/min INFUSION. \n",NSRL, EpinephrineIMmirco, EpinephrineIMML,EpinePhrineIVIOmicro, EpinePhrineIVIOML]];
        _instrcutionView.alpha = 1;
        [UIView animateWithDuration:0.3 animations:^{
            _blurview.alpha = 0;
            
        }completion:^(BOOL s ){
            //reset
            _stack1.alpha = 1;
            _stack2.alpha = 0;
            for (UIButton *button in _buttonCollection) {
                [button setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
            }
        }];
    }
}

- (IBAction)back:(id)sender {
    if (_instrcutionView.alpha == 1) {
        [UIView animateWithDuration:0.3 animations:^{
            _instrcutionView.alpha = 0;
        }];
    }
    else{
    [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma  mark - checklist buttons

- (IBAction)b1:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_b1 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_b1 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)b2:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_b2 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_b2 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)b3:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_b3 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_b3 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)b4:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_b4 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_b4 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)b5:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_b5 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_b5 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)b6:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_b6 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_b6 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)b7:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_b7 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_b7 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)b8:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_b8 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_b8 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)b9:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_b9 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_b9 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)b10:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_b10 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_b10 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)b11:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_b11 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_b11 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)b12:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_b12 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_b12 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)b13:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_b13 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_b13 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)b14:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_b14 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_b14 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}
@end
