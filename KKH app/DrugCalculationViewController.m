//
//  DrugCalculationViewController.m
//  KKH app
//
//  Created by Sean Lim on 20/7/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "DrugCalculationViewController.h"
#import "KKH_app-Swift.h"

@interface DrugCalculationViewController ()
@property (strong, nonatomic) DrugCalculationsManager *mannager;


@end

@implementation DrugCalculationViewController
bool didNext;
-(UIStatusBarStyle )preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}
bool firstE;
-(void)viewWillAppear:(BOOL)animated{
    if (firstE == YES) {
        _resView.layer.cornerRadius = 15.0f;
        [_resView setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]]];
        _resView.frame = CGRectMake(_resView.frame.origin.x + _resView.frame.size.width + 10, _resView.frame.origin.y, _resView.frame.size.width, _resView.frame.size.height);
        _resView.translatesAutoresizingMaskIntoConstraints = YES;
        _textField.backgroundColor =[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]];
        firstE = NO;
    }
    else{
        _resView.translatesAutoresizingMaskIntoConstraints =YES;
        _resView.frame = CGRectMake(_resView.frame.origin.x, _resView.frame.origin.y + 1000 , _resView.frame.size.width, _resView.frame.size.height);
        _webView.alpha = 1;
        _drugimg.alpha = 1;
        _nextB.alpha = 1;
    }
}
bool iu;
CGRect webViewInit;
- (void) orientationChanged:(NSNotification *)note
{
    if (didViewPdf == YES) {
        UIDevice * device = note.object;
        switch(device.orientation)
        {
            case UIDeviceOrientationPortrait:{
                [UIView animateWithDuration:0.4 animations:^{
                    _nextB.alpha = 1;

                    _webView.transform = CGAffineTransformIdentity;
                    _webView.translatesAutoresizingMaskIntoConstraints = YES;
                    _webView.frame = webViewInit;
                    [_webView.scrollView setZoomScale: 1 animated: YES];
                }];
            }break;
            case UIDeviceOrientationLandscapeLeft:{

                [UIView animateWithDuration:0.4 animations:^{
                    _nextB.alpha = 0;

                    _webView.transform = CGAffineTransformMakeRotation((M_PI * 90) / 180);
                    _webView.frame = self.view.frame; _webView.translatesAutoresizingMaskIntoConstraints = YES;
                    
                }];
            }break;
            case UIDeviceOrientationLandscapeRight:{
                [UIView animateWithDuration:0.3 animations:^{
                    _nextB.alpha = 0;

                    _webView.transform = CGAffineTransformMakeRotation((M_PI * -90) / 180);
                    _webView.frame = self.view.frame; _webView.translatesAutoresizingMaskIntoConstraints = YES;
                    
                }];
            }break;
                
            default:{
            }break;
        };
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
    //
    [_nextB addArrToTickAnimation];
    _resView.alpha = 0;
    firstE = YES; didViewPdf = NO; didNext = NO;
    _textField.delegate = self;
    _webView.alpha = 0;
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]];
    
}

CGRect textFrame;
CGRect buttonFrame;
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    textFrame = textField.frame;
    buttonFrame = _nextB.frame;
    textField.translatesAutoresizingMaskIntoConstraints = YES;
    _nextB.translatesAutoresizingMaskIntoConstraints = YES;
    [UIView animateWithDuration: 0.3 animations:^{
        _textField.frame = CGRectMake(_textField.frame.origin.x, _textField.frame.origin.y - 100, _textField.frame.size.width, _textField.frame.size.height);
        _nextB.frame = CGRectMake(_nextB.frame.origin.x, _textField.frame.origin.y + 80, _nextB.frame.size.width, _nextB.frame.size.height);
        _drugimg.transform = CGAffineTransformMakeScale(2, 2);
        _drugimg.translatesAutoresizingMaskIntoConstraints = YES;
        _drugimg.frame = CGRectMake(_drugimg.frame.origin.x, _drugimg.frame.origin.y + 50, _drugimg.frame.size.width, _drugimg.frame.size.height);
    }];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_textField resignFirstResponder];
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.3 animations:^{
        _textField.frame = textFrame;
        _nextB.frame = buttonFrame;
        _drugimg.transform = CGAffineTransformMakeScale(1.0, 1.0);
        _drugimg.translatesAutoresizingMaskIntoConstraints = NO;
_drugimg.frame = CGRectMake(_drugimg.frame.origin.x, _drugimg.frame.origin.y - 50, _drugimg.frame.size.width, _drugimg.frame.size.height);
    }];

}

#pragma mark - data processing

//

- (IBAction)next:(id)sender {
    _resView.alpha = 1;
    [_textField resignFirstResponder];
    if (didNext == NO & ![_textField.text isEqualToString:@""]) {
        didNext = YES;
        _mannager = [DrugCalculationsManager alloc];
        [_webView loadData:[[_mannager initWithWeight:_textField.text.intValue] getData] MIMEType:@"text/csv" textEncodingName:@"utf-8" baseURL:nil];
        
        _webView.layer.cornerRadius = _webView.frame.size.width/2;
        _webView.scalesPageToFit = YES;
        _webView.clipsToBounds =YES;
        [_nextB addTickToCrossAnimation];
        [UIView animateWithDuration:0.3 animations:^{
            _resView.frame =  CGRectMake(_resView.frame.origin.x - _resView.frame.size.width - 10, _resView.frame.origin.y, _resView.frame.size.width, _resView.frame.size.height);
            _textField.alpha = 0;
            _resView.translatesAutoresizingMaskIntoConstraints = NO;
        } completion:^(BOOL s  ){
            [UIView animateWithDuration:0.3 animations:^{
                _webView.alpha =1;

            }];

        }];
    }
    else if ([_textField.text isEqualToString:@""]){
        
    }
    else if (didViewPdf == YES) {
        didViewPdf = NO;
        [UIView animateWithDuration:0.2 animations:^{
            _webView.translatesAutoresizingMaskIntoConstraints = NO;
            _webView.frame = initFrameWeb;
            _webView.layer.cornerRadius = self.webView.frame.size.width/2;
            _resView.alpha = 1;
            _drugimg.alpha = 1;
        }completion:^(BOOL s ){
        }];
    }
    else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }

}
CGRect initFrameWeb;
bool didViewPdf;
- (IBAction)viewB:(id)sender {
    didViewPdf = YES;
    [self prefersStatusBarHidden];
    [UIView animateWithDuration:0.2  animations:^{
        initFrameWeb =  _webView.frame;
        _drugimg.alpha = 0;
        _webView.translatesAutoresizingMaskIntoConstraints = YES;
        _webView.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 110);
        webViewInit = _webView.frame;
        _resView.alpha = 0;
    } completion:^(BOOL s){
        _webView.layer.cornerRadius = 0;
    }];
}
- (IBAction)sendB:(id)sender {
    _webView.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        _resView.translatesAutoresizingMaskIntoConstraints =YES;
        _resView.frame = CGRectMake(_resView.frame.origin.x, _resView.frame.origin.y - 1000, _resView.frame.size.width, _resView.frame.size.height);
        _drugimg.alpha = 0;
        _nextB.alpha = 0;
    } completion:^(BOOL s ){
        [[_mannager initWithWeight:_textField.text.intValue] sendEmail:self];

        
    }];
}
@end
