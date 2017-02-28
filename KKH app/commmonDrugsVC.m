//
//  commmonDrugsVC.m
//  KKH app
//
//  Created by Seannn! on 28/2/17.
//  Copyright © 2017 tangentinc. All rights reserved.
//

#import "commmonDrugsVC.h"
#import "KKH_app-Swift.h"

@interface commmonDrugsVC (){
    DrugCalculationsManager *manager;
}



@end

@implementation commmonDrugsVC

-(UIStatusBarStyle) preferredStatusBarStyle {
    return  UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",    [[[DrugCalculationsManager alloc] initWithWeight:69] getDrugList]
          );
    
}




@end
