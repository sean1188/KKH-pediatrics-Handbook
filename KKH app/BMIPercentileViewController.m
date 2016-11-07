//
//  BMIPercentileViewController.m
//  KKH app
//
//  Created by Sean Lim on 23/7/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "BMIPercentileViewController.h"
#import "KKH_app-Swift.h"

@interface BMIPercentileViewController ()
@property (strong, nonatomic) BMIGraphManager *bmiManager;
@end

@implementation BMIPercentileViewController

UIColor *primarycolor ;
UIColor *secondaryColor;
int state;
int h, w;
-(UIStatusBarStyle ) preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //init color
    primarycolor =[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryColor"]]; secondaryColor = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryColor"]];
    [self.view setBackgroundColor:primarycolor];
    //
    //
    state = 0;
    _textField.delegate = self;
    _bmiManager = [BMIGraphManager alloc];
    [_header setText:@"Enter Height"];
    [_textField setBackgroundColor:secondaryColor];
    [_textField setPlaceholder:@"cm"];
    
    
}

CGRect initHead;
CGRect initButton;
- (void)textFieldDidBeginEditing:(UITextField *)textField{
        _header.translatesAutoresizingMaskIntoConstraints = YES; _textField.translatesAutoresizingMaskIntoConstraints = YES; _doneB.translatesAutoresizingMaskIntoConstraints = YES;
    [UIView animateWithDuration:0.3 animations:^{
        initHead = _header.frame;
        initButton = _doneB.frame;
        _textField.frame = CGRectMake(_textField.frame.origin.x, _textField.frame.origin.y - 50, _textField.frame.size.width, textField.frame.size.height);
        _header.transform = CGAffineTransformMakeScale(1.4, 1.4);
        _header.frame = CGRectMake(_header.frame.origin.x, _textField.frame.origin.y -_textField.frame.size.height, _header.frame.size.width, _header.frame.size.height);
        _doneB.frame = CGRectMake(_doneB.frame.origin.x, _textField.frame.origin.y + _textField.frame.size.height + 20, _doneB.frame.size.width, _doneB.frame.size.height);
    }];
}
-(void)textFieldDidEndEditing:(UITextField*)textField{
     _header.translatesAutoresizingMaskIntoConstraints = NO; _textField.translatesAutoresizingMaskIntoConstraints = NO; _doneB.translatesAutoresizingMaskIntoConstraints = NO;
    [UIView animateWithDuration:0.3 animations:^{
        _header.frame = initHead;
        _doneB.frame = initButton;
        _header.transform = CGAffineTransformMakeScale(1, 1);
        _header.adjustsFontSizeToFitWidth = YES;
        _textField.frame = CGRectMake(_textField.frame.origin.x, _textField.frame.origin.y + 50, _textField.frame.size.width, textField.frame.size.height);
    }];
}

- (IBAction)didTap:(id)sender {
    [self.view endEditing:YES];

}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)done:(id)sender {
    if (state == 0){
        state = 1;
        h = _textField.text.intValue;
        [_textField setText:@""];
        [_header setText:@"Enter Weight"];
        _header.adjustsFontSizeToFitWidth = YES;
        [_textField setPlaceholder:@"KG"];
        
    }
    else if (state == 1){
        //send res
    }
}
@end
