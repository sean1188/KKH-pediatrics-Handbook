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
bool didSendSearch; NSMutableArray *results; NSMutableArray *objectsArray;
-(UIStatusBarStyle) preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
#pragma  mark-
- (BOOL)shouldAutorotate {
    return NO;
}
-(void) viewDidAppear:(BOOL)animated{
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
-(void) setcolors{
    for (UIView *view in _secondaryViews) {
        [view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    }
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
    for (UIView *views in _primaryViews) {
        [views setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    }
}
-(void) viewWillAppear:(BOOL)animated{
    //
    //
    [self setcolors];
    likedChapterCount = 0; likedObjects = [NSMutableArray array];
    for (int i = 0 ; i < [[[PDFManager alloc] init] numberOfChapters]; i ++) {
        if([[NSUserDefaults standardUserDefaults] boolForKey:[[[PDFManager alloc] init]titleForChapter:i]] == TRUE){
            likedChapterCount ++;
            [likedObjects addObject:[NSNumber numberWithInt:i]];
        }
    }
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    _sarchSegue.alpha = 1;
    if ( didSendSearch == YES) {
        [_tableView reloadData];
        [_serach becomeFirstResponder];
    }
    else if (didSendSearch == NO){
    _tableView.alpha = 1;
    _h1.alpha = 1;
    _h2.alpha = 1;
    _h3.alpha = 1;
    _cardView.translatesAutoresizingMaskIntoConstraints = NO;
    [_tableView reloadData];
    }
}
int likedChapterCount = 0;
NSMutableArray *likedObjects;
NSMutableArray *chaptersCount;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchDisplayController.searchBar.delegate = self;
    results = nil;
    //
    ////init number of chapters
    chaptersCount = [[NSMutableArray alloc] init];
    for (int i = 0; i < [[[[PDFManager alloc] init] chapterPaths]count ]; i ++) {
        NSString *chapChar = [[[[PDFManager alloc] init]chapterPaths] objectAtIndex:i];
        if (![chaptersCount containsObject:[chapChar substringToIndex:1]]) {
            [chaptersCount addObject:[chapChar substringToIndex:1]];
        }
    }
   

    //
    _chapterTitle.alpha = 0;
    didsearch = NO;
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"splashed"] == YES) {
        _animateIn.alpha = 1;
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"splashed"];
        [UIView animateWithDuration:0.4 animations:^{
            _animateIn.alpha = 0;
        }];
        if ([[NSUserDefaults standardUserDefaults] integerForKey:@"startUp"] == 1) {
            [self.navigationController performSegueWithIdentifier:@"calc" sender:nil];
        }
        else if ([[NSUserDefaults standardUserDefaults] integerForKey:@"startUp"] == 2){
            [self.navigationController performSegueWithIdentifier:@"list" sender:nil];

        }
    }
    else{
        _animateIn.alpha = 0;
    }
    _serach.translatesAutoresizingMaskIntoConstraints = YES;
    _serach.frame = CGRectMake(0, -self.serach.frame.size.height,self.view.frame.size.width, _serach.frame.size.height);
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"launchCal"] == TRUE) {
        [self.navigationController performSegueWithIdentifier:@"calc" sender:nil];
        [[NSUserDefaults standardUserDefaults]setBool:FALSE forKey:@"launchCal"];
    }
    else if ([[NSUserDefaults standardUserDefaults] boolForKey:@"launchFav"] == TRUE){
        [self.navigationController performSegueWithIdentifier:@"list" sender:nil];
        [[NSUserDefaults standardUserDefaults]setBool:FALSE forKey:@"launchFav"];

    }
    _sarchSegue.layer.cornerRadius = 10.0f;
   // _sarchSegue.layer.shadowOpacity = 0.3; _sarchSegue.layer.shadowOffset = CGSizeMake(0, 3);
    _sarchSegue.backgroundColor = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]];
    _serach.delegate = self;
    _cardView.layer.cornerRadius = 15.0f;
    _blurView.alpha = 1;
    _cardView.layer.shadowOpacity = 0.5;
    _cardView.layer.shadowOffset = CGSizeMake(0, - 2);
    objectsArray = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
#pragma  mark - first launch
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"] != TRUE) {
        NSData *defcolorPrimary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithRed:0.1373 green:0.4431 blue:0.7373 alpha:1.0]];
        [[NSUserDefaults standardUserDefaults] setObject:defcolorPrimary forKey:@"primaryColor"];
        NSData *defcolorSecondary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithRed:0.1569 green:0.5176 blue:0.7961 alpha:1.0]];
        [[NSUserDefaults standardUserDefaults] setObject:defcolorSecondary forKey:@"secondaryColor" ];
        
        NSData *color1Primary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithRed:0.9294 green:0.4706 blue:0.0667 alpha:1.0]];
        [[NSUserDefaults standardUserDefaults] setObject:color1Primary forKey:@"primaryColor1"];
        NSData *color1Secondary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithRed:0.9412 green:0.5176 blue:0.0824 alpha:1.0]];
        [[NSUserDefaults standardUserDefaults] setObject:color1Secondary forKey:@"secondaryColor1"];
        
        NSData *color2Primary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithRed:0.5569 green:0.5569 blue:0.5569 alpha:1.0]];
        [[NSUserDefaults standardUserDefaults] setObject:color2Primary forKey:@"primaryColor2"];
        NSData *color2Secondary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithRed:0.6902 green:0.6902 blue:0.6863 alpha:1.0]];
        [[NSUserDefaults standardUserDefaults] setObject:color2Secondary forKey:@"secondaryColor2"];
        
        NSData *color3Primary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithRed:0.3412 green:0.6824 blue:0.3451 alpha:1.0]];
        [[NSUserDefaults standardUserDefaults] setObject:color3Primary forKey:@"primaryColor3"];
        NSData *color3Secondary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithRed:0.451 green:0.7255 blue:0.4431 alpha:1.0]];
        [[NSUserDefaults standardUserDefaults] setObject:color3Secondary forKey:@"secondaryColor3"];
            [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"6969"] forKey:@"secure"];
        
        //
            [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"startUp"];
        _bottomBar.userInteractionEnabled = NO;
        _cardView.alpha = 0;
        _swipedDown.enabled = NO;
        //disclaimer
        [self.view addSubview:_DView];
        self.DView.backgroundColor = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]];
        self.DView.layer.cornerRadius = 10.0f;
        self.DView.frame =CGRectMake((self.view.frame.size.width /2) -(self.DView.frame.size.width/2), (self.view.frame.size.height/2)-(self.DView.frame.size.height/2 ), _DView.frame.size.width, _DView.frame.size.height);
        
    }
    [self setcolors];
    for (int i = 0; i < [[[PDFManager alloc] init] numberOfChapters] ;  i++ ) {
        [objectsArray addObject:[NSString stringWithFormat:@"%@",[[[PDFManager alloc]init] titleForChapter:i] ]];
    }
    //

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (didsearch == YES) {
        return 1;
    }else{
        return [chaptersCount count] + 1;}
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(didsearch == YES)
    {
        return results.count;
    }
    else if (section == 0){
        return [likedObjects count];
    }
    else{
    
        int c = 0;
        for (int i = 0; i < [[[PDFManager alloc] init] numberOfChapters]; i ++) {
            if ([[[[[[PDFManager alloc] init] chapterPaths] objectAtIndex:i] substringToIndex:1] isEqualToString:[chaptersCount objectAtIndex:section - 1]]) {
                c++;
            }        }
        return c;
        }
}

-(NSInteger)tableView:(UITableView *)tableView
indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (didsearch == YES) {
        return 0;
    }
    else if (didsearch == NO){
        return 5;}
    else{
        return 0;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (didsearch == YES) {
        return@"  Search results";
    }
    else{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"txt"];
    NSString *indexContent = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray *indexTitles = [indexContent componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    if(section == 0){ return @"  Bookmarked Chapters"; }
    else{
        return [NSString stringWithFormat:@"  %@", [indexTitles objectAtIndex:section -1]];
        
    }
    }
}
int h0;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (didsearch == YES) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.textLabel.text = [results objectAtIndex:indexPath.row];
        [self tableView:_tableView indentationLevelForRowAtIndexPath:nil];
        return cell;
    }
    else{
    if (indexPath.section == 0) {
        //
        ///
        ////Favorites
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
                    UILabel *index = [[UILabel alloc] initWithFrame:CGRectMake( 6, ((cell.frame.size.height/2) - ((cell.frame.size.height -5) /2 )), cell.frame.size.height -5, cell.frame.size.height -5)];
                    index.text = [NSString stringWithFormat:@"%i", [[likedObjects objectAtIndex:indexPath.row] intValue] +1];
                index.font = [UIFont fontWithName:@"Cabin" size:23];index.layer.cornerRadius = 6;index.textAlignment = UITextAlignmentCenter;index.textColor =[UIColor whiteColor]; index.backgroundColor = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]];index.layer.cornerRadius = 6;index.clipsToBounds = YES;index.tag = 1;
                    [cell.contentView addSubview:index];
                [cell setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"secondaryColor"]]];
                cell.textColor = [UIColor whiteColor];
                cell.font = [UIFont fontWithName:@"CabinCondensed" size:23];
                cell.textLabel.text = [[[PDFManager alloc] init] titleForChapter:[[likedObjects objectAtIndex:indexPath.row] integerValue]];
                            }
            return cell;
        }
    
        else{
            //
            ///
            ////
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil] ;
                    UILabel *index = [[UILabel alloc] initWithFrame:CGRectMake( 6, ((cell.frame.size.height/2) - ((cell.frame.size.height -5) /2 )), cell.frame.size.height -5, cell.frame.size.height -5)];
                NSMutableArray *subs = [[NSMutableArray alloc] init];
                for (NSString *fileName in [[[PDFManager alloc] init] chapterPaths]) {
                    if([[fileName substringToIndex:1] isEqualToString:[chaptersCount objectAtIndex:indexPath.section - 1]]){
                        [subs addObject:[[fileName substringFromIndex:2] stringByDeletingPathExtension]];
                    }
                }
                NSString *indexRes = [subs objectAtIndex:indexPath.row];
                index.text = [NSString stringWithFormat:@"%i", [[indexRes substringToIndex:2] intValue]];
                        index.font = [UIFont fontWithName:@"Cabin" size:23];index.layer.cornerRadius = 6;index.textAlignment = UITextAlignmentCenter;index.textColor = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]];index.backgroundColor = [UIColor whiteColor];index.layer.cornerRadius = 6;index.clipsToBounds = YES;index.tag = 1;
                    [cell.contentView addSubview:index];
                //1
                [cell setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"secondaryColor"]]];
                cell.textColor = [UIColor whiteColor];
                cell.font = [UIFont fontWithName:@"CabinCondensed" size:22];

            }

            
            if (!tableView) {
                //search viewing
                cell.accessoryType = UITableViewCellAccessoryNone;
            }else{
                //normal viewing
                
            }
            if (tableView  == self.tableView){
                //normal viewing
                didsearch = NO;
                NSMutableArray *subs = [[NSMutableArray alloc] init];
                for (NSString *fileName in [[[PDFManager alloc] init] chapterPaths]) {
                    if([[fileName substringToIndex:1] isEqualToString:[chaptersCount objectAtIndex:indexPath.section - 1]]){
                        [subs addObject:[[[fileName substringFromIndex:5] stringByDeletingPathExtension] stringByReplacingOccurrencesOfString:@"_" withString:@" "]];
                    }
                }
                cell.textLabel.text = [subs objectAtIndex:indexPath.row];
                cell.textLabel.frame = CGRectMake(50, 0, cell.textLabel.frame.size.width, cell.textLabel.frame.size.height);
                [self tableView:_tableView indentationLevelForRowAtIndexPath:nil];
                
            }
            else{
                //search
                didsearch = YES;
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
            
            //
            return cell;
        }
    }

    }
    
 

    

bool didsearch;

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(0,200,300,244)];
    tempView.backgroundColor=[UIColor clearColor];
    
    UILabel *tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,1,self.tableView.frame.size.width,29)];
    tempLabel.backgroundColor=[UIColor whiteColor];
    tempLabel.textColor = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]];
    tempLabel.font = [UIFont boldSystemFontOfSize:18];
    tempLabel.clipsToBounds = YES;
    tempLabel.layer.cornerRadius = 10;
    
    tempLabel.text= [self tableView:_tableView titleForHeaderInSection:section];
    
    [tempView addSubview:tempLabel];
    
    return tempView;
}
- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    if(tableView == self.tableView){
        _tableView.alpha = 0;
        _sarchSegue.alpha = 0;
        _h1.alpha = 0; _h2.alpha = 0; _h3.alpha = 0;
            UITableViewCell *a = [_tableView cellForRowAtIndexPath:indexPath];
            int c =-1;
            for (NSString *stirng in objectsArray) {
                c ++; if([stirng isEqualToString:a.textLabel.text]){
                    break;
                }
            }
            [[NSUserDefaults standardUserDefaults] setObject:[[[[PDFManager alloc] init] chapterPaths] objectAtIndex:c] forKey:@"viewChapter"];

        [UIView transitionWithView:_cardView duration:0.4 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{} completion:^(BOOL s){
            [UIView animateWithDuration:0.2 animations:^{
                _cardView.frame = self.view.frame;
                _cardView.translatesAutoresizingMaskIntoConstraints = YES;
            } completion:^(BOOL s ){
                _cardView.layer.cornerRadius = 0;
                didSendSearch = NO;
                [self performSegueWithIdentifier:@"viewChpter" sender:nil];
            }];
        }];
        
    }
    else{
        UITableViewCell *a = [_tableView cellForRowAtIndexPath:indexPath];
        int c =-1;
        for (NSString *stirng in objectsArray) {
            c ++; if([stirng isEqualToString:a.textLabel.text]){
                break;
            }
        }
        [[NSUserDefaults standardUserDefaults] setObject:[[[[PDFManager alloc] init] chapterPaths] objectAtIndex:c] forKey:@"viewChapter"];

        didSendSearch = YES;
        [self performSegueWithIdentifier:@"viewChpter" sender:nil];

    }

}
#pragma mark-

-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    results = nil;
    NSPredicate *pedicate = [NSPredicate predicateWithFormat:@"SELF contains [search] %@", searchText];
    results = [[objectsArray filteredArrayUsingPredicate:pedicate] mutableCopy];
    didsearch = YES;
    [_tableView reloadData];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [UIView animateWithDuration:0.2 animations:^{
        _cardView.frame = CGRectMake(_cardView.frame.origin.x, _serach.frame.origin.y + 3, _cardView.frame.size.width, heightInit);
        _blurView.alpha = 1;
        _cardView.translatesAutoresizingMaskIntoConstraints = NO;
        _cardView.alpha =1 ;
        _serach.frame = CGRectMake(0, -_serach.frame.size.height, self.view.frame.size.width, _serach.frame.size.height);
    }];
    didsearch = NO;
    [_tableView reloadData];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender{
    if (sender.contentOffset.y < -120) {
        [self searchTrigger:nil];
    }
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
    [self.navigationController performSegueWithIdentifier:@"calc" sender:self];

}

- (IBAction)listButton:(id)sender {
    [self.navigationController performSegueWithIdentifier:@"list" sender:self];

}

- (IBAction)settingsButton:(id)sender {
    [self.navigationController performSegueWithIdentifier:@"settings" sender:self];

}

- (IBAction)searchTrigger:(id)sender {
    heightInit = _cardView.frame.size.height;
    [UIView animateWithDuration:0.2 animations:^{
        _serach.translatesAutoresizingMaskIntoConstraints = YES;
        _serach.frame = CGRectMake(0, 20, self.view.frame.size.width ,_serach.frame.size.height);
        _cardView.frame = CGRectMake(_cardView.frame.origin.x, _serach.frame.origin.y + _serach.frame.size.height + 15, _cardView.frame.size.width , _cardView.frame.size.height);
        _cardView.translatesAutoresizingMaskIntoConstraints = YES;

    } completion:^(BOOL s ){
        [self.serach becomeFirstResponder];
        didsearch = YES;
    }];
}
int heightInit;
-(void) searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    if ([searchBar.text isEqualToString:@""]) {
       
        [UIView animateWithDuration:0.2 animations:^{
            _cardView.frame = CGRectMake(_cardView.frame.origin.x, _serach.frame.origin.y + 3, _cardView.frame.size.width, heightInit);
            _blurView.alpha = 1;
            _cardView.translatesAutoresizingMaskIntoConstraints = NO;
            _cardView.alpha =1 ;
            _serach.frame = CGRectMake(0, -_serach.frame.size.height, self.view.frame.size.width, _serach.frame.size.height);
        }];
        didsearch = NO;
        [_tableView reloadData];
    }
    else{
    }
    
}
- (IBAction)dViewAgree:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"firstLaunch"];
    _bottomBar.userInteractionEnabled = YES;
    _swipedDown.enabled = YES;
    [UIView animateWithDuration:0.3 animations:^{
        _DView.alpha = 0;
        _cardView.alpha =1;
    }];
}
- (IBAction)swipedDown:(id)sender {
    [self searchTrigger:nil];
}
@end
