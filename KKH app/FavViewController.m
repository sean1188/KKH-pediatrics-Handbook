//
//  FavViewController.m
//  KKH app
//
//  Created by Sean Lim on 13/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "FavViewController.h"
#import "KKH_app-Swift.h"


@interface FavViewController ()

@end

@implementation FavViewController
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (BOOL)shouldAutorotate {
    return NO;
}
-(void) setcolors{
    for (UIView *view in _secondaryViews) {
        [view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    }
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
    for (UIView *views in _primaryViews) {
        [views setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    }
}
int likedChptrCount = 0;
NSMutableArray *likedObjs;

-(void) viewWillAppear:(BOOL)animated{
    [self viewDidLoad];
    _tableView.alpha = 1;
    _h1.alpha = 1;
    _h2.alpha = 1; _h3.alpha =1;
    [_tableView reloadData];
    _cardView.translatesAutoresizingMaskIntoConstraints = NO;
}
-(void) viewDidLoad{
    [super viewDidLoad];
    _cardView.layer.cornerRadius = 15.0f;
    _cardView.layer.shadowOpacity = 1.0;
    _cardView.layer.shadowOffset = CGSizeMake(1, 2);
    _cardView.frame = CGRectMake(_cardView.frame.origin.x, -_cardView.frame.size.height - 10 , _cardView.frame.size.width, _cardView.frame.size.height);
    [UIView animateWithDuration:0.4 animations:^{
        _cardView.frame = CGRectMake(_cardView.frame.origin.x, _cardView.frame.origin.y +_cardView.frame.size.height + 10 , _cardView.frame.size.width, _cardView.frame.size.height);
    }];
    [self setcolors];
    // Do any additional setup after loading the view.
    
    likedChptrCount = 0; likedObjs = [NSMutableArray array];
    for (int i = 0 ; i < [[[PDFManager alloc] init] numberOfChapters]; i ++) {
        if([[NSUserDefaults standardUserDefaults] boolForKey:[[[PDFManager alloc] init]titleForChapter:i]] == TRUE){
            likedChptrCount ++;
            [likedObjs addObject:[NSNumber numberWithInt:i]];
        }
    }
    NSLog(@"liked %i chpter",likedChptrCount);
    NSLog(@"%@", likedObjs);
    _tableView.delegate = self; _tableView.dataSource = self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return likedChptrCount;
}
-(NSInteger)tableView:(UITableView *)tableView
indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"test ");
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if ([indexPath section] == 0) {
            UILabel *index = [[UILabel alloc] initWithFrame:CGRectMake( 6, ((cell.frame.size.height/2) - ((cell.frame.size.height -5) /2 )), cell.frame.size.height -5, cell.frame.size.height -5)];
            index.text = [NSString stringWithFormat:@"%i", [[likedObjs objectAtIndex:indexPath.row] intValue] +1];
            index.font = [UIFont fontWithName:@"Cabin" size:23];index.layer.cornerRadius = 6;index.textAlignment = UITextAlignmentCenter;index.textColor = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]];index.backgroundColor = [UIColor whiteColor];index.layer.cornerRadius = 6;index.clipsToBounds = YES;index.tag = 1;
            [cell.contentView addSubview:index];
        }
    }
    // Configure cell
    [cell setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"secondaryColor"]]];
    cell.textColor = [UIColor whiteColor];
    cell.font = [UIFont fontWithName:@"CabinCondensed" size:23];
    cell.textLabel.text = [[[PDFManager alloc] init] titleForChapter:[[likedObjs objectAtIndex:indexPath.row] integerValue]];
    
    
    return cell;
}
- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    NSLog(@"%li", (long)indexPath.row);
        _tableView.alpha = 0;
    _h1.alpha = 0;
    _h2.alpha = 0; _h3.alpha =0;
        [[NSUserDefaults standardUserDefaults] setInteger:[[likedObjs objectAtIndex:indexPath.row] integerValue]+ 1 forKey:@"viewChpter"];
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"fromFavs"];
        [UIView transitionWithView:_cardView duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{} completion:^(BOOL s){
            [UIView animateWithDuration:0.3 animations:^{
                _cardView.frame = self.view.frame;
                _cardView.translatesAutoresizingMaskIntoConstraints = YES;
            } completion:^(BOOL s ){
                _cardView.layer.cornerRadius = 0;
                [self performSegueWithIdentifier:@"viewchpt" sender:nil];
            }];
        }];

    
}
- (IBAction)Fav:(id)sender {
    [UIView animateWithDuration:0.6  animations:^{
        _favIcon.transform = CGAffineTransformMakeScale(1.4, 1.4);
        _favIcon.transform = CGAffineTransformMakeRotation(45.0f);
    }completion:^(BOOL s) {
        [UIView animateWithDuration:0.4  animations:^{
            _favIcon.transform = CGAffineTransformMakeRotation(-90.0f);
            _favIcon.transform = CGAffineTransformMakeScale(1.2, 1.2);
        } completion:^(BOOL s) {
            [UIView animateWithDuration:0.3 animations:^{
                _favIcon.transform = CGAffineTransformMakeRotation(90.0f);
                _favIcon.transform = CGAffineTransformMakeScale(1, 1);
            }];
            
            
        }];
    }];
}

- (IBAction)settings:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _cardView.frame = CGRectMake(_cardView.frame.origin.x, - _cardView.frame.size.height - 10, _cardView.frame.size.width, _cardView.frame.size.height);
    } completion:^(BOOL S){
            [self.navigationController performSegueWithIdentifier:@"settings" sender:nil];

    }];
}

- (IBAction)calc:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _cardView.frame = CGRectMake(_cardView.frame.origin.x, - _cardView.frame.size.height - 10, _cardView.frame.size.width, _cardView.frame.size.height);
    } completion:^(BOOL S){
        [self.navigationController performSegueWithIdentifier:@"calc" sender:nil];

    }];
}

- (IBAction)ref:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _cardView.frame = CGRectMake(_cardView.frame.origin.x, - _cardView.frame.size.height - 10, _cardView.frame.size.width, _cardView.frame.size.height);
    } completion:^(BOOL S){
        [self.navigationController performSegueWithIdentifier:@"ref" sender:nil];

    }];
}
@end
