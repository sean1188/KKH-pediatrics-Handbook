//
//  animationScheme.h
//
//  Code generated using QuartzCode 1.38.4 on 9/6/16.
//  www.quartzcodeapp.com
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface animationScheme : UIView



- (void)addTickToCrossAnimation;
- (void)addTickToCrossAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addArrToTickAnimation;
- (void)addArrToTickAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)removeAnimationsForAnimationId:(NSString *)identifier;
- (void)removeAllAnimations;

@end
