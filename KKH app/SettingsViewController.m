//
//  SettingsViewController.m
//  KKH app
//
//  Created by Sean Lim on 17/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "SettingsViewController.h"
#import <MessageUI/MFMailComposeViewController.h>
@interface SettingsViewController ()

@end

@implementation SettingsViewController
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (BOOL)shouldAutorotate {
    return NO;
}
-(void) viewDidAppear:(BOOL)animated{
    //TEMP disabl auth view for future integration of feature
        _aboutUsView.alpha = 0.7;
    _authTapped.enabled = NO;
    
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
UIButton *transparencyButton ;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setcolors];
    _webViewBackB.alpha = 0;
    transparencyButton = [[UIButton alloc] initWithFrame:self.view.bounds];
    transparencyButton.backgroundColor = [UIColor clearColor];
    [self.view insertSubview:transparencyButton belowSubview:_authView];
    [transparencyButton addTarget:self action:@selector(dissmissAuth) forControlEvents:UIControlEventTouchUpInside];
    transparencyButton.alpha = 0;
    _aboutUsView.layer.shadowOpacity = 0.4;
    _aboutUsView.layer.shadowOffset = CGSizeMake(0, 2);
    _aboutUsView.layer.cornerRadius = 15.0f;
    _startScreenView.layer.cornerRadius = 15.0f;
    _startScreenView.layer.shadowOpacity = 0.4;
    _startScreenView.layer.shadowOffset = CGSizeMake(0, 2);
    // Do any additional setup after loading the view.
    [UIView animateWithDuration:0.3 animations:^{
        _settingsLogo.transform = CGAffineTransformMakeRotation(M_PI);
        _topSettingslogo.transform = CGAffineTransformMakeRotation(M_PI);
    }];
    //init startup selection
    [_startUpSelection setSelectedSegmentIndex:[[NSUserDefaults standardUserDefaults] integerForKey:@"startUp"]];
    _primaryColorIndicator.layer.cornerRadius = _primaryColorIndicator.frame.size.width/2;
    _primaryColorIndicator.layer.shadowOpacity = 0.4; _primaryColorIndicator.layer.shadowOffset = CGSizeMake(1, 2);
    _SecondaryColorIndicator.layer.cornerRadius = _SecondaryColorIndicator.frame.size.width /2 ;
    _color1Primary.layer.cornerRadius = _color1Primary.frame.size.width/2;
    _color1Primary.layer.shadowOpacity = 0.4; _color1Primary.layer.shadowOffset = CGSizeMake(1, 1);
    _color2Primary.layer.cornerRadius = _color2Primary.frame.size.width/2;
    _color2Primary.layer.shadowOpacity = 0.4; _color2Primary.layer.shadowOffset = CGSizeMake(1, 2);
    _color3Primary.layer.cornerRadius = _color3Primary.frame.size.width/2;
    _color3Primary.layer.shadowOpacity = 0.4; _color3Primary.layer.shadowOffset = CGSizeMake(1, 2);
    _color1Secondary.layer.cornerRadius = _color1Secondary.frame.size.width/2;
    _color2Secondary.layer.cornerRadius = _color2Secondary.frame.size.width/2;
    _Color3Seconday.layer.cornerRadius = _Color3Seconday.frame.size.width/2;
    [self initColor];
    _colorSelectPadding.layer.cornerRadius = 15.0f;
    _colorSelectPadding.layer.shadowOpacity = 0.4; _colorSelectPadding.layer.shadowOffset = CGSizeMake(1, 2);

    _blurView.alpha = 0; _color1Primary.alpha = 0; _color2Primary.alpha =0; _color3Primary.alpha = 0;
    
}

-(void) initColor{
    [_primaryColorIndicator setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    [_SecondaryColorIndicator setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
    [_color1Primary setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor1"]]];
    [_color1Secondary  setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor1"]]];
    [_color2Primary setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor2"]]];
    [_color2Secondary setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor2"]]];
    [_color3Primary setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor3"]]];
    [_Color3Seconday   setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor3"]]];
}
- (IBAction)didTapColor:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _blurView.alpha =1;_color1Primary.alpha = 1; _color2Primary.alpha =1; _color3Primary.alpha = 1;
    }];
}
- (IBAction)blurTap:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        _blurView.alpha = 0; _color1Primary.alpha = 0; _color2Primary.alpha =0; _color3Primary.alpha = 0;
        
    }];
}
- (IBAction)color1Tapped:(id)sender {
    //replace color 1
    NSData *color1Primary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_primaryColorIndicator.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:color1Primary forKey:@"primaryColor1"];
    NSData *color1Secondary = [NSKeyedArchiver archivedDataWithRootObject:[UIColor colorWithCGColor:_SecondaryColorIndicator.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:color1Secondary forKey:@"secondaryColor1"];
    //set selected colors
    NSData *swapPrimary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_color1Primary.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:swapPrimary forKey:@"primaryColor"];
    NSData *swapSecondary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_color1Secondary.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:swapSecondary forKey:@"secondaryColor"];
    
    [self setcolors];[UIView animateWithDuration:0.2 animations:^{
        _blurView.alpha = 0; _color1Primary.alpha = 0; _color2Primary.alpha =0; _color3Primary.alpha = 0;
        
    }];[self initColor];
}
- (IBAction)color2Tapped:(id)sender {
    //replace color 2
    NSData *color2Primary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_primaryColorIndicator.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:color2Primary forKey:@"primaryColor2"];
    NSData *color2Secondary = [NSKeyedArchiver archivedDataWithRootObject:[UIColor colorWithCGColor:_SecondaryColorIndicator.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:color2Secondary forKey:@"secondaryColor2"];
    //set selected colors
    NSData *swapPrimary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_color2Primary.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:swapPrimary forKey:@"primaryColor"];
    NSData *swapSecondary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_color2Secondary.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:swapSecondary forKey:@"secondaryColor"];
    
    [self setcolors];[UIView animateWithDuration:0.2 animations:^{
        _blurView.alpha = 0; _color1Primary.alpha = 0; _color2Primary.alpha =0; _color3Primary.alpha = 0;
        
    }];[self initColor];

}
- (IBAction)color3Tapped:(id)sender {
    //replace color 1
    NSData *color3Primary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_primaryColorIndicator.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:color3Primary forKey:@"primaryColor3"];
    NSData *color3Secondary = [NSKeyedArchiver archivedDataWithRootObject:[UIColor colorWithCGColor:_SecondaryColorIndicator.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:color3Secondary forKey:@"secondaryColor3"];
    //set selected colors
    NSData *swapPrimary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_color3Primary.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:swapPrimary forKey:@"primaryColor"];
    NSData *swapSecondary = [NSKeyedArchiver archivedDataWithRootObject: [UIColor colorWithCGColor:_Color3Seconday.backgroundColor.CGColor]];
    [[NSUserDefaults standardUserDefaults] setObject:swapSecondary forKey:@"secondaryColor"];
    
    [self setcolors];[UIView animateWithDuration:0.2 animations:^{
        _blurView.alpha = 0; _color1Primary.alpha = 0; _color2Primary.alpha =0; _color3Primary.alpha = 0;
        
    }];[self initColor];

}

#pragma  mark - bottom bar
- (IBAction)ref:(id)sender {
    [self.navigationController performSegueWithIdentifier:@"ref" sender:nil];
}

- (IBAction)calc:(id)sender {
    [self.navigationController performSegueWithIdentifier:@"calc" sender:nil];
}

- (IBAction)fav:(id)sender {
    [self.navigationController performSegueWithIdentifier:@"list" sender:nil];
}

- (IBAction)settings:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _settingsLogo.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}
- (IBAction)aboutUsTapped:(id)sender {
    [self performSegueWithIdentifier:@"about" sender:self];
}
UIWebView *webView;
- (IBAction)aboutUsbutton:(id)sender {
        //Feedback
    _webViewBackB.alpha = 1;
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height + self.view.frame.size.height - _topBar.frame.size.height - 20, self.view.frame.size.width, self.view.frame.size.height - _topBar.frame.size.height - 20)];
    NSString *urlString = @"http://www.facebook.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [webView loadRequest:urlRequest];
    [self.view addSubview:webView];
    [UIView animateWithDuration:0.4 animations:^{
        webView.frame = CGRectMake(0, _topBar.frame.size.height + 20, self.view.frame.size.width, self.view.frame.size.height - _topBar.frame.size.height - 20);
    }];
    
}


- (IBAction)infoB:(id)sender {
    [self aboutUsTapped:nil];
}
- (IBAction)didChangeStartup:(id)sender {
    [[NSUserDefaults standardUserDefaults ] setInteger:[_startUpSelection selectedSegmentIndex] forKey:@"startUp"];
}

NSString *keyInput = @"";
- (IBAction)auth:(id)sender {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"auth"] == YES) {
        
    }
    else if([[NSUserDefaults standardUserDefaults] boolForKey:@"auth"] != YES){
    transparencyButton.alpha = 1;
    [self.view addSubview:_authView];
    _authView.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        _authView.alpha = 1;
    }];
    for (UIButton *button  in _pinButtons) {
        button.layer.cornerRadius = button.frame.size.width/2;
        button.layer.shadowOpacity = 0.4;
        button.layer.shadowOffset = CGSizeMake(0 , 2);
        button.enabled=YES;
    }
    _authView.frame =CGRectMake((self.view.frame.size.width/2 ) - (self.authView.frame.size.width /2), (self.view.frame.size.height/2) - (self.authView.frame.size.height/2 ), _authView.frame.size.width, _authView.frame.size.height);
    _authView.layer.cornerRadius = 16.0f;
    _authView.layer.shadowOpacity = 0.4; _authView.layer.shadowOffset = CGSizeMake(0, 2);
    }
    
}
-(void)dissmissAuth{
    keyInput = @"";
    transparencyButton.alpha = 0;
    inputCount = 0;
    _pinDisp.text = @"";
    [UIView animateWithDuration:0.3 animations:^{
        _authView.alpha = 0;
    }];
}
int inputCount = 0;
- (IBAction)one:(id)sender {
    keyInput = [keyInput stringByAppendingString:@"1"];
    _pinDisp.text = keyInput;
    [self foo];
}

- (IBAction)two:(id)sender {
    keyInput = [keyInput stringByAppendingString:@"2"];
    _pinDisp.text = keyInput;
    [self foo];


}

- (IBAction)three:(id)sender {
    keyInput = [keyInput stringByAppendingString:@"3"];
    _pinDisp.text = keyInput;
    [self foo];

}

- (IBAction)four:(id)sender {
    keyInput = [keyInput stringByAppendingString:@"4"];
    _pinDisp.text = keyInput;
    [self foo];
}

- (IBAction)five:(id)sender {
    keyInput = [keyInput stringByAppendingString:@"5"];
    _pinDisp.text = keyInput;
    [self foo];

}

- (IBAction)six:(id)sender {
    keyInput = [keyInput stringByAppendingString:@"6"];
    _pinDisp.text = keyInput;
    [self foo];

}

- (IBAction)seven:(id)sender {
    keyInput = [keyInput stringByAppendingString:@"7"];
    _pinDisp.text = keyInput;
    [self foo];

}

- (IBAction)eight:(id)sender {
    keyInput = [keyInput stringByAppendingString:@"8"];
    _pinDisp.text = keyInput;
    [self foo];

}

- (IBAction)nine:(id)sender {
    keyInput = [keyInput stringByAppendingString:@"9"];
    _pinDisp.text = keyInput;
    [self foo];
}

- (IBAction)zero:(id)sender {
    keyInput = [keyInput stringByAppendingString:@"0"];
    _pinDisp.text = keyInput;
    [self foo];
}
-(void) foo{
    inputCount ++;
    if(inputCount == 3 | inputCount == 6 ){
        keyInput = [keyInput stringByAppendingString:@"-"];
        _pinDisp.text = keyInput;
    }
    if (inputCount == 9) {
        for (UIButton *button in _pinButtons) {
            button.enabled = NO;
        }
        if ([keyInput isEqualToString:@"217-019-893"]) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"auth"];
            [self dissmissAuth];
            [self performSegueWithIdentifier:@"auth" sender:self];

        }
        else{
            CABasicAnimation *animation =
            [CABasicAnimation animationWithKeyPath:@"position"];
            [animation setDuration:0.05];
            [animation setRepeatCount:4];
            [animation setAutoreverses:YES];
            [animation setFromValue:[NSValue valueWithCGPoint:
                                     CGPointMake([_authView center].x - 8.0f, [_authView center].y)]];
            [animation setToValue:[NSValue valueWithCGPoint:
                                   CGPointMake([_authView center].x + 8.0f, [_authView center].y)]];
            [[_authView layer] addAnimation:animation forKey:@"position"];
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.9 * NSEC_PER_SEC); dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [self dissmissAuth];
            });
            
        }
    }
}
- (IBAction)webViewBack:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _webViewBackB.alpha = 0;
        webView.frame = CGRectMake(0, self.view.frame.size.height + webView.frame.size.height, webView.frame.size.width, webView.frame.size.height);
    }];
}
@end
