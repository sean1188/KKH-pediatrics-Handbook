//
//  SettingsViewController.m
//  KKH app
//
//  Created by Sean Lim on 17/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
-(UIStatusBarStyle)preferredStatusBarStyle{
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
    [UIView animateWithDuration:0.3 animations:^{
        _settingsLogo.transform = CGAffineTransformMakeRotation(M_PI);
        _topSettingslogo.transform = CGAffineTransformMakeRotation(M_PI);
    }];
    
    _primaryColorIndicator.layer.cornerRadius = _primaryColorIndicator.frame.size.width/2;
    _primaryColorIndicator.layer.shadowOpacity = 0.4; _primaryColorIndicator.layer.shadowOffset = CGSizeMake(1, -2);
    _SecondaryColorIndicator.layer.cornerRadius = _SecondaryColorIndicator.frame.size.width /2 ;
    _color1Primary.layer.cornerRadius = _color1Primary.frame.size.width/2;
    _color1Primary.layer.shadowOpacity = 0.4; _color1Primary.layer.shadowOffset = CGSizeMake(1, -2);
    _color2Primary.layer.cornerRadius = _color2Primary.frame.size.width/2;
    _color2Primary.layer.shadowOpacity = 0.4; _color2Primary.layer.shadowOffset = CGSizeMake(1, -2);
    _color3Primary.layer.cornerRadius = _color3Primary.frame.size.width/2;
    _color3Primary.layer.shadowOpacity = 0.4; _color3Primary.layer.shadowOffset = CGSizeMake(1, -2);
    _color1Secondary.layer.cornerRadius = _color1Secondary.frame.size.width/2;
    _color2Secondary.layer.cornerRadius = _color2Secondary.frame.size.width/2;
    _Color3Seconday.layer.cornerRadius = _Color3Seconday.frame.size.width/2;
    [self initColor];
    _colorSelectPadding.layer.cornerRadius = 15.0f;
    _colorSelectPadding.layer.shadowOpacity = 0.4; _colorSelectPadding.layer.shadowOffset = CGSizeMake(1, -2);

    _blurView.alpha = 0; _color1Primary.alpha = 0; _color2Primary.alpha =0; _color3Primary.alpha = 0;
    
}

-(void) initColor{
    [_primaryColorIndicator setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    [_SecondaryColorIndicator setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    [_color1Primary setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor1"]]];
    [_color1Secondary  setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor1"]]];
    [_color2Primary setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor2"]]];
    [_color2Secondary setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor2"]]];
    [_color3Primary setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor3"]]];
    [_Color3Seconday   setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor3"]]];
}
- (IBAction)didTapColor:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _blurView.alpha =1;_color1Primary.alpha = 1; _color2Primary.alpha =1; _color3Primary.alpha = 1;
    }];
}
- (IBAction)blurTap:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        _blurView.alpha = 0; _color1Primary.alpha = 0; _color2Primary.alpha =0; _color3Primary.alpha = 0;
        
    }];
}
- (IBAction)color1Tapped:(id)sender {
    //replace color 1
    NSData *color1Primary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_primaryColorIndicator.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:color1Primary forKey:@"primaryColor1"];
    NSData *color1Secondary = [NSKeyedArchiver archivedDataWithRootObject:[UIColor colorWithCGColor:_SecondaryColorIndicator.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:color1Secondary forKey:@"secondaryColor1"];
    //set selected colors
    NSData *swapPrimary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_color1Primary.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:swapPrimary forKey:@"primaryColor"];
    NSData *swapSecondary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_color1Secondary.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:swapSecondary forKey:@"secondaryColor"];
    
    [self setcolors];[UIView animateWithDuration:0.2 animations:^{
        _blurView.alpha = 0; _color1Primary.alpha = 0; _color2Primary.alpha =0; _color3Primary.alpha = 0;
        
    }];[self initColor];
}
- (IBAction)color2Tapped:(id)sender {
    //replace color 2
    NSData *color2Primary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_primaryColorIndicator.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:color2Primary forKey:@"primaryColor2"];
    NSData *color2Secondary = [NSKeyedArchiver archivedDataWithRootObject:[UIColor colorWithCGColor:_SecondaryColorIndicator.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:color2Secondary forKey:@"secondaryColor2"];
    //set selected colors
    NSData *swapPrimary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_color2Primary.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:swapPrimary forKey:@"primaryColor"];
    NSData *swapSecondary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_color2Secondary.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:swapSecondary forKey:@"secondaryColor"];
    
    [self setcolors];[UIView animateWithDuration:0.2 animations:^{
        _blurView.alpha = 0; _color1Primary.alpha = 0; _color2Primary.alpha =0; _color3Primary.alpha = 0;
        
    }];[self initColor];

}
- (IBAction)color3Tapped:(id)sender {
    //replace color 1
    NSData *color3Primary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_primaryColorIndicator.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:color3Primary forKey:@"primaryColor3"];
    NSData *color3Secondary = [NSKeyedArchiver archivedDataWithRootObject:[UIColor colorWithCGColor:_SecondaryColorIndicator.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:color3Secondary forKey:@"secondaryColor3"];
    //set selected colors
    NSData *swapPrimary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_color3Primary.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:swapPrimary forKey:@"primaryColor"];
    NSData *swapSecondary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_Color3Seconday.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:swapSecondary forKey:@"secondaryColor"];
    
    [self setcolors];[UIView animateWithDuration:0.2 animations:^{
        _blurView.alpha = 0; _color1Primary.alpha = 0; _color2Primary.alpha =0; _color3Primary.alpha = 0;
        
    }];[self initColor];

}

#pragma  mark - bottom bar
- (IBAction)ref:(id)sender {
    [self.navigationController performSegueWithIdentifier:@"ref" sender:nil];
}

- (IBAction)calc:(id)sender {
    [self.navigationController performSegueWithIdentifier:@"calc" sender:nil];
}

- (IBAction)fav:(id)sender {
    [self.navigationController performSegueWithIdentifier:@"list" sender:nil];
}

- (IBAction)settings:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _settingsLogo.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}
@end
