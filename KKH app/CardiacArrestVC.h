//
//  CardiacArrestVC.h
//  KKH app
//
//  Created by Sean Lim on 27/11/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "ViewController.h"

@interface CardiacArrestVC : ViewController
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *primaryVCA;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *SECONDARYvca;

@property (strong, nonatomic) IBOutlet UIButton *step1Button;
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;

- (IBAction)NshockRhy:(id)sender;
- (IBAction)ShockRhy:(id)sender;


- (IBAction)back:(id)sender;
@end
