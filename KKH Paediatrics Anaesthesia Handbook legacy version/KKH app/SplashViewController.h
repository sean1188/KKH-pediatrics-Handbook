//
//  SplashViewController.h
//  KKH app
//
//  Created by Sean Lim on 24/6/16.
//  Copyright © 2016 tangentinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVFoundation/AVAudioPlayer.h"


@interface SplashViewController : UIViewController{
    
    AVAudioPlayer *audioPlayer;
    
}
@property (nonatomic, retain) AVAudioPlayer *audioPlayer;


@property (strong, nonatomic) IBOutlet UILabel *inc;
@property (strong, nonatomic) IBOutlet UIImageView *bearImg;


@end
