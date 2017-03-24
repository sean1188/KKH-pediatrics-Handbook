//
//  splashAnimate.m
//
//  Code generated using QuartzCode 1.38.4 on 24/6/16.
//  www.quartzcodeapp.com
//

#import "splashAnimate.h"
#import "QCMethod.h"

@interface splashAnimate ()

@property (nonatomic, strong) NSMutableDictionary * layers;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;


@end

@implementation splashAnimate

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setupProperties];
		[self setupLayers];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self setupProperties];
		[self setupLayers];
	}
	return self;
}

- (void)setFrame:(CGRect)frame{
	[super setFrame:frame];
	[self setupLayerFrames];
}

- (void)setBounds:(CGRect)bounds{
	[super setBounds:bounds];
	[self setupLayerFrames];
}

- (void)setupProperties{
	self.completionBlocks = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsOpaqueMemory valueOptions:NSPointerFunctionsStrongMemory];;
	self.layers = [NSMutableDictionary dictionary];
	
}

- (void)setupLayers{
	self.backgroundColor = [UIColor colorWithRed:0.106 green: 0.333 blue:0.627 alpha:0];
	
	CALayer * splashscreen = [CALayer layer];
	[self.layer addSublayer:splashscreen];
	self.layers[@"splashscreen"] = splashscreen;
	
	[self resetLayerPropertiesForLayerIdentifiers:nil];
	[self setupLayerFrames];
}

- (void)resetLayerPropertiesForLayerIdentifiers:(NSArray *)layerIds{
	[CATransaction begin];
	[CATransaction setDisableActions:YES];
	
	if(!layerIds || [layerIds containsObject:@"splashscreen"]){
		CALayer * splashscreen = self.layers[@"splashscreen"];
		splashscreen.contents = (id)[UIImage imageNamed:@"splash screen"].CGImage;
	}
	
	[CATransaction commit];
}

- (void)setupLayerFrames{
	[CATransaction begin];
	[CATransaction setDisableActions:YES];
	
	CALayer * splashscreen = self.layers[@"splashscreen"];
	splashscreen.frame     = CGRectMake(0.24233 * CGRectGetWidth(splashscreen.superlayer.bounds), 0.24411 * CGRectGetHeight(splashscreen.superlayer.bounds), 0.51267 * CGRectGetWidth(splashscreen.superlayer.bounds), 0.51327 * CGRectGetHeight(splashscreen.superlayer.bounds));
	
	[CATransaction commit];
}

#pragma mark - Animation Setup

- (void)addAnimateBearAnimation{
	[self addAnimateBearAnimationCompletionBlock:nil];
}

- (void)addAnimateBearAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
	if (completionBlock){
		CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
		completionAnim.duration = 0.798;
		completionAnim.delegate = self;
		[completionAnim setValue:@"animateBear" forKey:@"animId"];
		[completionAnim setValue:@(NO) forKey:@"needEndAnim"];
		[self.layer addAnimation:completionAnim forKey:@"animateBear"];
		[self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"animateBear"]];
	}
	
	NSString * fillMode = kCAFillModeForwards;
	
	CALayer * splashscreen = self.layers[@"splashscreen"];
	
	////Splashscreen animation
	CAKeyframeAnimation * splashscreenTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	splashscreenTransformAnim.values   = @[[NSValue valueWithCATransform3D:CATransform3DIdentity], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1)], 
		 [NSValue valueWithCATransform3D:CATransform3DMakeScale(8, 8, 1)]];
	splashscreenTransformAnim.keyTimes = @[@0, @0.817, @1];
	splashscreenTransformAnim.duration = 0.798;
	
	CAKeyframeAnimation * splashscreenOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	splashscreenOpacityAnim.values   = @[@1, @1, @0];
	splashscreenOpacityAnim.keyTimes = @[@0, @0.817, @1];
	splashscreenOpacityAnim.duration = 0.798;
	
	CAAnimationGroup * splashscreenAnimateBearAnim = [QCMethod groupAnimations:@[splashscreenTransformAnim, splashscreenOpacityAnim] fillMode:fillMode];
	[splashscreen addAnimation:splashscreenAnimateBearAnim forKey:@"splashscreenAnimateBearAnim"];
}

#pragma mark - Animation Cleanup

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
	void (^completionBlock)(BOOL) = [self.completionBlocks objectForKey:anim];;
	if (completionBlock){
		[self.completionBlocks removeObjectForKey:anim];
		if ((flag && self.updateLayerValueForCompletedAnimation) || [[anim valueForKey:@"needEndAnim"] boolValue]){
			[self updateLayerValuesForAnimationId:[anim valueForKey:@"animId"]];
			[self removeAnimationsForAnimationId:[anim valueForKey:@"animId"]];
		}
		completionBlock(flag);
	}
}

- (void)updateLayerValuesForAnimationId:(NSString *)identifier{
	if([identifier isEqualToString:@"animateBear"]){
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"splashscreen"] animationForKey:@"splashscreenAnimateBearAnim"] theLayer:self.layers[@"splashscreen"]];
	}
}

- (void)removeAnimationsForAnimationId:(NSString *)identifier{
	if([identifier isEqualToString:@"animateBear"]){
		[self.layers[@"splashscreen"] removeAnimationForKey:@"splashscreenAnimateBearAnim"];
	}
}

- (void)removeAllAnimations{
	[self.layers enumerateKeysAndObjectsUsingBlock:^(id key, CALayer *layer, BOOL *stop) {
		[layer removeAllAnimations];
	}];
}

@end