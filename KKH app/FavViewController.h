//
//  FavViewController.h
//  KKH app
//
//  Created by Sean Lim on 13/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *secondaryViews;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *primaryViews;



//Bottom bar
@property (strong, nonatomic) IBOutlet UIImageView *favIcon;
- (IBAction)Fav:(id)sender;
- (IBAction)settings:(id)sender;
- (IBAction)calc:(id)sender;
- (IBAction)ref:(id)sender;

@end
