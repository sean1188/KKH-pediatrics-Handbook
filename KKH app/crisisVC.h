//
//  crisisVC.h
//  KKH app
//
//  Created by Sean Lim on 25/11/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface crisisVC : ViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *secondaryViewws;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *primaryViewws;

@property (strong, nonatomic) IBOutlet UIButton *weight;
- (IBAction)editWeight:(id)sender;
- (IBAction)back:(id)sender;

@end
