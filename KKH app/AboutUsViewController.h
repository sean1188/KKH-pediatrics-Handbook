//
//  AboutUsViewController.h
//  KKH app
//
//  Created by Sean Lim on 25/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutUsViewController : UIViewController

- (IBAction)doneButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *topview;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *blurView;
@property (strong, nonatomic) IBOutlet UIImageView *backDrop;
@property (strong, nonatomic) IBOutlet UIView *cardView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *credView;
@property (strong, nonatomic) IBOutlet UILabel *thxView;

@end
