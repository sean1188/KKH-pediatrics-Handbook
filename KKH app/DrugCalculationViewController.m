//
//  DrugCalculationViewController.m
//  KKH app
//
//  Created by Sean Lim on 20/7/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "DrugCalculationViewController.h"

@interface DrugCalculationViewController ()

@end

@implementation DrugCalculationViewController
bool didNext;
-(UIStatusBarStyle )preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
-(void)viewWillAppear:(BOOL)animated{
    _resView.layer.cornerRadius = 15.0f;
    [_resView setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    _resView.frame = CGRectMake(_resView.frame.origin.x + _resView.frame.size.width + 10, _resView.frame.origin.y, _resView.frame.size.width, _resView.frame.size.height);
    _resView.translatesAutoresizingMaskIntoConstraints = YES;
    _textField.backgroundColor =[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _textField.delegate = self;
    didNext = NO;
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    
}

CGRect textFrame;
CGRect buttonFrame;
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    textFrame = textField.frame;
    buttonFrame = _nextB.frame;
    textField.translatesAutoresizingMaskIntoConstraints = YES;
    _nextB.translatesAutoresizingMaskIntoConstraints = YES;
    [UIView animateWithDuration: 0.3 animations:^{
        _textField.frame = CGRectMake(_textField.frame.origin.x, _textField.frame.origin.y - 80, _textField.frame.size.width, _textField.frame.size.height);
        _nextB.frame = CGRectMake(_nextB.frame.origin.x, _textField.frame.origin.y + 100, _nextB.frame.size.width, _nextB.frame.size.height);
    }];
}
#pragma mark - data processing
//variable to pass to backend
bool isMale;
int age;
float height;
float weight;

//

- (IBAction)next:(id)sender {
    if (didNext == NO) {
        didNext = YES;
        [UIView animateWithDuration:0.3 animations:^{
            _resView.frame =  CGRectMake(_resView.frame.origin.x - _resView.frame.size.width - 10, _resView.frame.origin.y, _resView.frame.size.width, _resView.frame.size.height);
            _resView.translatesAutoresizingMaskIntoConstraints = NO;
        }];
    }

}
@end
