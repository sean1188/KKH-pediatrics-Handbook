//
//  TutorialViewController.h
//  KKH app
//
//  Created by Sean Lim on 1/8/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imgView;

- (IBAction)next:(id)sender;
- (IBAction)back:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *guideLabel;
@property (strong, nonatomic) IBOutlet UIButton *doneButton;
- (IBAction)done:(id)sender;

@end
