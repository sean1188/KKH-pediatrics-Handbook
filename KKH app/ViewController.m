//
//  ViewController.m
//  KKH app
//
//  Created by Sean Lim on 3/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "KKH_app-Swift.h"

@interface ViewController ()

@end

@implementation ViewController
NSTimer *scrollTimer; NSMutableArray *results; NSMutableArray *objectsArray;
-(UIStatusBarStyle) preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
#pragma  mark-
-(void) setcolors{
    for (UIView *view in _secondaryViews) {
        [view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    }
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
    for (UIView *views in _primaryViews) {
        [views setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"launchCal"] == TRUE) {
        [self.navigationController performSegueWithIdentifier:@"calc" sender:nil];
        [[NSUserDefaults standardUserDefaults]setBool:FALSE forKey:@"launchCal"];
    }
    else if ([[NSUserDefaults standardUserDefaults] boolForKey:@"launchFav"] == TRUE){
        [self.navigationController performSegueWithIdentifier:@"list" sender:nil];
        [[NSUserDefaults standardUserDefaults]setBool:FALSE forKey:@"launchFav"];

    }
    
    _serach.delegate = self;
    _cardView.layer.cornerRadius = 15.0f;
    _blurView.alpha = 1;
    _cardView.layer.shadowOpacity = 0.5;
    _cardView.layer.shadowOffset = CGSizeMake(0, - 2);
    objectsArray = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
    //Master Color switch
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"] != TRUE) {
        [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"firstLaunch"];
        NSData *defcolorPrimary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:self.view.backgroundColor.CGColor ]];
        [[NSUserDefaults standardUserDefaults] setObject:defcolorPrimary forKey:@"primaryColor"];
        NSData *defcolorSecondary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithRed:0.2314 green:0.4588 blue:0.7373 alpha:1.0]];
        [[NSUserDefaults standardUserDefaults] setObject:defcolorSecondary forKey:@"secondaryColor"];
        
        NSData *color1Primary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithRed:0.1882 green:0.1882 blue:0.1882 alpha:1.0]];
        [[NSUserDefaults standardUserDefaults] setObject:color1Primary forKey:@"primaryColor1"];
        NSData *color1Secondary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithRed:0.2588 green:0.2588 blue:0.2588 alpha:1.0]];
        [[NSUserDefaults standardUserDefaults] setObject:color1Secondary forKey:@"secondaryColor1"];
        
        NSData *color2Primary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithRed:0.8948 green:0.1441 blue:0.4038 alpha:1.0]];
        [[NSUserDefaults standardUserDefaults] setObject:color2Primary forKey:@"primaryColor2"];
        NSData *color2Secondary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithRed:0.9843 green:0.3922 blue:0.6353 alpha:1.0]];
        [[NSUserDefaults standardUserDefaults] setObject:color2Secondary forKey:@"secondaryColor2"];
        
        NSData *color3Primary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithRed:0.0 green:0.4706 blue:0.4157 alpha:1.0]];
        [[NSUserDefaults standardUserDefaults] setObject:color3Primary forKey:@"primaryColor3"];
        NSData *color3Secondary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithRed:0.0 green:0.5843 blue:0.5294 alpha:1.0]];
        [[NSUserDefaults standardUserDefaults] setObject:color3Secondary forKey:@"secondaryColor3"];
        
        
    }
    [self setcolors];
    for (int i = 0; i < [[[PDFManager alloc] init] numberOfChapters] ;  i++ ) {
        [objectsArray addObject:[NSString stringWithFormat:@"%@",[[[PDFManager alloc]init] titleForChapter:i] ]];
        NSLog(@"%@", objectsArray);
    }
    //
    _tableView.dataSource = self;
    _tableView.delegate = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == [[self searchDisplayController] searchResultsTableView])
    {
        return results.count;
    }
    else{
    return [[[PDFManager alloc] init] numberOfChapters];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure cell
    [cell setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"secondaryColor"]]];
    cell.textColor = [UIColor whiteColor];
    
    if (!tableView) {
        //search viewing
        cell.accessoryType = UITableViewCellAccessoryNone;
    }else{
        //normal viewing
    //liked or not
        if([[NSUserDefaults standardUserDefaults] boolForKey:[[[PDFManager alloc] init] titleForChapter:indexPath.row]] == TRUE){
            UIButton *accessoryButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            [accessoryButton setImage:[UIImage imageNamed:@"ic_favorite_white"] forState: UIControlStateNormal];
            [cell setAccessoryView:accessoryButton];
        }
        else{
            UIButton *accessoryButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            [cell setAccessoryView:accessoryButton];
        }
   
    }
    if (tableView  == self.tableView){
        //normal viewing
        cell.textLabel.text = [[[PDFManager alloc] init] titleForChapter:indexPath.row];
        }
    else{
        //search
        cell.textLabel.text = [results objectAtIndex:indexPath.row];
    }

    //
    return cell;
    
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    NSLog(@"%li", (long)indexPath.row);
    if(tableView == self.tableView){
        _tableView.alpha = 0;
        _sarchSegue.alpha = 0;
        _h1.alpha = 0; _h2.alpha = 0; _h3.alpha = 0;
    [[NSUserDefaults standardUserDefaults] setInteger:indexPath.row +1 forKey:@"viewChpter"];
        [UIView transitionWithView:_cardView duration:0.4 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{} completion:^(BOOL s){
            [UIView animateWithDuration:0.2 animations:^{
                _cardView.frame = self.view.frame;
            } completion:^(BOOL s ){
                _cardView.layer.cornerRadius = 0;
                [self.navigationController performSegueWithIdentifier:@"webView" sender:nil];
            }];
        }];
    }
    else{
        NSUInteger index = [objectsArray indexOfObject:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
        NSLog(@"searched index is %li", index);
        [[NSUserDefaults standardUserDefaults] setInteger:index +1 forKey:@"viewChpter"];
        [self.navigationController performSegueWithIdentifier:@"webView" sender:nil];

    }

}


-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    results = nil;
    NSPredicate *pedicate = [NSPredicate predicateWithFormat:@"SELF contains [search] %@", searchText];
    results = [[objectsArray filteredArrayUsingPredicate:pedicate] mutableCopy];
}


#pragma  mark -
- (IBAction)refButton:(id)sender {
    [UIView animateWithDuration:0.6  animations:^{
        _infoIcon.transform = CGAffineTransformMakeScale(1.4, 1.4);
        _infoIcon.transform = CGAffineTransformMakeRotation(45.0f);
    }completion:^(BOOL s) {
        [UIView animateWithDuration:0.4  animations:^{
            _infoIcon.transform = CGAffineTransformMakeRotation(-90.0f);
            _infoIcon.transform = CGAffineTransformMakeScale(1.2, 1.2);
        } completion:^(BOOL s) {
            [UIView animateWithDuration:0.3 animations:^{
                _infoIcon.transform = CGAffineTransformMakeRotation(90.0f);
                _infoIcon.transform = CGAffineTransformMakeScale(1, 1);
            }];
            
            
        }];
    }];
}

- (IBAction)calcButton:(id)sender {
    [scrollTimer invalidate];
    [self.navigationController performSegueWithIdentifier:@"calc" sender:self];
}

- (IBAction)listButton:(id)sender {
    [scrollTimer invalidate];
    [self.navigationController performSegueWithIdentifier:@"list" sender:self];
}

- (IBAction)settingsButton:(id)sender {
    [scrollTimer invalidate];
    [self.navigationController performSegueWithIdentifier:@"settings" sender:self];

}

- (IBAction)searchTrigger:(id)sender {
    heightInit = _cardView.frame.size.height;
    [UIView animateWithDuration:0.2 animations:^{
        _cardView.frame = _cardViewSearchSub.frame;
        _blurView.alpha = 0;
        _cardView.translatesAutoresizingMaskIntoConstraints = YES;
    } completion:^(BOOL s ){
        [self.serach becomeFirstResponder];
    }];
}
int heightInit;
-(void) searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    NSLog(searchBar.text);
    if ([searchBar.text isEqualToString:@""]) {
        [UIView animateWithDuration:0.2 animations:^{
            _cardView.frame = CGRectMake(_cardView.frame.origin.x, _serach.frame.origin.y + 3, _cardView.frame.size.width, heightInit);
            _blurView.alpha = 1;
            _cardView.translatesAutoresizingMaskIntoConstraints = YES;
        }];
    }
    else{
        
    }
    
}
@end
