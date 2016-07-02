//
//  webViewPDF\.m
//  KKH app
//
//  Created by Sean Lim on 10/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "webViewPDF\.h"
#import "KKH_app-Swift.h"

@interface webViewPDF_ ()

@end

@implementation webViewPDF_
-(UIStatusBarStyle)preferredStatusBarStyle{
        return UIStatusBarStyleLightContent;

}
-(BOOL) prefersStatusBarHidden{
    return YES;
}
-(void) setcolors{
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"secondaryColor"]]];
    for (UIView *views in _primaryViews) {
        [views setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    }
}
#pragma  mark- rotation
- (void) orientationChanged:(NSNotification *)note
{
    if (i == true) {
    UIDevice * device = note.object;
    switch(device.orientation)
    {
        case UIDeviceOrientationPortrait:{
            [UIView animateWithDuration:0.4 animations:^{
                _webView.transform = CGAffineTransformIdentity;
                _webView.translatesAutoresizingMaskIntoConstraints = NO;
                [_webView.scrollView setZoomScale: 1 animated: YES];
            }];
        }break;
        case UIDeviceOrientationLandscapeLeft:{
            [UIView animateWithDuration:0.4 animations:^{
                _webView.transform = CGAffineTransformMakeRotation((M_PI * 90) / 180);
                _webView.frame = self.view.frame; _webView.translatesAutoresizingMaskIntoConstraints = YES;
                
            }];
        }break;
        case UIDeviceOrientationLandscapeRight:{
            [UIView animateWithDuration:0.3 animations:^{
                _webView.transform = CGAffineTransformMakeRotation((M_PI * -90) / 180);
                _webView.frame = self.view.frame; _webView.translatesAutoresizingMaskIntoConstraints = YES;

            }];
        }break;
            
        default:{
        }break;
    };
    }
}
#pragma  mark-
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setcolors];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
    //
    int likedChpts = 0;
    for (int i = 0; i < [[[PDFManager alloc] init]numberOfChapters]; i ++) {
        if ([[NSUserDefaults standardUserDefaults] boolForKey:[[[PDFManager alloc] init]titleForChapter:i]] == TRUE) {
            likedChpts ++;
            NSLog(@"%i liked chpts", likedChpts);
        }
    }
    //
    _webView.alpha = 0; _Ptz.alpha = 0;
    [_h1 setText:[NSString stringWithFormat:@"%li",(long)[[NSUserDefaults standardUserDefaults ] integerForKey:@"viewChpter"]]];
    [_h2 setText:[NSString stringWithFormat:@"%@",[[[PDFManager alloc] init] titleForChapter:[[NSUserDefaults standardUserDefaults] integerForKey:@"viewChpter"] - 1]]];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:[[[PDFManager alloc] init] titleForChapter:[[NSUserDefaults standardUserDefaults] integerForKey:@"viewChpter"]-1]] == TRUE) {
        [_favButton setImage:[UIImage imageNamed:@"ic_favorite_white"] forState:UIControlStateNormal];
        [_favButton setTitle:@"FAVOURITED" forState:UIControlStateNormal];
    }
    else{
        [_favButton setImage:[UIImage imageNamed:@"ic_favorite_border_white"] forState:UIControlStateNormal];
        [_favButton setTitle:@"ADD AS FAVOURITE" forState:UIControlStateNormal];

    }
    NSString *fileName;
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"viewChpter"] < 10) {
        fileName = [NSString stringWithFormat:@"0%li-%@",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"viewChpter"],[[[PDFManager alloc] init] titleForChapter:[[NSUserDefaults standardUserDefaults] integerForKey:@"viewChpter"]- 1]];
        NSLog(fileName);
    }
    else{
        fileName = [NSString stringWithFormat:@"%li-%@",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"viewChpter"],[[[PDFManager alloc] init] titleForChapter:[[NSUserDefaults standardUserDefaults] integerForKey:@"viewChpter"] -1 ]];
        NSLog(fileName);

    }
    _h2.adjustsFontSizeToFitWidth = YES;
    fileName = [fileName stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"pdf"];
    NSURL *targetURL = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [_webView loadRequest:request];
    i = false;
    [self preferredStatusBarStyle];
    _buttonPadding.layer.cornerRadius = _buttonPadding.frame.size.width/2;
    _buttonPadding.layer.shadowOpacity = 0.4; _buttonPadding.layer.shadowOffset = CGSizeMake(1, 1);
}

bool i;
- (IBAction)tappedButton:(id)sender {
    _tapGest.enabled = NO;
    if (i != true) {
        [_animView addArrToTickAnimation];
        [UIView animateWithDuration:0.2 animations:^{
            _buttonPadding.frame = self.view.frame;
            _buttonPadding.translatesAutoresizingMaskIntoConstraints = YES;

            
        }completion:^(BOOL s ){
            i = true;
            [self prefersStatusBarHidden];
            if ([[NSUserDefaults standardUserDefaults] boolForKey:@"Vpdf"] != TRUE) {
                [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"Vpdf"];
                UIAlertController * a  = [UIAlertController alertControllerWithTitle:@"Useful Tip" message:@"Rotate screen for full screen mode!" preferredStyle:UIAlertControllerStyleAlert];
                [a addAction:[UIAlertAction actionWithTitle:@"Got it" style:UIAlertActionStyleCancel handler:nil]];
                [self presentViewController:a animated:YES completion:nil];
            }
            _buttonPadding.layer.cornerRadius = 0;
            [UIView animateWithDuration:0.3 animations:^{
                _webView.alpha =1; _Ptz.alpha = 1;
            }];
            double delayInSeconds = 0.6;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [_animView addTickToCrossAnimation];
                _tapGest.enabled =YES;
            });
        }];
    }
    else{
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"fromFavs"] == YES){
            [self dismissViewControllerAnimated:YES completion:nil];
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"fromFavs"];
            
        }else{
            [self dismissViewControllerAnimated:YES completion:nil];}    }
  
    
}
- (IBAction)favButton:(id)sender {
    int likedChpts = 0;
    for (int i = 0; i < [[[PDFManager alloc] init]numberOfChapters]; i ++) {
        if ([[NSUserDefaults standardUserDefaults] boolForKey:[[[PDFManager alloc] init]titleForChapter:i]] == TRUE) {
            likedChpts ++;
            NSLog(@"%i liked chpts", likedChpts);
        }
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:[[[PDFManager alloc] init] titleForChapter:[[NSUserDefaults standardUserDefaults] integerForKey:@"viewChpter"]-1]] != TRUE & likedChpts < 9) {
        [_favButton setImage:[UIImage imageNamed:@"ic_favorite_white"] forState:UIControlStateNormal];
        [_favButton setTitle:@"FAVOURITED" forState:UIControlStateNormal];
        NSLog([NSString stringWithFormat:@"favorited %li", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"viewChpter"]]);
        [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:[[[PDFManager alloc] init] titleForChapter:[[NSUserDefaults standardUserDefaults] integerForKey:@"viewChpter"]-1]];
    }
    else if ([[NSUserDefaults standardUserDefaults] boolForKey:[[[PDFManager alloc] init] titleForChapter:[[NSUserDefaults standardUserDefaults] integerForKey:@"viewChpter"]-1]] != TRUE & likedChpts > 9){
        UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Oops" message:@"You can only favorite up to 9 chapters." preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else{
        [_favButton setImage:[UIImage imageNamed:@"ic_favorite_border_white"] forState:UIControlStateNormal];
        [_favButton setTitle:@"ADD AS FAVOURITE" forState:UIControlStateNormal];
        [[NSUserDefaults standardUserDefaults] setBool:FALSE forKey:[[[PDFManager alloc] init] titleForChapter:[[NSUserDefaults standardUserDefaults] integerForKey:@"viewChpter"]-1 ]];
    }

}
- (IBAction)backButton:(id)sender {
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"fromFavs"] == YES){
        [self dismissViewControllerAnimated:YES completion:nil];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"fromFavs"];

    }else{
        [self dismissViewControllerAnimated:YES completion:nil];}
}
@end
