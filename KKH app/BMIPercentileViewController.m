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
    didSelectGender = NO;
    editing = NO;
    state = 0;
    _GenderView.alpha = 0;
    _bmiManager = [BMIGraphManager alloc];
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
    if (editing != YES) {
        
        editing = YES;
        
    NextBI = _NextButton.frame;
        
    [UIView animateWithDuration:0.3 animations:^{
        bmiViewI = _bmiView.frame;
        _header.alpha = 0;
        _NextButton.translatesAutoresizingMaskIntoConstraints = YES;
        if (state == 0) {
            _bmiView.translatesAutoresizingMaskIntoConstraints = YES;
             _bmiView.frame = CGRectMake(_bmiView.frame.origin.x, _bmiView.frame.origin.y - 110, _bmiView.frame.size.width, _bmiView.frame.size.height);
             _NextButton.frame = CGRectMake(_NextButton.frame.origin.x, _bmiView.frame.origin.y + 200, _NextButton.frame.size.width, _NextButton.frame.size.height);
        }
        else{
            GenderViewI = _GenderView.frame;
            _GenderView.translatesAutoresizingMaskIntoConstraints = YES;
             _GenderView.frame = CGRectMake(_GenderView.frame.origin.x, _GenderView.frame.origin.y - 180, _GenderView.frame.size.width, _GenderView.frame.size.height);
             _NextButton.frame = CGRectMake(_NextButton.frame.origin.x, _GenderView.frame.origin.y + 300, _NextButton.frame.size.width, _NextButton.frame.size.height);
        }
       
       
    }];
    }
    
    
}

//Variables to pass to backend//
float BMIValue;
int Age;
bool isMale;
bool didSelectGender;
- (IBAction)next:(id)sender {
    [self resignFirstResponder];
    if (state == 0) {
        [UIView animateWithDuration:0.3 animations:^{
            _backB.alpha = 0;
        }];
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
                [_ageField becomeFirstResponder];
                GenderViewI = _GenderView.frame;
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
            state = 1;
            [UIView animateWithDuration:0.5 animations:^{
                _GenderView.alpha =1;
                [_ageField becomeFirstResponder];
            }];
        }];
    }
    }
    /*
     case Nil = 0;
     case SeverelyUnderweight = 1;
     case Underweight = 2;
     case Acceptable = 3;
     case Overweight = 4;
     case SeverelyOverweight = 5;
     */
    else if (state ==1 ){
        [self didTap:nil];
        if (didSelectGender == YES & ![_ageField.text isEqualToString:@""] ) {
            //send data
            Age = _ageField.text.integerValue;
            if (Age > 18){
                UIAlertController *a = [UIAlertController alertControllerWithTitle:@"Error" message:@"Please enter a valid age" preferredStyle:UIAlertControllerStyleAlert];
                [a addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleCancel handler:nil]];
                [self presentViewController:a  animated:YES completion:nil];
            }
            else if ([[_bmiManager initWithAge:Age bmi:BMIValue isMale:isMale] range] == 0) {
                NSLog(@"nil");
                UIAlertController *a = [UIAlertController alertControllerWithTitle:@"Nil" message:@"An Error has occurred" preferredStyle:UIAlertControllerStyleAlert];
                [self presentViewController:a  animated:YES completion:^{
                    double delayInSeconds = 1.0;
                    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                        [a dismissViewControllerAnimated:YES completion:^{
                            [self dismissViewControllerAnimated:YES completion:nil];
                        }];
                    });
                }];
            }
            else if ([[_bmiManager initWithAge:Age bmi:BMIValue isMale:isMale] range] == 1){
                NSLog(@"severe Underweight");
                UIAlertController *a = [UIAlertController alertControllerWithTitle:@"Severely Underweight" message:[NSString stringWithFormat:@"BMI : %0.1f",BMIValue ] preferredStyle:UIAlertControllerStyleAlert];
                [self presentViewController:a  animated:YES completion:^{
                    double delayInSeconds = 3.0;
                    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                        [a dismissViewControllerAnimated:YES completion:^{
                            [self dismissViewControllerAnimated:YES completion:nil];
                        }];
                    });
                }];

            }
            else if ([[_bmiManager initWithAge:Age bmi:BMIValue isMale:isMale] range] == 2){
                NSLog(@"underweight");
                UIAlertController *a = [UIAlertController alertControllerWithTitle:@"Underweight" message:[NSString stringWithFormat:@"BMI : %0.1f",BMIValue ] preferredStyle:UIAlertControllerStyleAlert];
                [self presentViewController:a  animated:YES completion:^{
                    double delayInSeconds = 3.0;
                    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                        [a dismissViewControllerAnimated:YES completion:^{
                            [self dismissViewControllerAnimated:YES completion:nil];
                        }];
                    });
                }];


            }
            else if ([[_bmiManager initWithAge:Age bmi:BMIValue isMale:isMale] range] == 3){
                NSLog(@"acceptable");
                UIAlertController *a = [UIAlertController alertControllerWithTitle:@"Acceptable" message:[NSString stringWithFormat:@"BMI : %0.1f",BMIValue ] preferredStyle:UIAlertControllerStyleAlert];
                [self presentViewController:a  animated:YES completion:^{
                    double delayInSeconds = 3.0;
                    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                        [a dismissViewControllerAnimated:YES completion:^{
                            [self dismissViewControllerAnimated:YES completion:nil];
                        }];
                    });
                }];


            }
            else if ([[_bmiManager initWithAge:Age bmi:BMIValue isMale:isMale] range] == 4){
                NSLog(@"overweight");
                UIAlertController *a = [UIAlertController alertControllerWithTitle:@"Overweight" message:[NSString stringWithFormat:@"BMI : %0.1f",BMIValue ] preferredStyle:UIAlertControllerStyleAlert];
                [self presentViewController:a  animated:YES completion:^{
                    double delayInSeconds = 3.0;
                    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                        [a dismissViewControllerAnimated:YES completion:^{
                            [self dismissViewControllerAnimated:YES completion:nil];
                        }];
                    });
                }];


            }
            else if ([[_bmiManager initWithAge:Age bmi:BMIValue isMale:isMale] range] == 5){
                NSLog(@"severely overweight");
                UIAlertController *a = [UIAlertController alertControllerWithTitle:@"Severely Overweight" message:[NSString stringWithFormat:@"BMI : %0.1f",BMIValue ] preferredStyle:UIAlertControllerStyleAlert];
                [self presentViewController:a  animated:YES completion:^{
                    double delayInSeconds = 3.0;
                    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                        [a dismissViewControllerAnimated:YES completion:^{
                            [self dismissViewControllerAnimated:YES completion:nil];
                        }];
                    });
                }];


            }

}
    }

}
- (IBAction)didTap:(id)sender {
    if (editing == YES) {
        [self.view endEditing:YES];
    [UIView animateWithDuration:0.2 animations:^{
        if (state == 0) {
            _bmiView.frame    = bmiViewI;
            _bmiView.translatesAutoresizingMaskIntoConstraints = NO;

        }
        else{
            NSLog(@"memed");
            _GenderView.frame = GenderViewI;
            _GenderView.translatesAutoresizingMaskIntoConstraints = NO;
        }

        _NextButton.frame = NextBI;
        _NextButton.translatesAutoresizingMaskIntoConstraints = NO;
        _header.alpha = 1;
    } completion:^(BOOL s ){
        editing = NO;

    }];

        }

}
- (IBAction)genderSegment:(id)sender {
    didSelectGender = YES;
    if ([_genderSegment selectedSegmentIndex] == 0) {
        NSLog(@"male");
        isMale = YES;
        
    }
    else if ([_genderSegment selectedSegmentIndex] == 1){
        NSLog(@"female");
        isMale = NO;
    }
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
