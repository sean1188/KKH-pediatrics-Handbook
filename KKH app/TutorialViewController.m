//
//  TutorialViewController.m
//  KKH app
//
//  Created by Sean Lim on 1/8/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "TutorialViewController.h"

@interface TutorialViewController ()

@end

@implementation TutorialViewController

-(UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
int count;
- (void)viewDidLoad {
    [super viewDidLoad];
    _doneButton.alpha = 0;
    count = 1;
    _imgView.layer.shadowOpacity = 0.4;
    [self.view setBackgroundColor:[UIColor colorWithRed:0.3832 green:0.3832 blue:0.3832 alpha:1.0]];
    [_imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i",count]]];
    // Do any additional setup after loading the view.
}

- (IBAction)next:(id)sender {
    if (count < 7) {
        count ++;
        _guideLabel.alpha = 0;
        CGRect initFrame = _imgView.frame;
        [UIView animateWithDuration:0.3 animations:^{
            _imgView.frame = CGRectMake(-_imgView.frame.size.width - 200, 0, _imgView.frame.size.width, _imgView.frame.size.height);
        }completion:^(BOOL s ){
            [_imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i", count]]];
            _imgView.frame = CGRectMake(self.view.frame.size.width + 200, 0, _imgView.frame.size.width, _imgView.frame.size.height);
            [UIView animateWithDuration:0.3 animations:^{
                _imgView.frame = initFrame;
 
            } completion:^(BOOL s ){
                if (count == 7) {
                    _doneButton.alpha = 1;
                }
            }];
        }];
    }

}

- (IBAction)back:(id)sender {
    if (count > 1) {
        _doneButton.alpha = 0;
        count = count - 1;
        CGRect initFrame = _imgView.frame;
        [UIView animateWithDuration:0.3 animations:^{
            _imgView.frame = CGRectMake(self.view.frame.size.width + 100, 0, _imgView.frame.size.width, _imgView.frame.size.height);
        }completion:^(BOOL s ){
            [_imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i", count]]];
            _imgView.frame = CGRectMake( -_imgView.frame.size.width - 200, 0, _imgView.frame.size.width, _imgView.frame.size.height);
            [UIView animateWithDuration:0.3 animations:^{
                _imgView.frame = initFrame;
            }];
        }];
    }
}
- (IBAction)done:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"tut"];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
