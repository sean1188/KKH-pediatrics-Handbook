//
//  AboutUsViewController.m
//  KKH app
//
//  Created by Sean Lim on 25/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController
-(BOOL) prefersStatusBarHidden{
    return YES;
}
-(void ) viewDidAppear:(BOOL)animated{
    _cardView.translatesAutoresizingMaskIntoConstraints = YES;
        _cardView.frame = CGRectMake(0, 200, _cardView.frame.size.width, self.view.frame.size.height - _topview.frame.size.height);
    [_scrollView setContentSize:CGSizeMake(self.view.frame.size.width,self.view.frame.size.height - _topview.frame.size.height - _backDrop.frame.size.height + _cardView.frame.size.height)];[_scrollView setScrollEnabled:  YES];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    _blurView.alpha = _scrollView.contentOffset.y/ 100;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scrollView.delegate = self;
    _blurView.alpha = 0;
    [_topview setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"secondaryColor"]]];

}

- (IBAction)doneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
