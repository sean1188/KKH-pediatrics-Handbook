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
#pragma  mark-
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setcolors];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
    
    _webView.alpha = 1; _Ptz.alpha = 0;
    _webView.delegate = self;
    NSString *inde = [NSString stringWithFormat:@"%li ",(long)[[NSUserDefaults standardUserDefaults ] integerForKey:@"viewChpter"]];
    int chpti = [[NSUserDefaults standardUserDefaults] integerForKey:@"viewChpter"]-1;
    NSLog(@"%i", chpti);
    NSString *title = [[[PDFManager alloc] init] titleForChapter:chpti];
    [_chotNameDisp setText:[inde stringByAppendingString:title]];

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
    [self preferredStatusBarStyle];
    //
    
}
- (void)webViewDidFinishLoad:(UIWebView *)a_WebView {
    NSLog(@"memes");
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"fromFavs"] == YES & [[NSUserDefaults standardUserDefaults] boolForKey:[[[PDFManager alloc] init] titleForChapter:[[NSUserDefaults standardUserDefaults] integerForKey:@"viewChpter"]-1]] == YES){
        NSLog(@"faved");
        //_webView.scrollView.contentOffset = CGPointMake(0, 300);
        [_webView.scrollView setContentOffset:CGPointMake(0, 300) animated:YES];
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
