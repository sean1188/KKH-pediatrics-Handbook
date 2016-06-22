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
        _genderView.translatesAutoresizingMaskIntoConstraints = YES;

        _genderView.frame = _inputview.frame;
    }completion:^(BOOL s){
        _genderView .alpha = 0;
        _inputview.alpha = 1;
    }];
    [self initInput];
}

- (IBAction)malePressed:(id)sender {
    isMale = YES;
    _h1.alpha =0; _h2.alpha = 0;_h3.alpha = 0;_h4.alpha = 0;
    _h5.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        _genderView.translatesAutoresizingMaskIntoConstraints = YES;
        _genderView.frame = _inputview.frame;
    }completion:^(BOOL s ){
        _genderView.alpha=0;
        _inputview.alpha = 1;

    }];
    [self initInput];

}
-(void)initInput{
    [_inputField becomeFirstResponder];
    [_header setText:@"Enter patient age"];
    if (isMale == YES) {
        _inputField.placeholder = @"How old is he?";
    }else{
        _inputField.placeholder = @"How old is she?";}
    count = 1;
}
int count;
- (IBAction)TappedNext:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        _inputview.transform = CGAffineTransformMakeScale(1.15, 1.15);
    }completion:^(BOOL s){
        [UIView animateWithDuration:0.2 animations:^{
            _inputview.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }];
    if (count ==1) {
        [_animView addArrToTickAnimation];
        age = [_inputField.text intValue];
        [_header setText:@"Enter patient height"];
    }
}
@end
