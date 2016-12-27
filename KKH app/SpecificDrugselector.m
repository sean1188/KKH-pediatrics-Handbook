//
//  SpecificDrugselector.m
//  KKH app
//
//  Created by Guest User on 5/12/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "SpecificDrugselector.h"
#import "KKH_app-Swift.h"


@interface SpecificDrugselector ()
@property (strong, nonatomic) DrugCalculationsManager *anaesthesiaManager;
@property (strong, nonatomic) CardiacDrugCalculationsManager *Cardiacdrugmannager;
@end

@implementation SpecificDrugselector

int keycount;
-(UIStatusBarStyle) preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(void) setcolors{
    for (UIView *view in _sec) {
        [view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    }
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
    for (UIView *views in _pri) {
        [views setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    }
}
NSDictionary *druglistD;
int weight;
- (void)viewDidLoad {
    [super viewDidLoad];
    _resView.alpha = 0;
    _Drugpicker.delegate = self;
    datalayer = 0;
    weight = [[[NSUserDefaults standardUserDefaults] objectForKey:@"DCweight"] intValue];
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"drugListType"] == 0) {
        _anaesthesiaManager = [DrugCalculationsManager alloc];
        druglistD = [[_anaesthesiaManager initWithWeight:weight] getDrugList];
    }
    else if ([[NSUserDefaults standardUserDefaults] integerForKey:@"drugListType"] == 1){
        _Cardiacdrugmannager = [CardiacDrugCalculationsManager alloc];
        druglistD = [[_Cardiacdrugmannager initWithWeight:weight] getDrugList];
    }
    mainkeys = [druglistD allKeys];
    dispArray = mainkeys;
}

#pragma  mark-
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [dispArray count];
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[NSAttributedString alloc] initWithString:[dispArray objectAtIndex:row] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}
#pragma  mark -


- (IBAction)backb:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
NSArray * mainkeys;
NSDictionary * routes;
NSArray * data;
NSArray * dispArray;
int datalayer;
- (IBAction)nextB:(id)sender {

    if (datalayer == 0 ) {
        routes = [druglistD objectForKey:[mainkeys objectAtIndex:[_Drugpicker  selectedRowInComponent:0]]];
        NSLog(@"%li", [_Drugpicker selectedRowInComponent:0]);
        NSLog(@"%@", routes);
        if (routes.count == 1) {
            //straight to info
            NSLog(@"only one route, proceed to tertiary data display");
            [UIView animateWithDuration:0.3 animations:^{_nextB.alpha = 0; _Drugpicker.alpha = 0; _resView.alpha = 1;}];
            [_header1 setText:[NSString stringWithFormat:@"%@",[[routes allKeys] objectAtIndex:0]]];
            [_resView setText:[[[NSString stringWithFormat:@"%@",[routes allValues]] substringFromIndex:11] substringToIndex:[[[NSString stringWithFormat:@"%@", [routes allValues]] substringFromIndex:11] length]-3]];
        }
        else{
            dispArray = [routes allKeys];
            [_Drugpicker reloadAllComponents];
            datalayer = 2;
        }
    }
    else{
        //datalayer 2
        [UIView animateWithDuration:0.3 animations:^{_nextB.alpha = 0; _Drugpicker.alpha = 0; _resView.alpha =1 ;}];
        [_header1 setText:[NSString stringWithFormat:@"%@",[[routes allKeys] objectAtIndex:[_Drugpicker selectedRowInComponent:0]]]];
        [_resView setText:[[[NSString stringWithFormat:@"%@",[routes valueForKey:[[routes allKeys] objectAtIndex:[_Drugpicker selectedRowInComponent:0]]]] substringFromIndex:3] substringToIndex:[[[NSString stringWithFormat:@"%@",[routes valueForKey:[[routes allKeys] objectAtIndex:[_Drugpicker selectedRowInComponent:0]]]] substringFromIndex:3] length] -3]];
    }
}
@end
