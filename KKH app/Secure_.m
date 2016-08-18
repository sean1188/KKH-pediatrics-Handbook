//
//  Secure_.m
//  KKH app
//
//  Created by Sean Lim on 3/7/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "Secure_.h"

@interface Secure_ ()

@end

@implementation Secure_
-(UIStatusBarStyle) preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]];
    
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
