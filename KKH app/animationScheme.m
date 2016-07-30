//
//  animationScheme.m
//
//  Code generated using QuartzCode 1.38.4 on 9/6/16.
//  www.quartzcodeapp.com
//

#import "animationScheme.h"
#import "QCMethod.h"

@interface animationScheme ()

@property (nonatomic, strong) NSMutableDictionary * layers;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;


@end

@implementation animationScheme

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
	self.backgroundColor = [UIColor colorWithRed:0.0264 green: 0.147 blue:1 alpha:0];
	
	CAShapeLayer * rectangle = [CAShapeLayer layer];
	[self.layer addSublayer:rectangle];
	self.layers[@"rectangle"] = rectangle;
	
	CAShapeLayer * rectangle2 = [CAShapeLayer layer];
	[self.layer addSublayer:rectangle2];
	self.layers[@"rectangle2"] = rectangle2;
	
	CAShapeLayer * rectangle3 = [CAShapeLayer layer];
	[self.layer addSublayer:rectangle3];
	self.layers[@"rectangle3"] = rectangle3;
	
	[self resetLayerPropertiesForLayerIdentifiers:nil];
	[self setupLayerFrames];
}

- (void)resetLayerPropertiesForLayerIdentifiers:(NSArray *)layerIds{
	[CATransaction begin];
	[CATransaction setDisableActions:YES];
	
	if(!layerIds || [layerIds containsObject:@"rectangle"]){
		CAShapeLayer * rectangle = self.layers[@"rectangle"];
		rectangle.fillColor = [UIColor colorWithRed:0.922 green: 0.922 blue:0.922 alpha:1].CGColor;
		rectangle.lineWidth = 0;
	}
	if(!layerIds || [layerIds containsObject:@"rectangle2"]){
		CAShapeLayer * rectangle2 = self.layers[@"rectangle2"];
		[rectangle2 setValue:@(-135 * M_PI/180) forKeyPath:@"transform.rotation"];
		rectangle2.fillColor = [UIColor colorWithRed:0.922 green: 0.922 blue:0.922 alpha:1].CGColor;
		rectangle2.lineWidth = 0;
	}
	if(!layerIds || [layerIds containsObject:@"rectangle3"]){
		CAShapeLayer * rectangle3 = self.layers[@"rectangle3"];
		[rectangle3 setValue:@(-45 * M_PI/180) forKeyPath:@"transform.rotation"];
		rectangle3.fillColor = [UIColor colorWithRed:0.922 green: 0.922 blue:0.922 alpha:1].CGColor;
		rectangle3.lineWidth = 0;
	}
	
	[CATransaction commit];
}

- (void)setupLayerFrames{
	[CATransaction begin];
	[CATransaction setDisableActions:YES];
	
	CAShapeLayer * rectangle  = self.layers[@"rectangle"];
	rectangle.frame           = CGRectMake(0.25718 * CGRectGetWidth(rectangle.superlayer.bounds), 0.47199 * CGRectGetHeight(rectangle.superlayer.bounds), 0.4 * CGRectGetWidth(rectangle.superlayer.bounds), 0.05948 * CGRectGetHeight(rectangle.superlayer.bounds));
	rectangle.path            = [self rectanglePathWithBounds:[self.layers[@"rectangle"] bounds]].CGPath;
	
	CAShapeLayer * rectangle2 = self.layers[@"rectangle2"];
	rectangle2.transform      = CATransform3DIdentity;
	rectangle2.frame          = CGRectMake(0.49218 * CGRectGetWidth(rectangle2.superlayer.bounds), 0.40252 * CGRectGetHeight(rectangle2.superlayer.bounds), 0.25 * CGRectGetWidth(rectangle2.superlayer.bounds), 0.05948 * CGRectGetHeight(rectangle2.superlayer.bounds));
	[rectangle2 setValue:@(-135 * M_PI/180) forKeyPath:@"transform.rotation"];
	rectangle2.path           = [self rectangle2PathWithBounds:[self.layers[@"rectangle2"] bounds]].CGPath;
	
	CAShapeLayer * rectangle3 = self.layers[@"rectangle3"];
	rectangle3.transform      = CATransform3DIdentity;
	rectangle3.frame          = CGRectMake(0.49218 * CGRectGetWidth(rectangle3.superlayer.bounds), 0.53834 * CGRectGetHeight(rectangle3.superlayer.bounds), 0.25 * CGRectGetWidth(rectangle3.superlayer.bounds), 0.05948 * CGRectGetHeight(rectangle3.superlayer.bounds));
	[rectangle3 setValue:@(-45 * M_PI/180) forKeyPath:@"transform.rotation"];
	rectangle3.path           = [self rectangle3PathWithBounds:[self.layers[@"rectangle3"] bounds]].CGPath;
	
	[CATransaction commit];
}

#pragma mark - Animation Setup

- (void)addTickToCrossAnimation{
	[self addTickToCrossAnimationCompletionBlock:nil];
}

- (void)addTickToCrossAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
	if (completionBlock){
		CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
		completionAnim.duration = 0.3;
		completionAnim.delegate = self;
		[completionAnim setValue:@"TickToCross" forKey:@"animId"];
		[completionAnim setValue:@(NO) forKey:@"needEndAnim"];
		[self.layer addAnimation:completionAnim forKey:@"TickToCross"];
		[self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"TickToCross"]];
	}
	
	NSString * fillMode = kCAFillModeForwards;
	
	CAShapeLayer * rectangle = self.layers[@"rectangle"];
	
	////Rectangle animation
	CAKeyframeAnimation * rectangleTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
	rectangleTransformAnim.values   = @[@(-45 * M_PI/180), 
		 @(-225 * M_PI/180)];
	rectangleTransformAnim.keyTimes = @[@0, @1];
	rectangleTransformAnim.duration = 0.3;
	
	CAKeyframeAnimation * rectanglePositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	rectanglePositionAnim.values   = @[[NSValue valueWithCGPoint:CGPointMake(0.5 * CGRectGetWidth(rectangle.superlayer.bounds), 0.50173 * CGRectGetHeight(rectangle.superlayer.bounds))], [NSValue valueWithCGPoint:CGPointMake(0.5 * CGRectGetWidth(rectangle.superlayer.bounds), 0.50173 * CGRectGetHeight(rectangle.superlayer.bounds))]];
	rectanglePositionAnim.keyTimes = @[@0, @1];
	rectanglePositionAnim.duration = 0.3;
	
	CAAnimationGroup * rectangleTickToCrossAnim = [QCMethod groupAnimations:@[rectangleTransformAnim, rectanglePositionAnim] fillMode:fillMode];
	[rectangle addAnimation:rectangleTickToCrossAnim forKey:@"rectangleTickToCrossAnim"];
	
	CAShapeLayer * rectangle2 = self.layers[@"rectangle2"];
	
	////Rectangle2 animation
	CAKeyframeAnimation * rectangle2TransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	rectangle2TransformAnim.values   = @[[NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(0.6, 1, 1), CATransform3DMakeRotation(-135 * M_PI/180, -0, 0, 1))], 
		 [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(1.62, 1, 1), CATransform3DMakeRotation(-315 * M_PI/180, -0, 0, 1))]];
	rectangle2TransformAnim.keyTimes = @[@0, @1];
	rectangle2TransformAnim.duration = 0.3;
	
	CAKeyframeAnimation * rectangle2PositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	rectangle2PositionAnim.values   = @[[NSValue valueWithCGPoint:CGPointMake(0.34 * CGRectGetWidth(rectangle2.superlayer.bounds), 0.59 * CGRectGetHeight(rectangle2.superlayer.bounds))], [NSValue valueWithCGPoint:CGPointMake(0.5 * CGRectGetWidth(rectangle2.superlayer.bounds), 0.5 * CGRectGetHeight(rectangle2.superlayer.bounds))]];
	rectangle2PositionAnim.keyTimes = @[@0, @1];
	rectangle2PositionAnim.duration = 0.3;
	
	CAAnimationGroup * rectangle2TickToCrossAnim = [QCMethod groupAnimations:@[rectangle2TransformAnim, rectangle2PositionAnim] fillMode:fillMode];
	[rectangle2 addAnimation:rectangle2TickToCrossAnim forKey:@"rectangle2TickToCrossAnim"];
	
	////Rectangle3 animation
	CAKeyframeAnimation * rectangle3OpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	rectangle3OpacityAnim.values   = @[@0, @0];
	rectangle3OpacityAnim.keyTimes = @[@0, @1];
	rectangle3OpacityAnim.duration = 0.3;
	
	CAAnimationGroup * rectangle3TickToCrossAnim = [QCMethod groupAnimations:@[rectangle3OpacityAnim] fillMode:fillMode];
	[self.layers[@"rectangle3"] addAnimation:rectangle3TickToCrossAnim forKey:@"rectangle3TickToCrossAnim"];
}

- (void)addArrToTickAnimation{
	[self addArrToTickAnimationCompletionBlock:nil];
}

- (void)addArrToTickAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
	if (completionBlock){
		CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
		completionAnim.duration = 0.3;
		completionAnim.delegate = self;
		[completionAnim setValue:@"arrToTick" forKey:@"animId"];
		[completionAnim setValue:@(NO) forKey:@"needEndAnim"];
		[self.layer addAnimation:completionAnim forKey:@"arrToTick"];
		[self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"arrToTick"]];
	}
	
	NSString * fillMode = kCAFillModeForwards;
	
	CAShapeLayer * rectangle = self.layers[@"rectangle"];
	
	////Rectangle animation
	CAKeyframeAnimation * rectanglePositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	rectanglePositionAnim.values   = @[[NSValue valueWithCGPoint:CGPointMake(0.45718 * CGRectGetWidth(rectangle.superlayer.bounds), 0.50173 * CGRectGetHeight(rectangle.superlayer.bounds))], [NSValue valueWithCGPoint:CGPointMake(0.5 * CGRectGetWidth(rectangle.superlayer.bounds), 0.50173 * CGRectGetHeight(rectangle.superlayer.bounds))]];
	rectanglePositionAnim.keyTimes = @[@0, @1];
	rectanglePositionAnim.duration = 0.3;
	
	CAKeyframeAnimation * rectangleTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
	rectangleTransformAnim.values   = @[@(0), 
		 @(-45 * M_PI/180)];
	rectangleTransformAnim.keyTimes = @[@0, @1];
	rectangleTransformAnim.duration = 0.3;
	
	CAAnimationGroup * rectangleArrToTickAnim = [QCMethod groupAnimations:@[rectanglePositionAnim, rectangleTransformAnim] fillMode:fillMode];
	[rectangle addAnimation:rectangleArrToTickAnim forKey:@"rectangleArrToTickAnim"];
	
	CAShapeLayer * rectangle2 = self.layers[@"rectangle2"];
	
	////Rectangle2 animation
	CAKeyframeAnimation * rectangle2PositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	rectangle2PositionAnim.values   = @[[NSValue valueWithCGPoint:CGPointMake(0.61718 * CGRectGetWidth(rectangle2.superlayer.bounds), 0.43226 * CGRectGetHeight(rectangle2.superlayer.bounds))], [NSValue valueWithCGPoint:CGPointMake(0.34 * CGRectGetWidth(rectangle2.superlayer.bounds), 0.59 * CGRectGetHeight(rectangle2.superlayer.bounds))]];
	rectangle2PositionAnim.keyTimes = @[@0, @1];
	rectangle2PositionAnim.duration = 0.3;
	
	CAKeyframeAnimation * rectangle2TransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	rectangle2TransformAnim.values   = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation(135 * M_PI/180, 0, 0, -1)], 
		 [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(0.6, 1, 1), CATransform3DMakeRotation(-135 * M_PI/180, -0, 0, 1))]];
	rectangle2TransformAnim.keyTimes = @[@0, @1];
	rectangle2TransformAnim.duration = 0.3;
	
	CAAnimationGroup * rectangle2ArrToTickAnim = [QCMethod groupAnimations:@[rectangle2PositionAnim, rectangle2TransformAnim] fillMode:fillMode];
	[rectangle2 addAnimation:rectangle2ArrToTickAnim forKey:@"rectangle2ArrToTickAnim"];
	
	////Rectangle3 animation
	CAKeyframeAnimation * rectangle3OpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	rectangle3OpacityAnim.values   = @[@1, @0];
	rectangle3OpacityAnim.keyTimes = @[@0, @1];
	rectangle3OpacityAnim.duration = 0.3;
	
	CAAnimationGroup * rectangle3ArrToTickAnim = [QCMethod groupAnimations:@[rectangle3OpacityAnim] fillMode:fillMode];
	[self.layers[@"rectangle3"] addAnimation:rectangle3ArrToTickAnim forKey:@"rectangle3ArrToTickAnim"];
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
	if([identifier isEqualToString:@"TickToCross"]){
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"rectangle"] animationForKey:@"rectangleTickToCrossAnim"] theLayer:self.layers[@"rectangle"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"rectangle2"] animationForKey:@"rectangle2TickToCrossAnim"] theLayer:self.layers[@"rectangle2"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"rectangle3"] animationForKey:@"rectangle3TickToCrossAnim"] theLayer:self.layers[@"rectangle3"]];
	}
	else if([identifier isEqualToString:@"arrToTick"]){
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"rectangle"] animationForKey:@"rectangleArrToTickAnim"] theLayer:self.layers[@"rectangle"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"rectangle2"] animationForKey:@"rectangle2ArrToTickAnim"] theLayer:self.layers[@"rectangle2"]];
		[QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"rectangle3"] animationForKey:@"rectangle3ArrToTickAnim"] theLayer:self.layers[@"rectangle3"]];
	}
}

- (void)removeAnimationsForAnimationId:(NSString *)identifier{
	if([identifier isEqualToString:@"TickToCross"]){
		[self.layers[@"rectangle"] removeAnimationForKey:@"rectangleTickToCrossAnim"];
		[self.layers[@"rectangle2"] removeAnimationForKey:@"rectangle2TickToCrossAnim"];
		[self.layers[@"rectangle3"] removeAnimationForKey:@"rectangle3TickToCrossAnim"];
	}
	else if([identifier isEqualToString:@"arrToTick"]){
		[self.layers[@"rectangle"] removeAnimationForKey:@"rectangleArrToTickAnim"];
		[self.layers[@"rectangle2"] removeAnimationForKey:@"rectangle2ArrToTickAnim"];
		[self.layers[@"rectangle3"] removeAnimationForKey:@"rectangle3ArrToTickAnim"];
	}
}

- (void)removeAllAnimations{
	[self.layers enumerateKeysAndObjectsUsingBlock:^(id key, CALayer *layer, BOOL *stop) {
		[layer removeAllAnimations];
	}];
}

#pragma mark - Bezier Path

- (UIBezierPath*)rectanglePathWithBounds:(CGRect)bound{
	UIBezierPath * rectanglePath = [UIBezierPath bezierPathWithRect:bound];
	return rectanglePath;
}

- (UIBezierPath*)rectangle2PathWithBounds:(CGRect)bound{
	UIBezierPath * rectangle2Path = [UIBezierPath bezierPathWithRect:bound];
	return rectangle2Path;
}

- (UIBezierPath*)rectangle3PathWithBounds:(CGRect)bound{
	UIBezierPath * rectangle3Path = [UIBezierPath bezierPathWithRect:bound];
	return rectangle3Path;
}


@end