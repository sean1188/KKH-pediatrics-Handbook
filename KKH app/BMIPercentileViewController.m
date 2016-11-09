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
int state, age_;
float h, w;
-(UIStatusBarStyle ) preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _genderSegment.alpha = 0; _resH.alpha = 0;
    //init color
    primarycolor =[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]; secondaryColor = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]];
    [self.view setBackgroundColor:primarycolor];
    //
    //
    state = 0;
    _textField.delegate = self;
    _bmiManager = [BMIGraphManager alloc];
    [_header setText:@"Enter Height"];
    [_textField setBackgroundColor:secondaryColor];
    [_textField setPlaceholder:@"cm"];
    
    
}

CGRect initHead;
CGRect initButton;
- (void)textFieldDidBeginEditing:(UITextField *)textField{
        _header.translatesAutoresizingMaskIntoConstraints = YES; _textField.translatesAutoresizingMaskIntoConstraints = YES; _doneB.translatesAutoresizingMaskIntoConstraints = YES;
    [UIView animateWithDuration:0.3 animations:^{
        initHead = _header.frame;
        initButton = _doneB.frame;
        _textField.frame = CGRectMake(_textField.frame.origin.x, _textField.frame.origin.y - 50, _textField.frame.size.width, textField.frame.size.height);
        _header.transform = CGAffineTransformMakeScale(1.4, 1.4);
        _header.frame = CGRectMake(_header.frame.origin.x, _textField.frame.origin.y -_textField.frame.size.height, _header.frame.size.width, _header.frame.size.height);
        _doneB.frame = CGRectMake(_doneB.frame.origin.x, _textField.frame.origin.y + _textField.frame.size.height + 20, _doneB.frame.size.width, _doneB.frame.size.height);
    }];
}
-(void)textFieldDidEndEditing:(UITextField*)textField{
     _header.translatesAutoresizingMaskIntoConstraints = NO; _textField.translatesAutoresizingMaskIntoConstraints = NO; _doneB.translatesAutoresizingMaskIntoConstraints = NO;
    [UIView animateWithDuration:0.3 animations:^{
        _header.frame = initHead;
        _doneB.frame = initButton;
        _header.transform = CGAffineTransformMakeScale(1, 1);
        _header.adjustsFontSizeToFitWidth = YES;
        _textField.frame = CGRectMake(_textField.frame.origin.x, _textField.frame.origin.y + 50, _textField.frame.size.width, textField.frame.size.height);
    }];
}

- (IBAction)didTap:(id)sender {
    [self.view endEditing:YES];

}


- (IBAction)done:(id)sender {
    if (state == 0){
        //init height
        if (_textField.text.intValue > 250) {
            [self error:@"Please enter valid height."];
        }
        else{
            state = 1;
        h = _textField.text.floatValue;
        [_textField setText:@""];
        [_header setText:@"Enter Weight"];
        _header.adjustsFontSizeToFitWidth = YES;
            [_textField setPlaceholder:@"kg"];
        }
        
    }
    else if (state == 1){
        if (_textField.text.intValue > 150) {
            [self error:@"Please enter valid weight."];
        }
        else{
        //init weight
        state = 2;
        w = _textField.text.floatValue;
        [_textField setText:@""];
        [_header setText:@"Enter Age"];
        _header.adjustsFontSizeToFitWidth = YES;
        [_textField setPlaceholder:@"Years"];
        }
    }
    else if (state == 2){
        if (_textField.text.intValue > 18) {
            [self error:@"Please enter valid age below 18."];

        }
        else{
            state = 3;
            //init age
            age_ = _textField.text.intValue;
            NSLog(@"%@", [NSString stringWithFormat:@"%i", age_]);
            //initwith Gender
            [self.view endEditing:YES];
            [_header setText:@"Select Gender"];
            [UIView animateWithDuration:0.3 animations:^{
                _textField.alpha = 0;
                _genderSegment.alpha = 1;
            } completion:^(BOOL s){
            }];
        }

        
    }
    else if (state == 3 ){
        //send result
        state = 4;
        bool isPMale;
        if (_genderSegment.selectedSegmentIndex == 0) {
            isPMale = YES;
        }
        else if (_genderSegment.selectedSegmentIndex == 1  ){
            isPMale = NO;
        }
        float bmi = w / ((h/100)*(h/100));
        NSLog(@"%@", [NSString stringWithFormat:@"%0.2f", bmi]);
        [UIView animateWithDuration:0.3  animations:^{
            _resH.alpha = 1; _genderSegment.alpha = 0;
            [_bmiLabel setText:[NSString stringWithFormat:@"%0.2f", bmi]];
        }];
        if( [[_bmiManager initWithAge:age_ bmi:bmi isMale:isPMale ] range] == 1){
            NSLog(@"Severely Underweight!");
            [_res setText:@"Severely Underweight"];
        }
        else if ([[_bmiManager initWithAge:age_ bmi:bmi isMale:isPMale ] range] == 2){
            NSLog(@"Underweight");
            [_res setText:@"Underweight"];

        }
        else if ([[_bmiManager initWithAge:age_ bmi:bmi isMale:isPMale ] range] == 3){
            NSLog(@"Acceptable");
            [_res setText:@"Acceptable"];

        }
        else if ([[_bmiManager initWithAge:age_ bmi:bmi isMale:isPMale ] range] == 4){
            NSLog(@"Overweight");
            [_res setText:@"Overweight"];

        }
        else if ([[_bmiManager initWithAge:age_ bmi:bmi isMale:isPMale ] range] == 5){
            NSLog(@"Severely overweight!");
            [_res setText:@"Severely Overweight"];

        }
        else if ([[_bmiManager initWithAge:age_ bmi:bmi isMale:isPMale ] range] == 0){
            NSLog(@"Null error");

        }
    }
    else if (state == 4){
        [self dismissViewControllerAnimated:YES completion:nil];

    }
}

-(void)error:(NSString*)sentErr{
    UIAlertController *a = [UIAlertController alertControllerWithTitle:@"Error" message:sentErr preferredStyle:UIAlertControllerStyleAlert];
    [a addAction:[UIAlertAction actionWithTitle:@"okay" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:a animated:YES completion:nil];
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
