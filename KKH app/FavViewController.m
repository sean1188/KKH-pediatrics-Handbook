//
//  FavViewController.m
//  KKH app
//
//  Created by Sean Lim on 13/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "FavViewController.h"
#import "KKH_app-Swift.h"


@interface FavViewController ()

@end

@implementation FavViewController
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (BOOL)shouldAutorotate {
    return NO;
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


-(void) viewDidLoad{
    [super viewDidLoad];
    
}
#pragma mark -
- (IBAction)settings:(id)sender {
    [self.navigationController performSegueWithIdentifier:@"settings" sender:nil];
}

- (IBAction)calc:(id)sender {
    [self.navigationController performSegueWithIdentifier:@"calc" sender:nil];
}

- (IBAction)ref:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
}
@end
