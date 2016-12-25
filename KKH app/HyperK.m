//
//  HyperK.m
//  KKH app
//
//  Created by Guest User on 2/12/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "HyperK.h"

@interface HyperK ()

@end

@implementation HyperK

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}

-(void) setcolor {
    for (UIView *view in _secondaryViewHK) {
        [view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    }
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
    [_instructView setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setcolor];
    [_weightLabel setText:[NSString stringWithFormat:@"%@ KG", [[NSUserDefaults standardUserDefaults] objectForKey:@"Cweight"]]];
    _treatmentB.layer.cornerRadius = 15.0f;
    _managementAlgorithm_Button.layer.cornerRadius = 15.0f;
    _checkListView.layer.cornerRadius = 10.0f;
    _AlgorithmBlur.alpha = 0; _instructView.alpha = 0; _checkListView.alpha = 0; _algorithmView.alpha = 0; _blurViewBack.alpha = 0;
    _algorithmView.delegate = self;
    _algorithmView.contentSize = _algorithmImg.frame.size;
    _algorithmView.scrollEnabled = YES;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.algorithmImg;
}


- (IBAction)managementAlgorithm_Pressed:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _AlgorithmBlur.alpha = 1;
        _algorithmView.alpha = 1;
        _blurViewBack.alpha = 1;
    }];
}

- (IBAction)treatment:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _AlgorithmBlur.alpha = 1;
        _checkListView.alpha = 1;
    }];
}

- (IBAction)checkListNext_Pressed:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _checkListView.alpha = 0;
    }completion:^(BOOL s ){
        //init instructions
        int weight = [[[NSUserDefaults standardUserDefaults] objectForKey:@"Cweight"] intValue];
        float Insulin = 0.1 *weight;
        float dextrose10 = 5 *weight;
        float dextrose50 = 1 *weight;
        float CG = 0.5 *weight;
        float Cacl = 0.2 *weight;
        float NAHCO3 = 1 *weight;
        [_instructTextview setText:[NSString stringWithFormat:@"  Initiate Treatment: \n\n   Salbutamol 0.5-percent solution: Nebulise with 8 L oxygen , \n  < 25 KG: 2.5 MG in 4 ML of NS Q1-2H\n  > 25 KG: 5 MG in 4 ML of NS Q1-2H		\n\n   Regular Insulin (Actrapid): IV,   %0.1f IU \nOnset 15-20 min for 4-6 h, administer together with DEXTROSE, 1 IU to every 5 g glucose, administer in 1 IU/ML dilution, MAX: 10 IU per dose, check H/C; may cause hypoglycaemia, may be repeated.\n\n   Dextrose 10-Percent: IV,   %0.1f ML \nAdminister together with INSULIN\n\n   Dextrose 50-Percent: IV,   %0.1f ML \nAdminister via large bore peripheral IV or central venous access, administer together with insulin \n\n   10-Percent Calcium Gluconate: IV,   %0.1f ML \nOnset 5-10 min for 30-60 min, may cause hypercalcaemia & tissue necrosis may be repeated.\n   10-Percent Calcium Chloride: IV,   %0.1f ML \n\n   8.4-percent NaHCO3: IV,   %0.1f ML \nOnset 15 mins for 1-2 Hr, give over 10 min. DO NOT mix with Calcium, Max: 50 mmol/dose.",Insulin, dextrose10, dextrose50, CG, Cacl, NAHCO3]];
        [UIView animateWithDuration:0.3 animations:^{
            _AlgorithmBlur.alpha = 0;
            _instructView.alpha = 1;
        }];
    }];
}

- (IBAction)blurViewBack:(id)sender {
    //back from management algorithm
    [UIView animateWithDuration:0.3 animations:^{
        _AlgorithmBlur.alpha = 0;
        _algorithmView.alpha = 0;
        _blurViewBack.alpha = 0;
    }];
}

- (IBAction)back:(id)sender {
    if (_instructView.alpha == 1) {
        [UIView animateWithDuration:0.3 animations:^{
            _instructView.alpha = 0;
        }];
    }
    else{
        [self dismissViewControllerAnimated:YES completion:nil];}
}

#pragma mark - checklist methods
- (IBAction)check1a:(id)sender{
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_c1 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_c1 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)check2:(id)sender{
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_c2 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_c2 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)check3:(id)sender{
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_c3 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_c3 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)check4:(id)sender{
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_c4 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_c4 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)check5:(id)sender{
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_c5 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_c5 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)check6:(id)sender{
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_c6 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_c6 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)check7:(id)sender{
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_c7 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_c7 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)check8:(id)sender{
    if ([[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] isEqual:[sender currentImage]]) {
        [_c8 setImage:[UIImage imageNamed:@"ic_check_box_white.png"] forState:UIControlStateNormal];
    }
    else if ([[UIImage imageNamed:@"ic_check_box_white.png"] isEqual:[sender currentImage]]){
        [_c8 setImage:[UIImage imageNamed:@"ic_check_box_outline_blank_white.png"] forState:UIControlStateNormal];
    }
    
}
@end
