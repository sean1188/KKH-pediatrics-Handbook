//
//  BLSController.m
//  KKH app
//
//  Created by Sean Lim on 27/11/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "BLSController.h"

@interface BLSController ()

@end

@implementation BLSController
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}
-(void) setcolor {
    for (UIView *view in _secondViews) {
        [view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    }
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
    for (UIView *views in _priViews) {
        [views setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setcolor];
    BLS_state = 0;
    _resText.alpha = 0;
    _resText.layer.cornerRadius = 10.0f;
    [_stateLabel setText:[NSString stringWithFormat:@"Step %i:",BLS_state+1]];
    _button1.layer.cornerRadius = 15.0f;
    _button2.layer.cornerRadius = 15.0f;
    
}
-(void) initSetup1{
    [_stateLabel setText:[NSString stringWithFormat:@"Step %i:",BLS_state + 1]];
    [_instructions setText:@"Check for pulse."];
    [_button1 setTitle:@"Pulse Present" forState:UIControlStateNormal];
    [_button2 setTitle:@"No Pulse" forState:UIControlStateNormal];

}
-(void)clearWorkspace{
    _stateLabel.alpha= 0;
    _instructions.alpha = 0;
    _button1.alpha = 0;
    _button2.alpha = 0;
    
}
-(void) initRes{
    [self clearWorkspace];
    if (isBreathing == NO | hasPulse == NO) {
        //CPR algorithm
        [_resText setText:@"  Cardiopulmonary Resuscitation \n \nSINGLE RESCUER: \n  30 Compressions : 2 Breaths \n \nHEALTHCARE PROVIDER, TEAM RESUSCITATION: \n  - No advanced airway- 15 compressions : 2 breaths \n  - Advanced airway (LMA/ ETT)-  provide 100 compressions & 10 ventilations per minute \n  - Push Hard Push Fast \n  - Minimise interruptions to compressions \n  - Rotate roles to avoid fatigue \n  - Recheck pulse every 2 minutes"];
    }
    else{
        //Rescue Breathing
        [_resText setText:@"  Rescue Breathing \n \n  - 1 Breath every 3 seconds \n  *(Breathe a thousand, 2 a thousand, 3 a thousand then repeat cycle) \n  - Re-check pulse every 2 minutes"];
    }
    [UIView animateWithDuration:0.3 animations:^{
        _resText.alpha = 1;
    }];
   
}

int BLS_state;
BOOL isBreathing, hasPulse;
- (IBAction)button1:(id)sender {
    if (BLS_state == 0) {
        isBreathing = YES;
        BLS_state ++;
        [self initSetup1];
    }
    else if (BLS_state == 1){
        hasPulse = YES;
        [self initRes];
    }
}

- (IBAction)button2:(id)sender {
    if (BLS_state == 0) {
        isBreathing = NO;
        BLS_state ++;
        [self initSetup1];
    }
    else if (BLS_state == 1){
        hasPulse = NO;
        [self initRes];
    }
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
