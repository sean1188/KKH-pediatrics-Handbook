//
//  MalignantHyperthermia.m
//  KKH app
//
//  Created by Guest User on 2/12/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "MalignantHyperthermia.h"

@interface MalignantHyperthermia ()

@end

@implementation MalignantHyperthermia

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}
-(void) setcolor {
    _treamentResView.backgroundColor = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]];
    for (UIView *view in _secondaryMH) {
        [view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    }
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setcolor];
    [_weightLabell setText:[NSString stringWithFormat:@"%i KG",[[[NSUserDefaults standardUserDefaults] objectForKey:@"Cweight"] intValue]]];
    for (UIButton *button in _buttonArray) {
        button.layer.cornerRadius = 10.0f;
    }
    _treamentResView.alpha = 0;
    _instructonView.alpha = 0;
}


- (IBAction)recognition:(id)sender {
    [_instructions setText:[NSString stringWithFormat:@"RECOGNITION\n\n** Previous uneventful GA DOES NOT rule out MH.\n\nCLINICAL \n\n1. Unexplained increase in ETCO2\n2. Unexplained Tachycardia\n3. Unexplained increase in Oxygen requirements\n4. Trunk or limb rigidity\n5. Masseter spasm (Trismus)\n6. Unstable or rising blood pressure\n7. Respiratory & Metabloic Acidosis\n8. Arrhythmias\n9. Temperature changes are a LATE sign. \n\nBIOCHEMICAL \n\n1. increased PaCO2\n2. decreased PH\n3. increased serum K\n4. decreased PaO2\n5. increased creatine kinase\n6. myoglobinuria	"]];
    [UIView animateWithDuration:0.3 animations:^{ _instructonView.alpha = 1;}];
}

- (IBAction)diffD:(id)sender {
    [_instructions setText:[NSString stringWithFormat:@"DIFFERENTIAL DIAGNOSIS\n\n1. Inadequate anaesthesia or analgesia\n2. Inappropriate breathing circuit, fresh gas flow or ventilation\n3. Infection or sepsis\n4. Tourniquet ischaemia\n5. Anaphylaxis\n6. Pheochromocytoma\n7. Thyroid storm	"]];
    [UIView animateWithDuration:0.3 animations:^{ _instructonView.alpha = 1;}];

}

- (IBAction)immediateMan:(id)sender {
    [_instructions setText:[NSString stringWithFormat:@"IMMEDIATE MANAGEMENT\n\n1. Call for help\n2. STOP all triggers (turn OFF VOLATILE anaesthetics)\n3. Get MH Box with Dantrolene\n4. Notify surgeon\n5. Install clean breathing circuit\n6. Hyperventilate with 100-percent oxygen\n7. Maintain anaesthesia with IV anaesthetics\n8. Muscle relaxation with Non-Depolarising neuromuscular blockers\n9. Finish/ abandon surgery ASAP				"]];
    [UIView animateWithDuration:0.3 animations:^{ _instructonView.alpha = 1;}];

}

- (IBAction)Monitoring:(id)sender {
    [_instructions setText:[NSString stringWithFormat:@"MONITOR\n\n1. Core & Peripheral TEMPERATURE\n2. ECG\n3. Invasive BP\n4. CVP\n5. ETCO2/ PaCO2\n6. SpO2/ PaO2\n7. serum CREATINE KINASE\n8. serum K\n9. coagulation profile	"]];
    [UIView animateWithDuration:0.3 animations:^{ _instructonView.alpha = 1;}];

}

- (IBAction)Treatment:(id)sender {
    int weight = [[[NSUserDefaults standardUserDefaults ] objectForKey:@"Cweight"] intValue];
    float dantrolene = weight * 2.5;
    float subsequentBoluses =weight * 1;
    [_dantrolenelabel setText:[NSString stringWithFormat:@"%0.1f MILLIgrams rapidly", dantrolene]];
    [_subsequentBoluses setText:[NSString stringWithFormat:@"Subsequent dantrolene boluses: %0.1f MILLIgrams intravenously. (1 MILLIgram/KG) (every 5 minutes til symptoms subside or up to total of 10 MILLIgrams/KG)",subsequentBoluses]];
    [UIView animateWithDuration:0.3 animations:^{
        _treamentResView.alpha = 1;
    }];
}


- (IBAction)back:(id)sender {
    if (_treamentResView.alpha == 1) {
        [UIView animateWithDuration:0.3 animations:^{
            _treamentResView.alpha = 0;
        }];
    }
    else if (_instructonView.alpha == 1){
        [UIView animateWithDuration:0.3 animations:^{
            _instructonView.alpha = 0;
        }];
    }
    else{
    [self dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
