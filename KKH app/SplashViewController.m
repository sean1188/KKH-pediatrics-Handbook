//
//  SplashViewController.m
//  KKH app
//
//  Created by Sean Lim on 24/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "SplashViewController.h"
#import "MBProgressHUD.h"
#include "MBProgressHUD.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

-(UIStatusBarStyle) preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //set bg color
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"] == TRUE ) {
        [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    }
    //VER 1.45 clear
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"VER145"] != YES) {
        [[NSUserDefaults standardUserDefaults] setPersistentDomain:[NSDictionary dictionary] forName:[[NSBundle mainBundle] bundleIdentifier]];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"VER145"];
    }
    //
    [UIView animateWithDuration:0.4 delay:0.8 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _bearImg.transform = CGAffineTransformMakeScale(0.7, 0.7);
        _inc.alpha = 0;
    }completion:^(BOOL s){
           [UIView animateWithDuration:0.2 animations:^{
            _bearImg.transform = CGAffineTransformMakeScale(9, 9);
            _bearImg.alpha = 0;
            [self.view setBackgroundColor:[UIColor whiteColor]];
        }completion:^(BOOL s){
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"splashed"];
            [self performSegueWithIdentifier:@"main" sender:self];
        }];
        
        
    }];
}


@end
