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
@property (strong, nonatomic) IBOutlet UILabel *weightL;

@property (strong, nonatomic) IBOutlet UIButton *step1Button;
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;

- (IBAction)NshockRhy:(id)sender;
- (IBAction)ShockRhy:(id)sender;


@property (strong, nonatomic) IBOutlet UIView *proceedView;
@property (strong, nonatomic) IBOutlet UILabel *shockableTitle;
@property (strong, nonatomic) IBOutlet UITextView *instructText;

//checkList
@property (strong, nonatomic) IBOutlet UIView *checkListView;
@property (strong, nonatomic) IBOutlet UIButton *check1;
@property (strong, nonatomic) IBOutlet UIButton *check2;
@property (strong, nonatomic) IBOutlet UIButton *check3;
@property (strong, nonatomic) IBOutlet UIButton *check4;
@property (strong, nonatomic) IBOutlet UIButton *check5;
@property (strong, nonatomic) IBOutlet UIButton *check6;
- (IBAction)check1:(id)sender;
- (IBAction)check2:(id)sender;
- (IBAction)check3:(id)sender;
- (IBAction)check4:(id)sender;
- (IBAction)check5:(id)sender;
- (IBAction)check6:(id)sender;
- (IBAction)checkNext:(id)sender;




- (IBAction)back:(id)sender;
@end
