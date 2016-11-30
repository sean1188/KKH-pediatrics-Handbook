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
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setcolor];
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
}

- (IBAction)cardioToxicityPressed:(id)sender {
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
