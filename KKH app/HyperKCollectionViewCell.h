//
//  HyperKCollectionViewCell.h
//  KKH app
//
//  Created by Seannn! on 7/2/17.
//  Copyright © 2017 tangentinc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HyperKCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *amount;
@property (weak, nonatomic) IBOutlet UILabel *message;

@end
