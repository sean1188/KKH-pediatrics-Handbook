//
//  ViewController.h
//  KKH app
//
//  Created by Sean Lim on 3/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>


@property (strong, nonatomic) IBOutlet UILabel *h1;
@property (strong, nonatomic) IBOutlet UIImageView *h2;
@property (strong, nonatomic) IBOutlet UILabel *h3;

@property (strong, nonatomic) IBOutlet UISearchBar *serach;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *cardView;
@property (strong, nonatomic) IBOutlet UIView *cardViewSearchSub;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *blurView;

@property (strong, nonatomic) IBOutlet UIButton *sarchSegue;
- (IBAction)searchTrigger:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *chapterTitle;



//Bottom bar
@property (strong, nonatomic) IBOutlet UIStackView *bottomBar;
@property (strong, nonatomic) IBOutlet UIImageView *infoIcon;
@property (strong, nonatomic) IBOutlet UIView *refview;

//button presses
- (IBAction)refButton:(id)sender;
- (IBAction)calcButton:(id)sender;
- (IBAction)listButton:(id)sender;
- (IBAction)settingsButton:(id)sender;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *secondaryViews;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *primaryViews;

@property (strong, nonatomic) IBOutlet UIView *animateIn;
- (IBAction)swipedDown:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *utilityView;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipedDown;

//disclaimer view
@property (strong, nonatomic) IBOutlet UIView *DView;
@property (strong, nonatomic) IBOutlet UITextView *Dview_text;
@property (strong, nonatomic) IBOutlet UIButton *dViewAgreeButton;
- (IBAction)dViewAgree:(id)sender;

@end

