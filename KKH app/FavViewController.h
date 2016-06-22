//
//  FavViewController.h
//  KKH app
//
//  Created by Sean Lim on 13/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *h1;
@property (strong, nonatomic) IBOutlet UIView *cardView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *secondaryViews;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *primaryViews;
@property (strong, nonatomic) IBOutlet UILabel *h2;
@property (strong, nonatomic) IBOutlet UIImageView *h3;


//Bottom bar
@property (strong, nonatomic) IBOutlet UIImageView *favIcon;
- (IBAction)Fav:(id)sender;
- (IBAction)settings:(id)sender;
- (IBAction)calc:(id)sender;
- (IBAction)ref:(id)sender;

@end
