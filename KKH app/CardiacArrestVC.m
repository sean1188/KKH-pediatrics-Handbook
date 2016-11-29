//
//  CardiacArrestVC.m
//  KKH app
//
//  Created by Sean Lim on 27/11/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "CardiacArrestVC.h"

@interface CardiacArrestVC ()

@end

@implementation CardiacArrestVC
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}
-(void) setcolor {
    for (UIView *view in _SECONDARYvca) {
        [view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    }
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
    for (UIView *views in _primaryVCA) {
        [views setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    }
    
}
-(void)viewWillAppear:(BOOL)animated{
    _checkListView.alpha = 0;
    _proceedView.alpha =0;
    _proceedView.layer.cornerRadius = 10;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setcolor];
    [_weightL setText:[NSString stringWithFormat:@"%liKG",[[[NSUserDefaults standardUserDefaults] objectForKey:@"Cweight"] integerValue]]];
    _step1Button.layer.cornerRadius = 10.0f;
    _button1.layer.cornerRadius = 10.0f;
    _button2.layer.cornerRadius = 10;
    _checkListView.layer.cornerRadius = 10.0f;
    _checkListView.layer.shadowOpacity = 0.6;
    _checkListView.layer.shadowRadius = 5;
    _checkListView.layer.shadowOffset = CGSizeMake(1 , 1);

}

-(void) callRes: (int)index{
    int weight = [[[NSUserDefaults standardUserDefaults] objectForKey:@"Cweight"] intValue];
    switch (index) {
        case 0:{
            int IVIO = weight * 10;
            int ETT = weight * 100;
            float dilution = weight*0.1;
            [_shockableTitle setText:@"NON- SHOCKABLE RHYTHM: ASYSTOLE/ PEA"];
            [_instructText setText:[NSString stringWithFormat:@"  1. Start CPR immediately. \n\n\n 2. Give ADRENALINE: \n   - IV/IO\n  Administer %i MICROgram (%0.1f ML 1:10000)\n\n 10 MICROGRAM/KG (0.1 ML/KG   1:10000) \n\n   - ETT\n  Administer %i MICROgram (%0.1f ML 1:1000) \n\n 100 MICROGRAM/KG (0.1 ML/KG   1:1000) \n\n\n Exclude Hs & Ts: \n   HypoVolaemia\n   Hypoxia\n   Hydrogen Ion (Acidosis)\n   Hypokalaemia\n   HypoGlycaemia\n   HypoThermia\n   Trauma\n   Toxins\n   Tamponade\n   Tension Pneumothorax\n   Thrombosis (Pulmonary or Coronary)",IVIO, dilution,ETT,dilution]];
            
            //call checkbox
            [UIView animateWithDuration:0.3 animations:^{
                _checkListView.alpha = 1;
            }];
            break;}
        case 1:{
            [UIView animateWithDuration:0.2 animations:^{
                _proceedView.alpha = 1;
                
            }];
            [_shockableTitle setText:@"SHOCKABLE RHYTHM: PULSELESS VT/ VF"];
            int shock_J = weight *4;
            int adrelanine = weight *10;
            int AMIODARONE = weight *5;
            [_instructText setText:[NSString stringWithFormat:@" 1. Call for help and Defibrillator \n\n \n 2. DEFIBRILLATION ALGORITHM \n\n  - 1ST SHOCK:    %i JOULES \n CPR 1-2 Minutes, minimise time between shock & CPR, check rhythm & SHOCK immediately after chest. \n\n\n  - 2ND SHOCK:    %i JOULES \n CPR 1-2 Minutes, minimise time between shock & CPR, check rhythm & SHOCK immediately after chest. \n\n\n  - 3RD SHOCK:    %i JOULES \n CPR 1-2 Minutes, minimise time between shock & CPR, check rhythm & SHOCK immediately after chest. \n\n\n  - Adrenaline IV/IO: \n%i MICROgrams \n(1ML 1 : 10000 DILUTION) \n\n  - Amiodarone IV/IO: \n%i MILLIgrams over 5 minutes. \n\n\n  - SHOCK:    %i JOULES \n(resume CPR immediately without checking rhythm) \n\n\n  - Give ADRENALINE every other SHOCK (EVERY 3- 5 MINUTES).  \n\n\n  - SHOCK:    %i JOULES \n(resume CPR immediately without checking rhythm) \n\n\n  - Give ADRENALINE & AMIODARONE \n\n\n SHOCK:    %i JOULES \n(resume CPR immediately without checking rhythm) \n\n\n  - Give ADRENALINE every other SHOCK (EVERY 3- 5 MINUTES). \n\n\n  - SHOCK:    %i JOULES \n(resume CPR immediately without checking rhythm) \n\n\n  - Give ADRENALINE & AMIODARONE (3rd and Last dose). \n\n\n  - Continue until return of pulse. \n\n\n  - POST RESUS CARE \n Assist Ventilation is indicated.",shock_J, shock_J, shock_J,adrelanine, AMIODARONE, shock_J, shock_J, shock_J, shock_J]];

            break;
        }
        default:
            break;
    }
}
- (IBAction)NshockRhy:(id)sender {
    [self callRes:0];
}

- (IBAction)ShockRhy:(id)sender {
    [self callRes:1];
}
- (IBAction)check1:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_check1 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_check1 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)check2:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_check2 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_check2 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)check3:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_check3 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_check3 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)check4:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_check4 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_check4 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)check5:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_check5 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_check5 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)check6:(id)sender {
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_check6 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_check6 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)checkNext:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _checkListView.alpha = 0;
    }completion:^(BOOL s){
        [UIView animateWithDuration:0.3 animations:^{
            _proceedView.alpha =1;
        }];
    }];
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
