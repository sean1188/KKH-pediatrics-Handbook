//
//  Calculator.m
//  KKH app
//
//  Created by Sean Lim on 7/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "Calculator.h"
#import "KKH_app-Swift.h"

@interface Calculator ()

@property (strong, nonatomic) DrugCalculationsManager *mannager;

@end

@implementation Calculator
-(UIStatusBarStyle) preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void) setcolors{
    for (UIView *view in _secondaryViews) {
        [view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    }
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
    for (UIView *views in _primaryViews) {
        [views setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setcolors];
    _blur.alpha = 0;
    _revert.alpha= 0;
    _buttonPadding.layer.cornerRadius = self.buttonPadding.frame.size.width/2;
    _genderView.layer.cornerRadius = 16.0f;
    _inputview.alpha = 0;
    _inputview.layer.cornerRadius = 16.0f;
    _header.adjustsFontSizeToFitWidth = YES;
    // Do any additional setup after loading the view.
    [UIView animateWithDuration:0.6  animations:^{
        _calclogo.transform = CGAffineTransformMakeScale(1.4, 1.4);
        _calclogo.transform = CGAffineTransformMakeRotation(45.0f);
    }completion:^(BOOL s) {
        [UIView animateWithDuration:0.4  animations:^{
            _calclogo.transform = CGAffineTransformMakeRotation(-90.0f);
            _calclogo.transform = CGAffineTransformMakeScale(1.2, 1.2);
        } completion:^(BOOL s) {
            [UIView animateWithDuration:0.3 animations:^{
                _calclogo.transform = CGAffineTransformMakeRotation(90.0f);
                _calclogo.transform = CGAffineTransformMakeScale(1, 1);
            }];
            
            
        }];
    }];
}


- (IBAction)refButton:(id)sender {
    [self.navigationController performSegueWithIdentifier:@"ref" sender:self];
}

- (IBAction)listButton:(id)sender {
    [self.navigationController performSegueWithIdentifier:@"list" sender:self];
    
}

- (IBAction)settingsButton:(id)sender {
    [self.navigationController performSegueWithIdentifier:@"settings" sender:nil];
    
}

#pragma mark - data processing
//variable to pass to backend
bool isMale;
int age;
float height;
float weight;

//
- (IBAction)femalePressed:(id)sender {
    isMale = NO;
    _h1.alpha =0; _h2.alpha = 0;_h3.alpha = 0;_h4.alpha = 0;
    _h5.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        _blur.alpha = 1;
        _inputview.alpha = 1;

    }completion:^(BOOL s){
        _genderView .alpha = 0;
    }];
    [self initInput];
}

- (IBAction)malePressed:(id)sender {
    isMale = YES;
    _h1.alpha =0; _h2.alpha = 0;_h3.alpha = 0;_h4.alpha = 0;
    _h5.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        _blur.alpha = 1;
        _inputview.alpha = 1;

    }completion:^(BOOL s ){
        _genderView.alpha=0;
    }];
    [self initInput];

}
-(void)initInput{
    [_inputField becomeFirstResponder];
    [_header setText:@"Enter patient age"];
    _revert.alpha = 1;
    if (isMale == YES) {
        _inputField.placeholder = @"His age in years?";
    }else{
        _inputField.placeholder = @"Her age in years?";}
    count = 1;
}
int count;
- (IBAction)TappedNext:(id)sender {
    if (count ==1) {
        //age
        if ([_inputField.text intValue] > 0 & [_inputField.text intValue] < 19 ) {
            [UIView animateWithDuration:0.2 animations:^{
                _inputview.transform = CGAffineTransformMakeScale(1.15, 1.15);
            }completion:^(BOOL s){
                [UIView animateWithDuration:0.2 animations:^{
                    _inputview.transform = CGAffineTransformMakeScale(1, 1);
                }];
            }];
            age = [_inputField.text intValue];
            [_header setText:@"Enter patient height"];
            _inputField.text = @"";
            _inputField.placeholder = @"Height in m";
            count ++;
        }
        else{
            [self invalidInput];
        }
        
    }
    else if (count == 2){
        //height
        if ([_inputField.text floatValue] > 0.0f & [_inputField.text floatValue] < 2.1f ) {
            [UIView animateWithDuration:0.2 animations:^{
                _inputview.transform = CGAffineTransformMakeScale(1.15, 1.15);
            }completion:^(BOOL s){
                [UIView animateWithDuration:0.2 animations:^{
                    _inputview.transform = CGAffineTransformMakeScale(1, 1);
                }];
            }];
            height = [_inputField.text floatValue];
            [_header setText:@"Enter patient weight"];
            _inputField.text = @"";
            _inputField.placeholder = @"Weight in KG";
            count ++;
        }
        else{
            [self invalidInput];
        }
    }
    else if (count == 3){
        //weight
        if ([_inputField.text floatValue] > 0 & [_inputField.text floatValue] < 120.0f) {
            [UIView animateWithDuration:0.2 animations:^{
                _inputview.transform = CGAffineTransformMakeScale(1.15, 1.15);
            }completion:^(BOOL s){
                [UIView animateWithDuration:0.2 animations:^{
                    _inputview.transform = CGAffineTransformMakeScale(1, 1);
                } completion:^(BOOL s){
                    [UIView animateWithDuration:0.3  delay:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                        _animView.alpha = 0;
                        _buttonPadding.translatesAutoresizingMaskIntoConstraints = YES;
                        _animView.translatesAutoresizingMaskIntoConstraints = YES;
                        [_buttonPadding setBackgroundColor:[UIColor whiteColor]];
                        _buttonPadding.frame = CGRectMake(0, 0, _inputview.frame.size.width, _inputview.frame.size.height);
                    }completion:^(BOOL s ){
                        _buttonPadding.layer.cornerRadius = 10;
                    }];
                }];
            }];
            [_animView addArrToTickAnimation];
            weight = [_inputField.text floatValue];
            [_header setText:@"Done!"];
            _revert.alpha = 0;
            _inputField.alpha = 0;
            [_animView addArrToTickAnimation];
            [_inputField endEditing:YES];
            count ++;
            }
        else{
            [self invalidInput];
        }
    }
}
-(void) invalidInput{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops" message:@"Please enter valid input" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"okay" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}
- (IBAction)revert:(id)sender {
    [self.navigationController performSegueWithIdentifier:@"calc" sender:nil];
}

@end
