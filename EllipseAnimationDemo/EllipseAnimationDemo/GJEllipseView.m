//
//  GJEllipseView.m
//  EllipseAnimationDemo
//
//  Created by v_guijiang on 2024/1/2.
//

#import "GJEllipseView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation GJEllipseView
CALayer* _layerBase;
CAGradientLayer *_gradientLayerLeft;
CAGradientLayer *_gradientLayerRight;
UIBezierPath *_arcBezierPath;
CAShapeLayer *_shapeLayer;
CALayer *_gradinetLayer;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _layerBase = [CALayer layer];
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    

        _ellipticRect = rect;
    CGRect aa = CGRectMake(_ellipticRect.origin.x-(_ellipticRect.size.height-_ellipticRect.size.width)/2-5, _ellipticRect.origin.y-5, _ellipticRect.size.height+10, _ellipticRect.size.height+10);
   
    _layerBase.frame = aa;
    _layerBase.backgroundColor = [UIColor clearColor].CGColor;
    _layerBase.masksToBounds = NO;
    
    _arcBezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake((_ellipticRect.size.height-_ellipticRect.size.width)/2+5, 5, _ellipticRect.size.width, _ellipticRect.size.height)];
   
    //圆环遮罩
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    _shapeLayer.lineWidth = 5;
    _shapeLayer.strokeStart = 0;
    _shapeLayer.strokeEnd = 1;
    _shapeLayer.lineCap = kCALineCapRound;
    _shapeLayer.lineDashPhase = 0.8;
    _shapeLayer.path = _arcBezierPath.CGPath;
    _shapeLayer.masksToBounds = NO;
    [_layerBase setMask:_shapeLayer];
    
    [self.layer addSublayer:_layerBase];
//    [self.layer addSublayer:_shapeLayer];
    
    
    _gradinetLayer = [CALayer layer];
    _gradinetLayer.frame = CGRectMake(0, 0, aa.size.height, aa.size.height);
    _gradinetLayer.backgroundColor = [UIColor clearColor].CGColor;
    _gradinetLayer.masksToBounds = NO;
    [_layerBase addSublayer:_gradinetLayer];
    
    
    _gradientLayerLeft = [CAGradientLayer layer];
    _gradientLayerLeft.shadowPath = _arcBezierPath.CGPath;
    _gradientLayerLeft.frame = CGRectMake(0, 0, aa.size.height, aa.size.height/2);
    _gradientLayerLeft.startPoint = CGPointMake(0, 0);
    _gradientLayerLeft.endPoint = CGPointMake(1, 0);
    [_gradientLayerLeft setColors:[NSArray arrayWithArray:_leftColors]];
//    _gradientLayerLeft.locations = @[@0.1,@0.3,@0.6,@1];
    [_gradinetLayer addSublayer:_gradientLayerLeft];
    
    _gradientLayerRight = [CAGradientLayer layer];
    _gradientLayerRight.shadowPath = _arcBezierPath.CGPath;
    _gradientLayerRight.frame = CGRectMake(_ellipticRect.origin.x, aa.size.height/2, aa.size.height, aa.size.height/2);
    _gradientLayerRight.startPoint = CGPointMake(1, 1);
    _gradientLayerRight.endPoint = CGPointMake(0, 1);
    [_gradientLayerRight setColors:[NSArray arrayWithArray:_rightColors]];
    [_gradinetLayer addSublayer:_gradientLayerRight];
    
    
    //    CGContextRestoreGState(context);
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = [NSNumber numberWithFloat:0];
    rotationAnimation.toValue = [NSNumber numberWithFloat:2.0*M_PI];
    rotationAnimation.repeatCount = MAXFLOAT;
    rotationAnimation.duration = 5;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [_gradinetLayer addAnimation:rotationAnimation forKey:@"rotationAnnimation"];
    //
}
- (void)setLeftColors:(NSMutableArray *)leftColors{
    _leftColors = [leftColors copy];
    _gradientLayerLeft.colors = _leftColors;
//    [self setNeedsDisplay];
}
- (void)setRightColors:(NSMutableArray *)rightColors{
    _rightColors = rightColors;
    _gradientLayerRight.colors = _rightColors;
//    [self setNeedsDisplay];
}
- (void)setEllipticRect:(CGRect)ellipticRect{
    _ellipticRect = ellipticRect;
//    [self setNeedsDisplay];
    
    CGRect aa = CGRectMake(0-(_ellipticRect.size.height-_ellipticRect.size.width)/2-5, 0-5, _ellipticRect.size.height+10, _ellipticRect.size.height+10);
    _layerBase.frame = aa;
    _arcBezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake((_ellipticRect.size.height-_ellipticRect.size.width)/2+5, 5, _ellipticRect.size.width, _ellipticRect.size.height)];
    _shapeLayer.path = _arcBezierPath.CGPath;
    
    _gradinetLayer.frame = CGRectMake(0, 0, aa.size.height, aa.size.height);
    _gradientLayerLeft.frame = CGRectMake(0, 0, aa.size.height, aa.size.height/2);
    _gradientLayerRight.frame = CGRectMake(0, aa.size.height/2, aa.size.height, aa.size.height/2);
    
}
-(void)move{

   
    // apply it
   

 }
@end

