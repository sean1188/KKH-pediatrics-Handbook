//
//  RATableViewCell.h
//  KKH app
//
//  Created by Seannn! on 5/3/17.
//  Copyright © 2017 tangentinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RATableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMargin;
@property (weak, nonatomic) IBOutlet UILabel *morelabel;

@end
