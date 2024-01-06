//
//  GJEllipseView.h
//  EllipseAnimationDemo
//
//  Created by v_guijiang on 2024/1/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GJEllipseView : UIView
@property (assign,nonatomic) CGRect ellipticRect;
@property (nonatomic, strong) NSMutableArray *leftColors;
@property (nonatomic, strong) NSMutableArray *rightColors;
@property(nonatomic, strong) CALayer *layerElliptic;
@end

NS_ASSUME_NONNULL_END
