//
//  splashAnimate.h
//
//  Code generated using QuartzCode 1.38.4 on 24/6/16.
//  www.quartzcodeapp.com
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface splashAnimate : UIView



- (void)addAnimateBearAnimation;
- (void)addAnimateBearAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)removeAnimationsForAnimationId:(NSString *)identifier;
- (void)removeAllAnimations;

@end
