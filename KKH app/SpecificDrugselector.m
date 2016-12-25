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
    weight = [[[NSUserDefaults standardUserDefaults] objectForKey:@"DCweight"] intValue];
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"drugListType"] == 0) {
        [self initAnaesthesia];
    }
    else if ([[NSUserDefaults standardUserDefaults] integerForKey:@"druglistType"] == 1){
        [self initCardiac];
    }
}
-(void) initAnaesthesia{
    druglistD = [[_anaesthesiaManager initWithWeight:weight] getDrugList];
}
-(void) initCardiac {
    druglistD = [[_Cardiacdrugmannager initWithWeight:weight] getDrugList];
}

- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[druglistD allKeys] count];
}
/*
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [druglistD key];
}
*/


@end
