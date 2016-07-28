//
//  BMIPercentileViewController.m
//  KKH app
//
//  Created by Sean Lim on 23/7/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "BMIPercentileViewController.h"
#import "KKH_app-Swift.h"

@interface BMIPercentileViewController ()
@property (strong, nonatomic) BMIGraphManager *bmiManager;
@end

@implementation BMIPercentileViewController


UIColor *primarycolor ;
UIColor *secondaryColor;
int state;
-(UIStatusBarStyle ) preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    isMale = NULL;
    editing = NO;
    state = 0;
    _GenderView.alpha = 0;
    // Do any additional setup after loading the view.
    primarycolor =[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]; secondaryColor = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]];
    [self.view setBackgroundColor:primarycolor];
    [_weight setBackgroundColor:secondaryColor];
    [_height setBackgroundColor:secondaryColor];
    [_header setText:@"Enter Height and Weight."];
    _header.adjustsFontSizeToFitWidth = YES;
    _weight.delegate = self; _height.delegate = self; _ageField.delegate = self;
    [_ageField  setBackgroundColor:secondaryColor];
}

CGRect bmiViewI, NextBI, GenderViewI;
bool editing;
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (editing!= YES) {
        editing = YES;
    bmiViewI = _bmiView.frame;
    NextBI = _NextButton.frame;
        GenderViewI = _GenderView.frame;
    [UIView animateWithDuration:0.3 animations:^{
        _header.alpha = 0;
        _NextButton.translatesAutoresizingMaskIntoConstraints = YES;
        if (state == 0) {
            _bmiView.translatesAutoresizingMaskIntoConstraints = YES;
             _bmiView.frame = CGRectMake(_bmiView.frame.origin.x, _bmiView.frame.origin.y - 110, _bmiView.frame.size.width, _bmiView.frame.size.height);
             _NextButton.frame = CGRectMake(_NextButton.frame.origin.x, _bmiView.frame.origin.y + 200, _NextButton.frame.size.width, _NextButton.frame.size.height);
        }
        else{
            _GenderView.translatesAutoresizingMaskIntoConstraints = YES;
             _GenderView.frame = CGRectMake(_GenderView.frame.origin.x, _GenderView.frame.origin.y - 110, _GenderView.frame.size.width, _GenderView.frame.size.height);
             _NextButton.frame = CGRectMake(_NextButton.frame.origin.x, _GenderView.frame.origin.y + 200, _NextButton.frame.size.width, _NextButton.frame.size.height);
        }
       
       
    }];
    }
    
}

//Variables to pass to backend//
float BMIValue;
int Age;
bool isMale;
- (IBAction)next:(id)sender {
    if (state == 0) {
        if (editing == YES & ![_weight.text isEqualToString:@""] & ![_height.text isEqualToString:@""]) {
            BMIValue = _weight.text.floatValue / ((_height.text.floatValue/ 100) * (_height.text.floatValue/100));
            NSLog(@"BMI is %0.1f",BMIValue);
    [UIView animateWithDuration:0.2 animations:^{
        _bmiView.frame    = bmiViewI;
        _NextButton.frame = NextBI;
        _bmiView.translatesAutoresizingMaskIntoConstraints = NO;
        _NextButton.translatesAutoresizingMaskIntoConstraints = NO;
        _header.alpha = 1;
    } completion:^(BOOL s ){
        editing = NO;
        state = 1;
        [_header setText:@"Enter Gender and Age"];
        [UIView animateWithDuration:0.3 animations:^{
            _bmiView.translatesAutoresizingMaskIntoConstraints = YES;
            _bmiView.frame = CGRectMake(-_bmiView.frame.size.width, _bmiView.frame.origin.y, _bmiView.frame.size.width, _bmiView.frame.size.height);
        }completion:^(BOOL s   ){
            [UIView animateWithDuration:0.5 animations:^{
                _GenderView.alpha =1;
                
            }];
        }];
    }];
    
    [_weight endEditing:YES]; [_height endEditing:YES];
    }
    else if( ![_weight.text isEqualToString:@""] & ![_height.text isEqualToString:@""]){
        state = 1;
        BMIValue = _weight.text.floatValue / ((_height.text.floatValue/ 100) * (_height.text.floatValue/100));
        NSLog(@" BMI is %0.1f",BMIValue);
        [_header setText:@"Enter Gender and Age"];
        [UIView animateWithDuration:0.3 animations:^{
            _bmiView.translatesAutoresizingMaskIntoConstraints = YES;
            _bmiView.frame = CGRectMake(-_bmiView.frame.size.width, _bmiView.frame.origin.y, _bmiView.frame.size.width, _bmiView.frame.size.height);
        } completion:^(BOOL s   ){
            [UIView animateWithDuration:0.5 animations:^{
                _GenderView.alpha =1;

            }];
        }];
    }
    }
    else if (state ==1 ){
        [self didTap:nil];
        if (![_ageField.text isEqualToString:@""] & isMale != NULL) {
            //send data
            Age = _ageField.text.integerValue;
            NSLog(@" age : %i bmi: %0.01f",Age, BMIValue);
            [_bmiManager rangee];
        }
    }

}
- (IBAction)didTap:(id)sender {
    if (editing == YES) {

    [UIView animateWithDuration:0.2 animations:^{
        if (state == 0) {
            _bmiView.frame    = bmiViewI;
            _bmiView.translatesAutoresizingMaskIntoConstraints = NO;

        }
        else{
            _GenderView.frame = GenderViewI;
            _GenderView.translatesAutoresizingMaskIntoConstraints = NO;
        }

        _NextButton.frame = NextBI;
        _NextButton.translatesAutoresizingMaskIntoConstraints = NO;
        _header.alpha = 1;
    } completion:^(BOOL s ){
        editing = NO;

    }];

        [_weight endEditing:YES]; [_height endEditing:YES];[_ageField endEditing:YES];}

}
- (IBAction)genderSegment:(id)sender {
    if ([_genderSegment selectedSegmentIndex] == 0) {
        NSLog(@"male");
        isMale = YES;
        
    }
    else if ([_genderSegment selectedSegmentIndex] == 1){
        NSLog(@"female");
        isMale = NO;
    }
}
@end
