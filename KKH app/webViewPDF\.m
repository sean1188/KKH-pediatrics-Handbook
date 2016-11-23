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
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"primaryColor"]]];
    for (UIView *views in _primaryViews) {
        [views setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    }
}
#pragma  mark- rotation
- (void) orientationChanged:(NSNotification *)note
{
    UIDevice * device = note.object;
    switch(device.orientation)
    {
        case UIDeviceOrientationPortrait:{
            [UIView animateWithDuration:0.4 animations:^{
                _likedView.alpha = 1;
                _likedView.frame = likedViewInit;
                _likedView.translatesAutoresizingMaskIntoConstraints = NO;
                _webView.transform = CGAffineTransformIdentity;
                _webView.translatesAutoresizingMaskIntoConstraints = NO;
                [_webView.scrollView setZoomScale: 1 animated: YES];
            }];
        }break;
        case UIDeviceOrientationLandscapeLeft:{
            [UIView animateWithDuration:0.4 animations:^{
                _likedView.alpha = 0;
                _likedView.translatesAutoresizingMaskIntoConstraints = YES;

                _likedView.frame = CGRectMake(_likedView.frame.origin.x, _likedView.frame.origin.y - _likedView.frame.size.height- _likedView.frame.size.height, _likedView.frame.size.width, _likedView.frame.size.height);
                _webView.transform = CGAffineTransformMakeRotation((M_PI * 90) / 180);
                _webView.frame = self.view.frame; _webView.translatesAutoresizingMaskIntoConstraints = YES;
                
            }];
        }break;
        case UIDeviceOrientationLandscapeRight:{
            [UIView animateWithDuration:0.3 animations:^{
                _likedView.alpha = 0;
                _likedView.translatesAutoresizingMaskIntoConstraints = YES;
                 _likedView.frame = CGRectMake(_likedView.frame.origin.x, _likedView.frame.origin.y - _likedView.frame.size.height- _likedView.frame.size.height, _likedView.frame.size.width, _likedView.frame.size.height);
                _webView.transform = CGAffineTransformMakeRotation((M_PI * -90) / 180);
                _webView.frame = self.view.frame; _webView.translatesAutoresizingMaskIntoConstraints = YES;

            }];
        }break;
            
        default:{
        }break;
    };
    
}
#pragma  mark-
int chpti ;
CGRect likedViewInit;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setcolors];
    i = true;
    likedViewInit = _likedView.frame;
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
    
    _likedView.layer.cornerRadius = self.likedView.frame.size.width/2;
    _likedView.clipsToBounds = YES;
   
    _webView.alpha = 1; _Ptz.alpha = 0;
    _webView.delegate = self;   _webView.scrollView.delegate = self;
    
    NSString *file = [[NSUserDefaults standardUserDefaults] objectForKey:@"viewChapter"];
    chpti = [[[file substringToIndex:4] substringFromIndex:2] intValue];
    NSLog(@"%i", chpti);
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:[[[PDFManager alloc] init] titleForChapter:chpti- 1]] == TRUE){
        [_favImg setImage:[UIImage imageNamed:@"ic_favorite_white"]];
        
    }
    else{
        [_favImg setImage:[UIImage imageNamed:@"ic_favorite_border_white"]];
    }
    [_chotNameDisp setText: [[[PDFManager alloc] init] titleForChapter:chpti -1]];

    NSString *fileName = [[NSUserDefaults standardUserDefaults]objectForKey:@"viewChapter" ];
    _h2.adjustsFontSizeToFitWidth = YES;

    NSString *path = [[NSBundle mainBundle] pathForResource:[fileName stringByDeletingPathExtension] ofType:@"pdf"];
    NSURL *targetURL = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [_webView loadRequest:request];
    [self preferredStatusBarStyle];
    //
    
}
bool i;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (i == false) {
        
    }
    else{
    [UIView animateWithDuration:0.3 animations:^{
        _likedView.alpha = 1;
    } completion:^(BOOL s ){
        //prevent creation of other instances
        i = false;
        double delayInSeconds = 4.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [UIView animateWithDuration:0.3 animations:^{
                _likedView.alpha = 0;

            }completion:^(BOOL s ){
                i = true;
            }];
        });
    }];
      
    }
}
- (void)webViewDidFinishLoad:(UIWebView *)a_WebView {
    if([[NSUserDefaults standardUserDefaults] boolForKey:[[[PDFManager alloc] init] titleForChapter:chpti]] == TRUE){
        [_webView.scrollView setContentOffset:CGPointMake(0, [[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"%@ Scroll",[[[PDFManager alloc] init] titleForChapter:chpti]]]) animated:YES];
    }
    
}

- (IBAction)backButton:(id)sender {
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"fromFavs"] == YES){
        [self dismissViewControllerAnimated:YES completion:nil];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"fromFavs"];

    }else{
        [self dismissViewControllerAnimated:YES completion:nil];}
}
- (IBAction)favorite:(id)sender {
    if ( [[NSUserDefaults standardUserDefaults] boolForKey:[[[PDFManager alloc] init] titleForChapter:chpti -1]] != TRUE) {
        //like
        [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:[[[PDFManager alloc] init] titleForChapter:chpti -1]];
        [[NSUserDefaults standardUserDefaults]setInteger:_webView.scrollView.contentOffset.y forKey:[NSString stringWithFormat:@"%@ Scroll",[[[PDFManager alloc] init] titleForChapter:chpti]]];
        [_favImg setImage:[UIImage imageNamed:@"ic_favorite_white"]];
    }
    else if ( [[NSUserDefaults standardUserDefaults] boolForKey:[[[PDFManager alloc] init] titleForChapter:chpti -1]] == TRUE){
        //unlike
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:[[[PDFManager alloc] init] titleForChapter:chpti-1]];
        [[NSUserDefaults standardUserDefaults]setInteger:0 forKey:[[[PDFManager alloc] init] titleForChapter:chpti -1]];
        [_favImg setImage:[UIImage imageNamed:@"ic_favorite_border_white"]];
        
    }
    
}
@end
