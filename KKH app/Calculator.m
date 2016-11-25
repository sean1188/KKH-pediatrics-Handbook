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
CGRect mainView;
UIView *firstBar, *secondBar, *thirdBar;
-(void) setcolors{
    for (UIView *view in _secondaryViews) {
        [view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    }
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
    for (UIView *views in _primaryViews) {
        [views setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    }
}
-(void) viewDidAppear:(BOOL)animated{
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
-(void) viewWillAppear:(BOOL)animated{
    [self viewDidLoad];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setcolors];
    _drugCALButton.layer.cornerRadius = 20.0f;
    _BMIButton.layer.cornerRadius = 20.0f;
    _drugCALButton.layer.shadowOpacity = 0.4;   _drugCALButton.layer.shadowOffset = CGSizeMake(1, 1); _BMIButton.layer.shadowOpacity = 0.4;   _BMIButton.layer.shadowOffset = CGSizeMake(1, 1);
    _blur.alpha = 0; _VIEW.alpha = 0; _send.alpha = 0;
    _mainCardView.layer.cornerRadius = 15.0f;

}

#pragma mark - bottom bar
- (IBAction)refButton:(id)sender {

        [self.navigationController popToRootViewControllerAnimated:NO];


}

- (IBAction)listButton:(id)sender {
 
        [self.navigationController performSegueWithIdentifier:@"list" sender:self];
    
    
}

- (IBAction)settingsButton:(id)sender {

        [self.navigationController performSegueWithIdentifier:@"settings" sender:nil];
    
    
}


- (IBAction)didTap1:(id)sender {

        [self performSegueWithIdentifier:@"DC" sender:self];


}

- (IBAction)didTap2:(id)sender {

        [self performSegueWithIdentifier:@"BMI" sender:self];

}

- (IBAction)didTap3:(id)sender {
    for (UILabel *labels in _labels) {
        labels.alpha = 0;
    }[UIView animateWithDuration:0.2 animations:^{
        firstBar.translatesAutoresizingMaskIntoConstraints =YES;
        firstBar.frame = _mainCardView.frame;
        secondBar.translatesAutoresizingMaskIntoConstraints = YES;
        thirdBar.translatesAutoresizingMaskIntoConstraints = YES;
        secondBar.frame = _mainCardView.frame;
        thirdBar.frame = _mainCardView.frame;
    }completion:^(BOOL s    ){
        _mainCardView.alpha = 1;
        
    }];
}
- (IBAction)view:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
       //  webView.frame = CGRectMake(0, 25, self.view.frame.size.width, self.view.frame.size.height - 100);
        _blur.alpha = 1;

    }];
   
}

- (IBAction)send:(id)sender {
    _mannager = [DrugCalculationsManager alloc];
   // [[_mannager initWithWeight:(int)weight] sendEmail:self];
}
- (IBAction)doneButtonViewer:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _blur.alpha = 0;
       //webView.frame =  CGRectMake((self.view.frame.size.width/2)-(self.mainCardView.frame.size.width /4 ),_mainCardView.frame.origin.y, _mainCardView.frame.size.width/2, _mainCardView.frame.size.height/2);
    }];
    
    
}

@end
