//
//  CardiacArrestVC.m
//  KKH app
//
//  Created by Sean Lim on 27/11/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "CardiacArrestVC.h"

@interface CardiacArrestVC ()

@end

@implementation CardiacArrestVC
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}
-(void) setcolor {
    for (UIView *view in _SECONDARYvca) {
        [view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    }
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
    for (UIView *views in _primaryVCA) {
        [views setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setcolor];
    _step1Button.layer.cornerRadius = 10.0f;
    _button1.layer.cornerRadius = 10.0f;
    _button2.layer.cornerRadius = 10;
}


- (IBAction)NshockRhy:(id)sender {
}

- (IBAction)ShockRhy:(id)sender {
}

- (IBAction)back:(id)sender {
}
@end
