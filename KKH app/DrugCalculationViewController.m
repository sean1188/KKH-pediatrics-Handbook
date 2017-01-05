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
@property (strong, nonatomic) CardiacDrugCalculationsManager *Cardiacmannager;


@end

@implementation DrugCalculationViewController
-(UIStatusBarStyle )preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}
bool firstE;
-(void)viewWillAppear:(BOOL)animated{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"willSeeSpecificDrugs"] != YES) {
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
        _webView.alpha = 0;
        _drugimg.alpha = 1;
        _nextB.alpha = 1;
    }
    }else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"willSeeSpecificDrugs"];
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
    counttt = 0;
    _backB.alpha = 1;
    _pickerDrug.alpha = 0;
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
    //
    _resView.alpha = 0;
    firstE = YES; didViewPdf = NO;                                              _textField.delegate = self;
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

- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 2;
}
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (row) {
        case 0:
            return [[NSAttributedString alloc] initWithString:@"Anaesthesia Drug Calculator" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
            break;
        case 1:
            return [[NSAttributedString alloc] initWithString:@"Cardiac Drug Calculator" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
            break;
        default:
            return nil;
            break;
    }
}

#pragma mark - data processing

//
int counttt;
- (IBAction)next:(id)sender {
    _resView.alpha = 1;
    [_textField resignFirstResponder];
    [_nextB addArrToTickAnimation];
    if ((counttt == 0) & ![_textField.text isEqualToString:@""]) {
        counttt ++;
        [UIView animateWithDuration:0.3 animations:^{
            _textField.alpha = 0;
            //init drug type selector
            _pickerDrug.alpha = 1;
        }];
        [[NSUserDefaults standardUserDefaults] setObject:_textField.text forKey:@"DCweight"];
        
    }
    else if (counttt == 1){
        counttt ++;
        //init resView
        if ([_pickerDrug selectedRowInComponent:0] == 0) {
            [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"drugListType"];
            //drug cal
            _mannager = [DrugCalculationsManager alloc];
            [_webView loadData:[[_mannager initWithWeight:_textField.text.intValue] getData] MIMEType:@"text/csv" textEncodingName:@"utf-8" baseURL:nil];
            _webView.translatesAutoresizingMaskIntoConstraints = YES;
            _webView.layer.cornerRadius = self.webView.frame.size.height/2;
            _webView.scalesPageToFit = YES;
            _webView.clipsToBounds =YES;
            [_nextB addTickToCrossAnimation];
            [UIView animateWithDuration:0.3 animations:^{
                _resView.frame =  CGRectMake(_resView.frame.origin.x - _resView.frame.size.width - 10, _resView.frame.origin.y, _resView.frame.size.width, _resView.frame.size.height);
                _pickerDrug.alpha = 0;
                _textField.alpha = 0;
                _resView.translatesAutoresizingMaskIntoConstraints = NO;
            } completion:^(BOOL s  ){
                [UIView animateWithDuration:0.3 animations:^{
                    _webView.alpha= 1;
                    _backB.alpha = 0;
                }];
                
            }];

        }
        else if ([_pickerDrug selectedRowInComponent:0] == 1){
            [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"drugListType"];
            //cardiac
            _Cardiacmannager = [CardiacDrugCalculationsManager alloc];
            [_webView loadData:[[_Cardiacmannager initWithWeight:_textField.text.intValue] getData] MIMEType:@"text/csv" textEncodingName:@"utf-8" baseURL:nil];
            _webView.translatesAutoresizingMaskIntoConstraints = YES;
            _webView.layer.cornerRadius = self.webView.frame.size.height/2;
            _webView.scalesPageToFit = YES;
            _webView.clipsToBounds =YES;
            [_nextB addTickToCrossAnimation];
            [UIView animateWithDuration:0.3 animations:^{
                _resView.frame =  CGRectMake(_resView.frame.origin.x - _resView.frame.size.width - 10, _resView.frame.origin.y, _resView.frame.size.width, _resView.frame.size.height);
                _pickerDrug.alpha = 0;
                _textField.alpha = 0;
                _resView.translatesAutoresizingMaskIntoConstraints = NO;
            } completion:^(BOOL s  ){
                [UIView animateWithDuration:0.3 animations:^{
                    _webView.alpha= 1;
                    _backB.alpha = 0;
                }];
                
            }];

        }
            }
    else if ([_textField.text isEqualToString:@""]){
        
    }
    else if (didViewPdf == YES) {
        didViewPdf = NO;
        [UIView animateWithDuration:0.2 animations:^{
            //
            _webView.translatesAutoresizingMaskIntoConstraints = YES;
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
    [[_mannager initWithWeight:_textField.text.intValue] sendEmail:self];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"willSeeSpecificDrugs"];
}
- (IBAction)specificDrugB:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"willSeeSpecificDrugs"];
    [self performSegueWithIdentifier:@"specific" sender:self];
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
