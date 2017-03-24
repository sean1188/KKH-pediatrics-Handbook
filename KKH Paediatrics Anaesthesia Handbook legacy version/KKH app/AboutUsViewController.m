//
//  AboutUsViewController.m
//  KKH app
//
//  Created by Sean Lim on 25/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "AboutUsViewController.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface AboutUsViewController ()


@end

@implementation AboutUsViewController
-(BOOL) prefersStatusBarHidden{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_topview setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"secondaryColor"]]];
}

- (IBAction)doneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
