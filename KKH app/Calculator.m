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
    _mainCardView.layer.cornerRadius = 15.0f;
}


#pragma mark - bottom bar
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


@end
