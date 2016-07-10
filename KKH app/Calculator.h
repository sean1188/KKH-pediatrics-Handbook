//
//  Calculator.h
//  KKH app
//
//  Created by Sean Lim on 7/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "animationScheme.h"
#import "KKH_app-Swift.h"
@interface Calculator : UIViewController
//
@property (strong, nonatomic) IBOutlet UIStackView *bottomStack;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *secondaryViews;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *primaryViews;
//

@property (strong, nonatomic) IBOutlet UIView *mainCardView;




//bottom bar
@property (strong, nonatomic) IBOutlet UIImageView *calclogo;
- (IBAction)refButton:(id)sender;
- (IBAction)listButton:(id)sender;
- (IBAction)settingsButton:(id)sender;




@end
